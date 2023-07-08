const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

export default function scrollToTop() {
    let backToTop = $(".back-to-top");

    if (backToTop) {
        function calcScrollValue() {
            let pos = document.documentElement.scrollTop;
            let calcHeight =
                document.documentElement.scrollHeight -
                document.documentElement.clientHeight;
            let scrollValue = Math.round((pos * 100) / calcHeight);

            if (pos > 100) {
                backToTop.classList.remove("hide");
            } else {
                backToTop.classList.add("hide");
            }

            backToTop.onclick = function () {
                document.documentElement.scrollTop = 0;
            };

            backToTop.style.background = `conic-gradient(#1E787D ${scrollValue}%, #C4D1D0 ${scrollValue}%)`;
        }

        window.onscroll = calcScrollValue;
        window.onload = calcScrollValue;
    }
}
