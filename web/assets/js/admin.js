import html from "../js/render.js";
import Validator from "./validator.js";
import toast from "./toast.js";
import sendRequest from "./request.js";

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const currentURL = window.location.href;
const lastSlashIndex = currentURL.lastIndexOf("/");
const fileName = currentURL.substring(lastSlashIndex + 1);
const adminTableProduct = $(".admin__table--product");
const adminTablePV = $(".admin__table--product-variant");
const adminPopup = $(".admin__popup");
const adminPopupPV = $(".admin__popup--pv");
const pagination = $(".pagination");
const adminBtnUpdate = $$(".admin__btn-update");
const adminBtnView = $$(".admin__btn-view");
const adminBtnCancel = $(".admin__form-button--cancel");
const adminBtnSubmit = $(".admin__form-button--submit");
const adminTrItem = $$(".admin__tr-item");
const adminProductName = $$(".admin__product-name");
const adminProductCategory = $$(".admin__product-category");
const adminProductDescription = $$(".admin__product-description");
const adminProductUIS = $$(".admin__product-uis");
const adminProductUOO = $$(".admin__product-uoo");
const adminProductDiscontinued = $$(".admin__product-discontinued");
const pageActive = $(".pagination__link--active");
const action = $("#action");
const page = $("#page");
const productId = $("#productId");
const productName = $("#productName");
const category = $$("#category > option");
const unitsInStock = $("#unitsInStock");
const unitsOnOrder = $("#unitsOnOrder");
const discontinued = $$("#discontinued > option");
const description = $("#description");
const createProductBtn = $(".admin__table-btn--create-product");
const createProductVariantBtn = $(".admin__table-btn--create-pv");
const isDefault = $$("#default > option");
const sizeId = $$("#sizeId > option");
const colorId = $$("#colorId > option");
const price = $("#price");
const quantity = $("#quantity");
const actionPV = $("#actionPV");
const pagePV = $("#pagePV");
const productIdPV = $("#productIdPV");
const productVariantId = $("#productVariantId");

