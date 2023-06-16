import Validator from "./validator.js";
import toast from "./toast.js";

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const loginForm = new Validator("#login-form");

loginForm.onSubmit = (formData) => {
    var xhr = new XMLHttpRequest();
    var url = "MainController?action=Login";
    var params =
        "&username=" + formData.username + "&password=" + formData.password;

    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);

            if (response.error) {
                toast({
                    title: "Error!",
                    message: response.error,
                    type: "error",
                    duration: 3000,
                });
            } else {
                window.location.href = "./index.jsp";
            }
        }
    };

    xhr.send(params);
};
