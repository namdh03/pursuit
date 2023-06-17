import Validator from "./validator.js";
import toast from "./toast.js";
import sendRequest from "./request.js";

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const loginForm = new Validator("#login-form");

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
                    message: response.error,
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