export default {
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

    redirect() {
        if (fileName === "admin.jsp") {
            window.location.href =
                "MainController?action=Product&location=admin&flag=true";
        }
    },

    resetFormProduct() {
        if (pageActive) {
            page.setAttribute("value", pageActive.innerHTML.trim());
        }

        productId.setAttribute("value", "");

        productName.setAttribute("value", "");

        Array.from(category).forEach((option) => {
            option.removeAttribute("selected");
        });

        unitsInStock.setAttribute("value", "0");
        unitsInStock.setAttribute("readonly", true);
        unitsOnOrder.setAttribute("value", "0");
        unitsOnOrder.setAttribute("readonly", true);

        Array.from(discontinued).forEach((option) => {
            option.removeAttribute("selected");
        });

        description.setAttribute("value", "");
    },

    resetFormProductVariant() {
        Array.from(isDefault).forEach((option) => {
            option.removeAttribute("selected");
        });

        Array.from(sizeId).forEach((option) => {
            option.removeAttribute("selected");
        });

        Array.from(colorId).forEach((option) => {
            option.removeAttribute("selected");
        });

        price.setAttribute("value", "");
        quantity.setAttribute("value", "");
        productVariantId.setAttribute("value", "");
    },

    handleEvents() {
        if (adminBtnCancel) {
            adminBtnCancel.onclick = () => {
                adminPopup.classList.remove("admin__popup--active");
            };
        }

        // Update Product
        if (adminBtnUpdate) {
            Array.from(adminBtnUpdate).forEach((btn, index) => {
                btn.onclick = () => {
                    if (pageActive) {
                        page.setAttribute("value", pageActive.innerHTML.trim());
                    }

                    productId.setAttribute(
                        "value",
                        adminTrItem[index].getAttribute("data-pid")
                    );

                    productName.setAttribute(
                        "value",
                        adminProductName[index].innerHTML.trim()
                    );

                    Array.from(category).forEach((option) => {
                        if (
                            option.value ===
                            adminProductCategory[index].getAttribute(
                                "data-category-id"
                            )
                        ) {
                            option.setAttribute("selected", true);
                        } else {
                            option.removeAttribute("selected");
                        }
                    });

                    unitsInStock.setAttribute(
                        "value",
                        adminProductUIS[index].innerHTML.trim()
                    );
                    unitsInStock.setAttribute("readonly", true);

                    unitsOnOrder.setAttribute(
                        "value",
                        adminProductUOO[index].innerHTML.trim()
                    );
                    unitsOnOrder.setAttribute("readonly", true);

                    Array.from(discontinued).forEach((option) => {
                        if (
                            option.value ===
                            adminProductDiscontinued[index].getAttribute(
                                "data-discontinued-id"
                            )
                        ) {
                            option.setAttribute("selected", true);
                        } else {
                            option.removeAttribute("selected");
                        }
                    });

                    description.setAttribute(
                        "value",
                        adminProductDescription[index].innerHTML
                            .replace(/\s+/g, " ")
                            .trim()
                    );

                    action.setAttribute("value", "UpdateProduct");

                    adminPopup.classList.add("admin__popup--active");
                };
            });
        }

        // Create Product
        if (createProductBtn) {
            createProductBtn.onclick = () => {
                this.resetFormProduct();
                adminPopup.classList.add("admin__popup--active");
                action.setAttribute("value", "CreateProduct");
            };
        }

        // View Product Variant
        if (adminBtnView) {
            Array.from(adminBtnView).forEach((button, index) => {
                button.onclick = () => {
                    const url = "MainController?action=GetPVList";
                    const data = new URLSearchParams();
                    data.append(
                        "productId",
                        adminTrItem[index].getAttribute("data-pid")
                    );

                    sendRequest(url, "POST", data)
                        .then((data) => {
                            let tbody = document.querySelector("tbody");
                            let html = "";

                            for (let value of Object.values(data)) {
                                const trHtml = `
                                    <tr
                                        class="admin__tr-item"
                                        data-product-id="${
                                            value[0].productVariant.product
                                                .productId
                                        }"
                                        data-pv-id="${
                                            value[0].productVariant
                                                .productVariantId
                                        }"
                                        data-page-index="${pageActive?.innerHTML.trim()}"
                                    >
                                        <td class="admin__btn-update--pv">
                                            <i
                                                class="fa-regular fa-pen-to-square"
                                            ></i>
                                        </td>
                                        <td
                                            class="admin__pv-size-name paragraph paragraph--tertiary"
                                            data-size-id="${
                                                value[0].productVariant
                                                    .variantSize.sizeId
                                            }"
                                        >
                                            ${
                                                value[0].productVariant
                                                    .variantSize.sizeName
                                            }
                                        </td>
                                        <td class="admin__pv-color-name paragraph paragraph--tertiary"
                                            data-color-id="${
                                                value[0].productVariant
                                                    .variantColor.colorId
                                            }"
                                        >
                                            ${
                                                value[0].productVariant
                                                    .variantColor.colorName
                                            }
                                        </td>
                                        <td class="admin__pv-price paragraph paragraph--tertiary">
                                            ${value[0].productVariant.price}
                                        </td>
                                        <td class="admin__pv-quantity paragraph paragraph--tertiary">
                                            ${value[0].productVariant.quantity}
                                        </td>
                                        <td class="admin__pv-is-default paragraph paragraph--tertiary"
                                            data-default-id="${
                                                value[0].productVariant
                                                    .isDefault
                                            }"
                                        >
                                            ${value[0].productVariant.isDefault}
                                        </td>
                                    </tr>
                                `;
                                html += trHtml;
                            }
                            tbody.innerHTML = html;

                            createProductBtn.classList.add("admin__hidden");
                            adminTableProduct.classList.add("admin__hidden");
                            if (pagination) {
                                pagination.classList.add("admin__hidden");
                            }
                            adminTablePV.classList.remove("admin__hidden");
                            createProductVariantBtn.setAttribute(
                                "data-pid",
                                adminTrItem[index].getAttribute("data-pid")
                            );
                            createProductVariantBtn.classList.remove(
                                "admin__hidden"
                            );
                            adminTablePV.appendChild(tbody);
                        })
                        .catch((error) => {
                            console.error("Error:", error);
                        });
                };
            });
        }

        if (adminTablePV) {
            this.observeInnerHTMLChanges(
                adminTablePV,
                this.updateProductVariant
            );
        }

        if (createProductVariantBtn) {
            createProductVariantBtn.onclick = () => {
                this.resetFormProductVariant();
                if (pageActive) {
                    pagePV.setAttribute("value", pageActive.innerHTML.trim());
                }
                productIdPV.setAttribute(
                    "value",
                    createProductVariantBtn.getAttribute("data-pid")
                );
                adminPopupPV.classList.add("admin__popup--active");
                actionPV.setAttribute("value", "CreateProductVariant");
            };
        }
    },

    updateProductVariant() {
        const adminTrItem = $$(".admin__tr-item");
        const adminBtnUpdatePV = $$(".admin__btn-update--pv");
        const adminBtnCancelPV = $(".admin__form-button--cancel-pv");
        const adminPVSizeName = $$(".admin__pv-size-name");
        const adminPVColorName = $$(".admin__pv-color-name");
        const adminPVPrice = $$(".admin__pv-price");
        const adminPVQuantity = $$(".admin__pv-quantity");
        const adminPVDefault = $$(".admin__pv-is-default");

        if (adminBtnCancelPV) {
            adminBtnCancelPV.onclick = () => {
                adminPopupPV.classList.remove("admin__popup--active");
            };
        }

        Array.from(adminBtnUpdatePV).forEach((button, index) => {
            button.onclick = () => {
                if (pageActive) {
                    pagePV.setAttribute("value", pageActive.innerHTML.trim());
                }

                productIdPV.setAttribute(
                    "value",
                    adminTrItem[index].getAttribute("data-product-id")
                );

                productVariantId.setAttribute(
                    "value",
                    adminTrItem[index].getAttribute("data-pv-id")
                );

                Array.from(isDefault).forEach((option) => {
                    if (
                        option.value ===
                        adminPVDefault[index].getAttribute("data-default-id")
                    ) {
                        option.setAttribute("selected", true);
                    } else {
                        option.removeAttribute("selected");
                    }
                });

                Array.from(sizeId).forEach((option) => {
                    if (
                        option.value ===
                        adminPVSizeName[index].getAttribute("data-size-id")
                    ) {
                        option.setAttribute("selected", true);
                    } else {
                        option.removeAttribute("selected");
                    }
                });

                Array.from(colorId).forEach((option) => {
                    if (
                        option.value ===
                        adminPVColorName[index].getAttribute("data-color-id")
                    ) {
                        option.setAttribute("selected", true);
                    } else {
                        option.removeAttribute("selected");
                    }
                });

                price.setAttribute(
                    "value",
                    adminPVPrice[index].innerHTML.trim()
                );

                quantity.setAttribute(
                    "value",
                    adminPVQuantity[index].innerHTML.trim()
                );

                actionPV.setAttribute("value", "UpdateProductVariant");

                adminPopupPV.classList.add("admin__popup--active");
            };
        });
    },

    start() {
        this.redirect();
        this.handleEvents();
    },
};
