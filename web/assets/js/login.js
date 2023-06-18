import Validator from "./validator.js";
import toast from "./toast.js";
import sendRequest from "./request.js";

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const loginForm = new Validator("#login-form");
const loginGoogle = $(".google-sign-in");

loginForm.onSubmit = (formData) => {
    const url = "MainController?action=Login";
    const data = new URLSearchParams();
    data.append("username", formData.username);
    data.append("password", formData.password);

    sendRequest(url, "POST", data)
        .then((response) => {
            if (response.incorrect) {
                toast({
                    title: "Error!",
                    message: response.incorrect,
                    type: "error",
                    duration: 3000,
                });
            } else if (response.verify) {
                toast({
                    title: "Error!",
                    message: response.verify,
                    type: "error",
                    duration: 3000,
                });
            } else {
                window.location.href = "./index.jsp";
            }
        })
        .catch((error) => {
            console.error("Error:", error);
        });
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
        "https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:8084/pursuit/MainController?action=Google&response_type=code&client_id=331375674166-vf33h85eif247v32m3fu08a5gtiq6trd.apps.googleusercontent.com&approval_prompt=force";
};
