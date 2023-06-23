import html from "../js/render.js";
import Validator from "../js/validator.js";
import toast from "../js/toast.js";
import sendRequest from "../js/request.js";

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);
const productComponent = $(".product");

export default {
    url: "MainController?action=Product",
    data: new URLSearchParams(),
    page: 1,
    size: 9,

    async getProductList() {
        this.data.append("page", this.page);
        this.data.append("size", this.size);
        return await sendRequest(this.url, "POST", this.data);
    },

    async getProducts() {
        const list = await this.getProductList();
        console.log(list);
        return list.map((item) => {
            return html`
                <div class="col l-4 m-4 c-4">
                    <article class="product__item">
                        <div class="product__item-img-wrapper">
                            <a href="#!" class="product__link">
                                <img
                                    src="./assets/imgs/product.png"
                                    alt=""
                                    class="product__item-img"
                                />
                            </a>
                            <button
                                class="product__item-add paragraph paragraph--tertiary btn btn--primary btn-effect"
                            >
                                Add to cart
                            </button>
                        </div>
                        <section class="product__item-content">
                            <div class="product__item-header">
                                <a
                                    href="#!"
                                    class="product__category paragraph paragraph--tertiary"
                                >
                                    ${item.category.categoryName}
                                </a>

                                <a href="#!" class="product__wishlist">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="15"
                                        height="13"
                                        viewBox="0 0 15 13"
                                        fill="currentColor"
                                    >
                                        <path
                                            id="Vector"
                                            d="M6.7722 2.13924L7.29262 2.66919L7.81304 2.13924C8.44228 1.49847 9.44635 0.729394 10.5225 0.729394C11.5515 0.729394 12.3786 1.07587 12.9447 1.62561C13.5092 2.17384 13.8585 2.96677 13.8585 3.94788C13.8585 5.00996 13.4343 5.90551 12.7355 6.7529C12.0226 7.61733 11.0654 8.38388 10.0481 9.19474C10.0481 9.19478 10.048 9.19481 10.048 9.19484L10.0311 9.20827C9.10759 9.9441 8.09023 10.7547 7.29297 11.6643C6.50355 10.7622 5.49557 9.95792 4.57991 9.22729L4.53956 9.19509L4.53927 9.19485C3.52169 8.38368 2.56459 7.61694 1.85191 6.75251C1.1533 5.90514 0.729394 5.00973 0.729394 3.94788C0.729394 2.96677 1.07868 2.17386 1.64325 1.62564C2.20938 1.0759 3.03665 0.729394 4.06604 0.729394C5.14112 0.729394 6.14239 1.49789 6.7722 2.13924Z"
                                            stroke="#566363"
                                            stroke-width="1.45879"
                                        />
                                    </svg>
                                </a>
                            </div>
                            <a href="#!" class="product__name button-text">
                                ${item.productName}
                            </a>
                            <p
                                class="product__price paragraph paragraph--secondary"
                            >
                                $${item.productVariant.price}
                            </p>
                            <div class="product__item-footer">
                                <img
                                    src="./assets/icons/stars.svg"
                                    alt=""
                                    class="product__rating-icon"
                                />
                                <span
                                    class="product__rating-value paragraph paragraph--tertiary"
                                >
                                    (540 reviews)
                                </span>
                            </div>
                        </section>
                    </article>
                </div>
            `;
        });
    },

    async render() {
        if (productComponent) {
            productComponent.innerHTML = html`
                <div class="product__header">
                    <h1 class="product__title heading heading--secondary">
                        Product List
                    </h1>
                    <p class="product__desc paragraph paragraph--secondary">
                        We hear what you need. We plan, design & develop
                        visionary concept websites.
                    </p>
                </div>

                <div class="product__body">
                    <div class="grid wide">
                        <div class="row lg-gutter">
                            <div class="col l-9 m-9 c-9">
                                <div class="product__filter">
                                    <p
                                        class="product__filter-result paragraph paragraph--secondary"
                                    >
                                        Showing 1-15 of 22 results
                                    </p>

                                    <button
                                        class="product__sort-wrapper btn-effect"
                                    >
                                        <span
                                            class="product__sort-value paragraph paragraph--primary"
                                        >
                                            Sort by latest
                                        </span>
                                        <svg
                                            width="10"
                                            height="6"
                                            viewBox="0 0 10 6"
                                            fill="none"
                                            xmlns="http://www.w3.org/2000/svg"
                                            class="product__sort-icon"
                                        >
                                            <path
                                                id="Vector 1"
                                                d="M1 1L5 5L9 1"
                                                stroke="currentColor"
                                                stroke-width="1.5"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                            />
                                        </svg>
                                    </button>
                                </div>

                                <div class="product__list">
                                    <div class="row lg-gutter row--gap-40">
                                        ${await this.getProducts()}
                                    </div>
                                </div>
                            </div>

                            <div class="col l-3 m-3 c-3"></div>
                        </div>
                    </div>
                </div>
            `;
        }
    },

    start() {
        this.render();
    },
};
