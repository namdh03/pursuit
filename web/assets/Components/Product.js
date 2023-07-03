import html from "../js/render.js";
import Validator from "../js/validator.js";
import toast from "../js/toast.js";
import sendRequest from "../js/request.js";

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);
const productListEl = $(".product__list");
const productMoreBtn = $(".product__more-btn");

export default {
    url: "MainController?action=LoadMore",
    data: new URLSearchParams(),
    page: 1,
    size: 9,
    search: $(".header__search-input"),

    async getProductList() {
        this.page++;
        this.data.set("page", this.page);
        this.data.set("size", this.size);
        this.data.set("search", this.search.value);
        return await sendRequest(this.url, "POST", this.data);
    },

    getParent(element, selector) {
        while (element.parentElement) {
            if (element.parentElement.matches(selector)) {
                return element.parentElement;
            } else {
                element = element.parentElement;
            }
        }
    },

    async render() {
        if (productMoreBtn) {
            productMoreBtn.onclick = async () => {
                const divEl = document.createElement("div");
                let list = await this.getProductList();

                if (Math.ceil(list.totalProducts / this.size) === this.page) {
                    productMoreBtn.parentElement.setAttribute("class", "");
                    productMoreBtn.parentElement.classList.add(
                        "col",
                        "l-0",
                        "m-0",
                        "c-0"
                    );
                }

                divEl.setAttribute("class", "row row--gap-30 lg-gutter");
                divEl.innerHTML = html`
                    ${list.productList.map((item) => {
                        return html`
                            <div class="col l-4 m-4 c-4">
                                <article
                                    class="product__item"
                                    data-p-id="${item.productId}"
                                    data-pv-id="${item.productVariant
                                        .productVariantId}"
                                >
                                    <div class="product__item-header">
                                        <a
                                            href="MainController?action=Detail&productId=${item.productId}"
                                            class="product__item-link"
                                        >
                                            <img
                                                src="${item.imageUrl}"
                                                alt="${item.productName}"
                                                class="product__item-img"
                                                loading="lazy"
                                            />
                                        </a>
                                        <button
                                            class="product__item-action paragraph paragraph--tertiary btn btn--secondary btn-effect"
                                        >
                                            Add to cart
                                        </button>
                                    </div>

                                    <section class="product__item-body">
                                        <div class="product__item-row">
                                            <a
                                                href="MainController?action=Product&categoryID=${item
                                                    .category.categoryId}"
                                                class="product__item-category paragraph paragraph--secondary"
                                            >
                                                ${item.category.categoryName}
                                            </a>
                                        </div>

                                        <div class="product__item-row">
                                            <a
                                                href="MainController?action=Detail&productId=${item.productId}"
                                                class="product__item-link"
                                            >
                                                <h2
                                                    class="product__item-title heading heading--quaternary"
                                                >
                                                    ${item.productName}
                                                </h2>
                                            </a>

                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="20"
                                                height="17"
                                                viewBox="0 0 20 17"
                                                fill="var(--heart-color)"
                                                class="product__item-icon"
                                            >
                                                <path
                                                    id="Vector"
                                                    d="M9.28469 2.93289L9.99818 3.65946L10.7117 2.93289C11.5744 2.0544 12.9509 1 14.4264 1C15.8371 1 16.9711 1.47502 17.7472 2.22871C18.5211 2.98034 19 4.06744 19 5.41255C19 6.86866 18.4185 8.09645 17.4603 9.25823C16.4829 10.4434 15.1706 11.4943 13.7759 12.606C13.7759 12.606 13.7758 12.6061 13.7758 12.6061L13.7527 12.6245C12.4865 13.6334 11.0917 14.7447 9.99867 15.9918C8.91637 14.755 7.53442 13.6523 6.27906 12.6506L6.22374 12.6065L6.22334 12.6061C4.82824 11.494 3.51605 10.4428 2.53897 9.25769C1.58118 8.09595 1 6.86833 1 5.41255C1 4.06745 1.47886 2.98037 2.25289 2.22875C3.02906 1.47506 4.16325 1 5.57455 1C7.04848 1 8.42122 2.0536 9.28469 2.93289Z"
                                                    stroke="currentColor"
                                                    stroke-width="2"
                                                />
                                            </svg>
                                        </div>

                                        <div class="product__item-row">
                                            <div class="product__item-rating">
                                                <img
                                                    src="./assets/icons/star.svg"
                                                    alt=""
                                                    class="product__item-rating-icon"
                                                />

                                                <p
                                                    class="product__item-rating-value paragraph paragraph--primary"
                                                >
                                                    5.0 (18)
                                                </p>
                                            </div>

                                            <p
                                                class="product__item-price button-text"
                                            >
                                                ${item.productVariant.price}
                                            </p>
                                        </div>
                                    </section>
                                </article>
                            </div>
                        `;
                    })}
                `;

                productListEl.appendChild(divEl);
            };
        }
    },

    async start() {
        await this.render();
    },
};
