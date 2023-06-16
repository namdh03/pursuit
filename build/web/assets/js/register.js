import Validator from "./validator.js";
import toast from "./toast.js";

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const registerForm = new Validator("#register-form");

registerForm.onSubmit = (formData) => {
    var xhr = new XMLHttpRequest();
    var url = "MainController?action=Register";
    var params =
        "email=" +
        formData.email +
        "&username=" +
        formData.username +
        "&password=" +
        formData.password;

    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);

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
        }
    };

    xhr.send(params);
};
