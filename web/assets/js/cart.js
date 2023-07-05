import Validator from "./validator.js";
import toast from "./toast.js";
import sendRequest from "./request.js";
import handleQuantity from "./quantity.js";

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const productList = $(".product__list");
const detailFormEl = $(".detail__form");
const detailForm = new Validator(".detail__form");
const cartQtyInputs = $$(".cart__header-qty-input");
const cartBtnPlus = $$(".cart__header-btn--increase");
const cartBtnMinus = $$(".cart__header-btn--decrease");
const cartUpdateButtons = $$(".cart__header-link--update");
let cartValue = $(".header__icon-value--cart");

export default {
    quantity: 0,

    getQuantity() {
        if (cartValue) {
            const regex = /\d+/;
            const matches = cartValue.innerHTML.match(regex);
            if (matches) {
                this.quantity = parseInt(matches[0], 10);
            }
        }
    },

    modify() {
        cartValue.innerHTML = `(${this.quantity})`;
    },

    increase() {
        this.quantity++;
        this.modify();
    },

    observeInnerHTMLChanges(element, callback) {
        // Tạo một instance của Mutation Observer
        const observer = new MutationObserver((mutationsList, observer) => {
            // Xử lý các thay đổi tại đây
            callback();
        });

        // Thiết lập các tùy chọn cho Mutation Observer
        const observerOptions = {
            childList: true, // Theo dõi các thay đổi trong các phần tử con
            subtree: true, // Theo dõi các thay đổi trong toàn bộ cây DOM con
        };

        // Bắt đầu theo dõi
        observer.observe(element, observerOptions);
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

    addToCart(url, customerId, productId, productVariantId, quantity) {
        const data = new URLSearchParams();

        data.set("customerId", customerId);
        data.set("productId", productId);
        data.set("productVariantId", productVariantId);
        data.set("quantity", quantity);

        sendRequest(url, "POST", data)
            .then((data) => {
                if (data.CART_SUCCESS) {
                    if (this.quantity !== data.CART.length) {
                        this.increase();
                    }

                    toast({
                        title: "Success!",
                        message: data.CART_SUCCESS,
                        type: "success",
                        duration: 3000,
                    });
                } else if (data.CART_ERROR_QUANTITY) {
                    toast({
                        title: "Error!",
                        message: data.CART_ERROR_QUANTITY,
                        type: "error",
                        duration: 3000,
                    });
                } else if (data.CART_ERROR_LOGIN) {
                    toast({
                        title: "Error!",
                        message: data.CART_ERROR_QUANTITY,
                        type: "error",
                        duration: 3000,
                    });
                }
            })
            .catch((error) => {
                console.error("Error:", error);
            });
    },

    clickAddToCart() {
        const addToCartBtn = $$(".product__item-action");
        Array.from(addToCartBtn).forEach((button) => {
            button.onclick = () => {
                const url = "MainController?action=AddToCart";
                const item = this.getParent(button, ".product__item");
                const customerId =
                    $(".header__icons")?.getAttribute("data-customer-id");
                const productId = item.getAttribute("data-p-id");
                const productVariantId = item.getAttribute("data-pv-id");

                if (!customerId) {
                    window.location.href = "./login.jsp";
                } else {
                    this.addToCart(
                        url,
                        customerId,
                        productId,
                        productVariantId,
                        1
                    );
                }
            };
        });
    },

    handleEvents() {
        if (productList) {
            this.clickAddToCart();
            this.observeInnerHTMLChanges(
                productList,
                this.clickAddToCart.bind(this)
            );
        }

        if (detailForm) {
            detailForm.onSubmit = (formData) => {
                const url = "MainController?action=AddToCart";
                const customerId =
                    $(".header__icons")?.getAttribute("data-customer-id");
                const productId = detailFormEl.getAttribute("data-product-id");
                const productVariantId =
                    detailFormEl.getAttribute("data-pv-id");

                if (!customerId) {
                    window.location.href = "./login.jsp";
                } else {
                    this.addToCart(
                        url,
                        customerId,
                        productId,
                        productVariantId,
                        formData.quantity
                    );
                }
            };
        }

        if (cartQtyInputs) {
            Array.from(cartQtyInputs).forEach((input, index) => {
                function getQuantity() {
                    return input.getAttribute("data-pv-qty");
                }

                function setUpdateLink() {
                    cartUpdateButtons[index].setAttribute(
                        "href",
                        cartUpdateButtons[index].href.replace(
                            /qty=\d+/,
                            "qty=" + input.value
                        )
                    );
                }

                handleQuantity(
                    input,
                    input.value,
                    getQuantity.bind(this),
                    cartBtnPlus[index],
                    cartBtnMinus[index],
                    setUpdateLink.bind(this)
                );
            });
        }
    },

    start() {
        this.getQuantity();
        this.handleEvents();
    },
};
