import Validator from "./validator.js";
import toast from "./toast.js";
import sendRequest from "./request.js";
import { showLoader, hideLoader } from "./loader.js";

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const registerForm = new Validator(".register__form");
const loginGoogle = $(".form__google-submit");
const googleRedirectURI = $(".form__google-redirect-uri");
const formGroup = $$(".form-group");

registerForm.onSubmit = (formData) => {
    const url = "MainController?action=Register";
    const data = new URLSearchParams();
    data.append("email", formData.email);
    data.append("username", formData.username);
    data.append("password", formData.password);

    const response = grecaptcha.getResponse();
    if (response) {
        showLoader();
        sendRequest(url, "POST", data)
            .then((response) => {
                if (response.success != null) {
                    window.location.href = "./login.jsp";
                } else {
                    hideLoader();
                    toast({
                        title: "Error!",
                        message: response.email || response.username,
                        type: "error",
                        duration: 3000,
                    });
                    Array.from(formGroup).forEach((grp) => {
                        grp.classList.add("invalid");
                    });
                }
            })
            .catch((error) => {
                hideLoader();
                console.error("Error:", error);
            });
    } else {
        toast({
            title: "Warning!",
            message: "Please verify the Captcha to proceed",
            type: "warning",
            duration: 3000,
        });
    }
};

/*
https://accounts.google.com/o/oauth2/auth?
scope=profile%20email
&redirect_uri=http://localhost:8084/pursuit/MainController?action=Google
&response_type=code
&client_id=331375674166-vf33h85eif247v32m3fu08a5gtiq6trd.apps.googleusercontent.com
&approval_prompt=force
*/
loginGoogle.onclick = () => {
    window.location.href =
        "https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=" +
        googleRedirectURI.value +
        "/MainController?action=Google&response_type=code&client_id=331375674166-vf33h85eif247v32m3fu08a5gtiq6trd.apps.googleusercontent.com&approval_prompt=force";
};
