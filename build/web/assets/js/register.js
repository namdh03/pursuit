import Validator from "./validator.js";
import toast from "./toast.js";
import sendRequest from "./request.js";

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const registerForm = new Validator("#register-form");

registerForm.onSubmit = (formData) => {
    const url = "MainController?action=Register";
    const data = new URLSearchParams();
    data.append("email", formData.email);
    data.append("username", formData.username);
    data.append("password", formData.password);

    sendRequest(url, "POST", data)
        .then((response) => {
            if (response.success != null) {
                toast({
                    title: "Success!",
                    message: response.success,
                    type: "success",
                    duration: 3000,
                });
                setTimeout(() => {
                    window.location.href = "./login.jsp";
                }, 3000);
            } else {
                toast({
                    title: "Error!",
                    message: response.email || response.username,
                    type: "error",
                    duration: 3000,
                });
            }
        })
        .catch((error) => {
            console.error("Error:", error);
        });
};
