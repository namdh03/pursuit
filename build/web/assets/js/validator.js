// Đối tượng `Validator`
export default function Validator(
    formSelector,
    formGroup = ".form-group",
    formMsg = ".form-msg"
) {
    let _this = this;
    let formRules = {};

    // Xử lý lấy ra parent của element dựa vào selector
    function getParent(element, selector) {
        while (element.parentElement) {
            if (element.parentElement.matches(selector)) {
                return element.parentElement;
            } else {
                element = element.parentElement;
            }
        }
    }

    // Tạo ra các rules
    // Định nghĩa rules
    // Nguyên tắc của các rules:
    // 1. Khi có lỗi => trả ra message lỗi
    // 2. Khi hợp lệ => không trả ra gì cả (undefined)
    let validatorRules = {
        required: (value) => {
            return value ? undefined : `Please fill out this field.`;
        },

        email: (value) => {
            // js email regex
            let regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            // bugs
            return regex.test(value) ? undefined : `Please enter your email.`;
        },

        confirm: (value) => {
            let password = formElement.querySelector("#password");
            return value === password.value
                ? undefined
                : `Re-entered password does not match.`;
        },

        min: (min) => {
            return (value) => {
                return value.length >= min
                    ? undefined
                    : `Please enter at least ${min} characters.`;
            };
        },

        max: (max) => {
            return (value) => {
                return value.length <= max
                    ? undefined
                    : `Please enter up to ${max} characters.`;
            };
        },

        quantity: (number) => {
            return (value) => {
                return value >= number
                    ? undefined
                    : `Please enter a quantity of at least ${number} products`;
            };
        },

        number: (value) => {
            return !isNaN(value)
                ? undefined
                : `Input characters must be alphanumeric.`;
        },

        tel: (value) => {
            let regex = /(84|0[3|5|7|8|9])+([0-9]{8})\b/g;
            return regex.test(value) ? undefined : `Invalid phone number`;
        },

        blank: (value) => {
            let regex = /^\S*$/;
            return regex.test(value)
                ? undefined
                : `Please do not enter space(s).`;
        },
    };

    // Lấy ra selector form muốn validate
    let formElement = document.querySelector(formSelector);
    if (!formElement) return;

    // Lấy ra các thẻ trong formElement có name và rules
    let inputElements = formElement.querySelectorAll("[name][rules]");
    if (!inputElements) return;

    // Lặp qua từng inputElement để lấy ra các rules (ex: required|min:6) => rules = [required, min:6]
    Array.from(inputElements).forEach((inputElement) => {
        let rules = inputElement.getAttribute("rules").split("|");
        if (!rules) return;

        rules.forEach((rule) => {
            // Nếu value của bất kỳ rule có ':' (ex: min:6)
            if (rule.includes(":")) {
                let ruleSplit = rule.split(":");

                rule = ruleSplit[0]; // ruleSplit[0] = min
                validatorRules[rule] = validatorRules[rule](ruleSplit[1]); // ruleSplit[1] = 6
            }

            if (Array.isArray(formRules[inputElement.name])) {
                formRules[inputElement.name].push(validatorRules[rule]);
            } else {
                formRules[inputElement.name] = [validatorRules[rule]];
            }
        });

        inputElement.onblur = handleValidate;
        inputElement.oninput = handleClearErr;
        inputElement.onchange = handleValidate;
    });

    // Hàm thực hiện validate
    function handleValidate(e) {
        let rules = formRules[e.target.name];
        let errMsg;

        for (let rule of rules) {
            switch (e.target.type) {
                case "checkbox":
                case "radio":
                    errMsg = rule(
                        formElement.querySelector(
                            `input[name="${e.target.name}"][rules]:checked`
                        )
                    );
                    break;
                default:
                    errMsg = rule(e.target.value);
            }

            if (errMsg) break;
        }

        if (errMsg) {
            formGroup = getParent(e.target, ".form-group");
            if (!formGroup) return;
            formMsg = formGroup.querySelector(".form-message");
            if (!formMsg) return;

            formGroup.classList.add("invalid");
            formMsg.innerText = errMsg;
        }

        return !errMsg;
    }

    function handleClearErr(e) {
        formGroup = getParent(e.target, ".form-group");
        if (!formGroup) return;
        formMsg = formGroup.querySelector(".form-message");
        if (!formMsg) return;

        if (formGroup.classList.contains("invalid")) {
            formGroup.classList.remove("invalid");
            formMsg.innerText = "";
        }
    }

    // Khi submit form
    formElement.onsubmit = (e) => {
        e.preventDefault();
        let isValid = true;

        // Lặp qua từng inputElement để validate
        for (let inputElement of inputElements) {
            if (!handleValidate({ target: inputElement })) {
                isValid = false;
            }
        }

        if (isValid) {
            // Trường hợp submit với js
            if (typeof _this.onSubmit === "function") {
                let enableInput = formElement.querySelectorAll("[name]");
                let formValues = Array.from(enableInput).reduce(
                    (values, input) => {
                        switch (input.type) {
                            case "radio":
                                if (input.checked) {
                                    values[input.name] = input.value;
                                }
                                break;
                            case "checkbox":
                                if (!values[input.name]) {
                                    values[input.name] = [];
                                }

                                if (input.checked) {
                                    values[input.name].push(input.value);
                                }

                                if (values[input.name].length === 0) {
                                    values[input.name] = "";
                                }
                                break;
                            case "file":
                                values[input.name] = input.files;
                                break;
                            default:
                                values[input.name] = input.value
                                    .replace(/\s+/g, " ")
                                    .trim();
                        }
                        return values;
                    },
                    {}
                );

                _this.onSubmit(formValues);
            } else {
                // Trường hợp submit với với hành vi mặc định
                formElement.submit();
            }
        }
    };
}
