const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

let loaderPage = $(".loader-wrapper--page");
let loaderDefault = $(".loader-wrapper--default");

export function showLoaderPage() {
    loaderPage.classList.remove("hidden");
    document.body.style.overflow = "hidden";
}

export function hideLoaderPage() {
    loaderPage.classList.add("hidden");
    document.body.style.overflow = "visible";
}

export function showLoaderDefault() {
    loaderDefault.classList.remove("hidden");
}

export function hideLoaderDefault() {
    loaderDefault.classList.add("hidden");
}
