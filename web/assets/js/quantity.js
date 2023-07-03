import Validator from "./validator.js";
import toast from "./toast.js";
import sendRequest from "./request.js";

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

export default function handleQuantity(
    input,
    quantity,
    maxQuantity,
    plus,
    minus,
    callback
) {
    let flagQty = quantity;

    function modify() {
        input.value = quantity;

        if (callback) {
            callback();
        }
    }

    function increase() {
        if (Number(quantity) < Number(maxQuantity())) {
            quantity++;
            modify();
        }
    }

    function decrease() {
        if (Number(quantity) > Number(maxQuantity())) {
            quantity = maxQuantity();
        }

        if (quantity > 1) {
            quantity--;
            modify();
        }
    }

    plus.onclick = () => {
        increase();
    };

    minus.onclick = () => {
        decrease();
    };

    input.onkeydown = (e) => {
        flagQty = quantity;

        if (
            (isNaN(e.key) &&
                e.key !== "Backspace" &&
                e.key !== "ArrowLeft" &&
                e.key !== "ArrowRight" &&
                e.key !== "ArrowUp" &&
                e.key !== "ArrowDown") ||
            e.key === " "
        ) {
            e.preventDefault();
        } else if (e.key == false && e.target.value == false) {
            e.preventDefault();
        } else if (e.key === "ArrowUp") {
            increase();
        } else if (e.key === "ArrowDown") {
            decrease();
        }
    };

    input.onchange = (e) => {
        quantity = e.target.value;
    };

    input.oninput = (e) => {
        if (/^0[0-9]+$/.test(e.target.value)) {
            e.target.value = e.target.value.slice(1);
        }

        if (Number(e.target.value) >= maxQuantity()) {
            e.target.value = maxQuantity();
            quantity = e.target.value;
        }
    };

    input.onblur = (e) => {
        if (e.target.value === "" || e.target.value === "0") {
            quantity = flagQty;
            e.target.value = flagQty;
        }

        if (callback) {
            callback();
        }
    };
}
