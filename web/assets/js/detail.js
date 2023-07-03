import Validator from "./validator.js";
import toast from "./toast.js";
import sendRequest from "./request.js";
import handleQuantity from "./quantity.js";

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const detailFormEl = $(".detail__form");
const addCartSubmit = $(".detail__btn-add-cart");
const detailBtnPlus = $(".detail__btn--plus");
const detailBtnMinus = $(".detail__btn--minus");
const detailQtyInput = $(".detail__qty-input");
const detailImgItems = $$(".detail__image-item");
const detailImgsLength = detailImgItems.length;
const detailImgBtnPrev = $(".detail__image-btn--prev");
const detailImgBtnNext = $(".detail__image-btn--next");
const detailImgs = $$(".detail__image");
const detailImgMain = $(".detail__main-img");
const detailImgWrapper = $(".detail__images-wrapper");
const detailColorList = $$(".detail__radio--color");
const detailSizeList = $$(".detail__radio--size");
let detailQtyValue = $(".detail__qty-value");
let detailMainPrice = $(".detail__price--main");
let detailDiscountPrice = $(".detail__price--discount");
let detailPriceOrigin = $(".detail__price-origin");
let detailQuantityOrigin = $(".detail__qty-origin");

export default {
    originPrice: detailPriceOrigin,
    originQuantity: detailQuantityOrigin,
    quantity: 1,
    counter: 0,
    length: detailImgsLength,
    colorList: [],
    data: new Map(),

    getParent(element, selector) {
        while (element.parentElement) {
            if (element.parentElement.matches(selector)) {
                return element.parentElement;
            } else {
                element = element.parentElement;
            }
        }
    },

    getQuantity() {
        if (detailQtyValue) {
            const regex = /\d+/;
            const matches = detailQtyValue.innerHTML.match(regex);
            if (matches) {
                return parseInt(matches[0], 10);
            }
        }
    },

    handleEvents() {
        if (detailQtyInput) {
            handleQuantity(
                detailQtyInput,
                this.quantity,
                this.getQuantity.bind(this),
                detailBtnPlus,
                detailBtnMinus
            );
        }

        // Product variant: color
        if (detailColorList) {
            const url = "MainController?action=Size";
            const object = {
                variant: "variantSize",
                code: "sizeId",
            };
            this.isRadioCheck(detailColorList, detailSizeList, url, object);
        }

        // Product variant: size
        if (detailSizeList) {
            const url = "MainController?action=Color";
            const object = {
                variant: "variantColor",
                code: "colorId",
            };
            this.isRadioCheck(detailSizeList, detailColorList, url, object);
        }

        // Images
        if (detailImgBtnPrev) {
            detailImgBtnPrev.onclick = () => {
                if (this.counter > 0) {
                    this.counter--;
                    this.slider();
                }
            };
        }

        if (detailImgBtnNext) {
            detailImgBtnNext.onclick = () => {
                if (this.counter < detailImgsLength - 4) {
                    this.counter++;
                    this.slider();
                }
            };
        }

        if (detailImgs) {
            Array.from(detailImgs).forEach((item, index) => {
                item.onclick = (e) => {
                    detailImgMain.src = e.target.src;
                    if ($(".detail__image-item.detail__image-item--active")) {
                        $(
                            ".detail__image-item.detail__image-item--active"
                        ).classList.remove("detail__image-item--active");
                    }
                    detailImgItems[index].classList.add(
                        "detail__image-item--active"
                    );
                };
            });
        }

        // Handle add to cart
        if (addCartSubmit) {
            addCartSubmit.onclick = () => {
                const isColorList = this.isRadioListSelected(detailColorList);
                const isSizeList = this.isRadioListSelected(detailSizeList);
                if (!isColorList || !isSizeList) {
                    toast({
                        title: "Error!",
                        message: "Please select a size and color.",
                        type: "error",
                        duration: 3000,
                    });
                    if (!isColorList) {
                        this.isFormSubmit(detailColorList);
                    }

                    if (!isSizeList) {
                        this.isFormSubmit(detailSizeList);
                    }
                }
            };
        }
    },

    isFormSubmit(list) {
        Array.from(list).forEach((item) => {
            item.parentElement.classList.add("detail__label--empty");

            item.onchange = () => {
                Array.from(list).forEach((item) => {
                    item.parentElement.classList.remove("detail__label--empty");
                });
            };
        });
    },

    renderByVariant(
        productVariantId,
        price = this.originPrice.value,
        quantity = this.originQuantity.value
    ) {
        detailFormEl.setAttribute("data-pv-id", productVariantId);
        detailMainPrice.innerHTML = "$" + price;
        detailDiscountPrice.innerHTML = "$" + price;
        detailQtyValue.innerHTML = quantity + " product(s) are available";

        if (Number(detailQtyInput.value) > quantity) {
            this.quantity = quantity;
            detailQtyInput.value = this.quantity;
        }
    },

    isRadioListSelected(radioList) {
        for (let i = 0; i < radioList.length; i++) {
            if (radioList[i].checked) {
                return radioList[i];
            }
        }
        return false;
    },

    isRadioListsSelected(list, subList) {
        let checkList = this.isRadioListSelected(list);
        let checkSubList = this.isRadioListSelected(subList);

        if (checkList && checkSubList) {
            this.data.forEach((element) => {
                if (
                    (checkList.id === element.variantColor.colorName &&
                        checkSubList.id === element.variantSize.sizeName) ||
                    (checkSubList.id === element.variantColor.colorName &&
                        checkList.id === element.variantSize.sizeName)
                ) {
                    this.renderByVariant(
                        element.productVariantId,
                        element.price,
                        element.quantity
                    );
                }
            });
        }
    },

    isRadioListsEmpty(list, subList) {
        let checkList = this.isRadioListSelected(list);
        let checkSubList = this.isRadioListSelected(subList);

        if (!checkList && !checkSubList) {
            Array.from(detailColorList).forEach((item) => {
                item.parentElement.classList.remove("detail__label--hidden");
                item.parentElement.classList.add("btn-effect");
                item.disabled = false;
            });

            Array.from(detailSizeList).forEach((item) => {
                item.parentElement.classList.remove("detail__label--hidden");
                item.parentElement.classList.add("btn-effect");
                item.disabled = false;
            });

            this.renderByVariant();
        }
    },

    isRadioCheck(list, subList, url, object) {
        let lastChecked = null;
        Array.from(list).forEach((item) => {
            item.onclick = () => {
                if (item === lastChecked) {
                    // Nếu radio button đã được chọn trước đó, bỏ chọn nó
                    item.checked = false;
                    lastChecked = null;
                } else {
                    // Nếu radio button chưa được chọn trước đó, kiểm tra nó và lưu trạng thái
                    item.checked = true;
                    lastChecked = item;

                    const productId = this.getParent(
                        item,
                        ".detail__form"
                    ).getAttribute("data-product-id");
                    const data = new URLSearchParams();

                    data.set("productId", productId);
                    data.set("code", item.value);

                    sendRequest(url, "POST", data)
                        .then((data) => {
                            let variantList = [];

                            data.forEach((element) => {
                                this.data.set(
                                    element.productVariantId,
                                    element
                                );
                                if (element[object.variant]) {
                                    variantList.push(
                                        element[object.variant][object.code]
                                    );
                                }
                            });

                            Array.from(subList).forEach((item) => {
                                if (!variantList.includes(Number(item.value))) {
                                    item.parentElement.classList.add(
                                        "detail__label--hidden"
                                    );
                                    item.parentElement.classList.remove(
                                        "btn-effect"
                                    );
                                    item.disabled = true;
                                } else {
                                    item.parentElement.classList.remove(
                                        "detail__label--hidden"
                                    );
                                    item.parentElement.classList.add(
                                        "btn-effect"
                                    );
                                    item.disabled = false;
                                }
                            });
                        })
                        .catch((error) => {
                            console.error("Error:", error);
                        });
                }

                this.isRadioListsSelected(list, subList);
                this.isRadioListsEmpty(list, subList);
            };
        });
    },

    renderImages() {
        if (detailImgMain) {
            detailImgMain.src = detailImgs[0].src;
        }

        if (detailImgItems.length > 0) {
            if (this.length <= 4) {
                detailImgBtnPrev.style.display = "none";
                detailImgBtnNext.style.display = "none";
                detailImgWrapper.style.justifyContent = "flex-start";
            }

            if (this.length === 1) {
                detailImgWrapper.style.display = "none";
            }

            Array.from(detailImgItems).forEach((item, index) => {
                item.style.left = `${index * 118}px`;
            });
        }
    },

    slider() {
        if (detailImgItems) {
            Array.from(detailImgItems).forEach((item) => {
                item.style.transform = `translateX(-${this.counter * 118}px)`;
            });
        }
    },

    sliderPrev() {
        this.counter++;
        this.slider();
    },

    start() {
        this.renderImages();
        this.handleEvents();
    },
};
