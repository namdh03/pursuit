const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

let loader = $(".loader-wrapper");

export function showLoader() {
    loader.classList.remove("hidden");
}

export function hideLoader() {
    loader.classList.add("hidden");
}
