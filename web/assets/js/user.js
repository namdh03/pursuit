import Validator from "./validator.js";
import toast from "./toast.js";
import sendRequest from "./request.js";

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const userItemsNavbar = $$(".user__item");
const userContents = $$(".user__content");
const avatar = $("#avatar");
const labelAvatar = $(".user__form-label--avatar");
const imageNoneWrapper = $(".user__image-none-wrapper");
const userAddressBtn = $(".user__content-addresses");
const userAddressPopup = $(".user__address-popup");
const userAddressCancelBtn = $(".user__address-btn--cancel");
const userFormPassword = new Validator(".user__form-password");
const formControls = $$(".form-control");

export default {
    handleEvents() {
        Array.from(userItemsNavbar).forEach((item, i) => {
            const pane = userContents[i];

            item.onclick = () => {
                $(".user__item.user__item--active").classList.remove(
                    "user__item--active"
                );

                if ($(".user__content.user__content--active")) {
                    $(".user__content.user__content--active").classList.remove(
                        "user__content--active"
                    );
                }

                item.classList.add("user__item--active");

                if (pane) {
                    pane.classList.add("user__content--active");
                }
            };
        });

        if (avatar) {
            avatar.onchange = () => {
                if (imageNoneWrapper) {
                    imageNoneWrapper.style.display = "none";
                }

                labelAvatar.querySelector(".user__image").src =
                    window.URL.createObjectURL(avatar.files[0]);

                if (
                    labelAvatar
                        .querySelector(".user__image")
                        .classList.contains("user__image--hidden")
                ) {
                    labelAvatar
                        .querySelector(".user__image")
                        .classList.remove("user__image--hidden");
                }

                toast({
                    title: "Info!",
                    message:
                        "We're sorry, but this feature is not supported on the website at the moment",
                    type: "info",
                    duration: 3000,
                });
            };
        }

        if (userAddressBtn) {
            userAddressBtn.onclick = () => {
                userAddressPopup.classList.add("user__address-popup--active");
            };
        }

        if (userAddressCancelBtn) {
            userAddressCancelBtn.onclick = () => {
                userAddressPopup.classList.remove(
                    "user__address-popup--active"
                );
            };
        }

        if (userFormPassword) {
            userFormPassword.onSubmit = (formData) => {
                const url = "MainController?action=ChangePassword";
                const data = new URLSearchParams();
                data.append("oldPassword", formData.oldPassword);
                data.append("password", formData.password);

                sendRequest(url, "POST", data)
                    .then((response) => {
                        if (response.ERROR) {
                            toast({
                                title: "Warning!",
                                message: response.ERROR,
                                type: "warning",
                                duration: 3000,
                            });
                        } else if (response.SUCCESS) {
                            toast({
                                title: "Success!",
                                message: response.SUCCESS,
                                type: "success",
                                duration: 3000,
                            });
                            Array.from(formControls).forEach((input) => {
                                input.value = "";
                            });
                        }
                    })
                    .catch((error) => {
                        console.error("Error:", error);
                    });
            };
        }
    },

    start() {
        this.handleEvents();
    },
};
