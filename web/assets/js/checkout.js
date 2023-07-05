import Validator from "./validator.js";
import toast from "./toast.js";
import sendRequest from "./request.js";

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);
const checkoutAddressForm = $(".checkout__address-popup");
const checkoutSettingBtn = $(".checkout__change-address");
const checkoutConfirmForm = $(".checkout__address-action-btn--confirm");
const checkoutCancelForm = $(".checkout__address-action-btn--cancel");
const checkoutAddressName = $(".checkout__address-name");
const checkoutAddressPhone = $(".checkout__address-phone");
const checkoutAddressSpecific = $(".checkout__address-specific");
const checkoutAddressFlag = $(".checkout__address-flag");
const userAddressItem = $(".user__address-item");
const checkoutMainForm = new Validator("#checkout__form");

export default {
    handleEvents() {
        if (checkoutSettingBtn) {
            checkoutSettingBtn.onclick = () => {
                checkoutAddressForm.classList.add(
                    "checkout__address-popup--active"
                );
            };
        }

        if (checkoutCancelForm) {
            checkoutCancelForm.onclick = () => {
                checkoutAddressForm.classList.remove(
                    "checkout__address-popup--active"
                );
            };
        }

        if (checkoutConfirmForm) {
            checkoutConfirmForm.onclick = () => {
                const checkoutInputOption = $(
                    ".checkout__input-option:checked"
                );
                const checkoutLabelOption = checkoutInputOption.parentElement;
                const addressDefault = Boolean(
                    checkoutLabelOption.getAttribute("data-address-default")
                );
                const addressId = checkoutInputOption.id;
                const fullName = checkoutLabelOption.querySelector(
                    ".user__address-name"
                );
                const phone = checkoutLabelOption.querySelector(
                    ".user__address-phone"
                );
                const address = checkoutLabelOption.querySelector(
                    ".user__address-specific"
                );

                userAddressItem.setAttribute("data-address-id", addressId);
                checkoutAddressName.innerHTML = fullName.innerHTML;
                checkoutAddressPhone.innerHTML = phone.innerHTML;
                checkoutAddressSpecific.innerHTML = address.innerHTML;

                if (addressDefault) {
                    checkoutAddressFlag.classList.add(
                        "checkout__address-flag--active"
                    );
                } else {
                    checkoutAddressFlag.classList.remove(
                        "checkout__address-flag--active"
                    );
                }

                checkoutAddressForm.classList.remove(
                    "checkout__address-popup--active"
                );
            };
        }

        if (checkoutMainForm) {
            checkoutMainForm.onSubmit = (formData) => {
                if (formData.payment === "vnpay") {
                    toast({
                        title: "Info!",
                        message:
                            "We're sorry, but this feature is not supported on the website at the moment",
                        type: "info",
                        duration: 3000,
                    });
                } else {
                    const addressId =
                        userAddressItem.getAttribute("data-address-id");
                    const url = "MainController?action=AddOrder";
                    const data = new URLSearchParams();
                    data.append("addressId", addressId);
                    data.append("payment", formData.payment);

                    sendRequest(url, "POST", data)
                        .then((response) => {
                            if (response.SUCCESS) {
                                window.location.href = "./index.jsp";
                            }

                            if (response.ERROR) {
                                toast({
                                    title: "Error!",
                                    message:
                                        "Insufficient quantity available. Please choose a lower quantity",
                                    type: "error",
                                    duration: 3000,
                                });

                                setTimeout(() => {
                                    window.location.href = "./cart.jsp";
                                }, 3000);
                            }
                        })
                        .catch((error) => {
                            console.error("Error:", error);
                        });
                }
            };
        }
    },

    start() {
        this.handleEvents();
    },
};
