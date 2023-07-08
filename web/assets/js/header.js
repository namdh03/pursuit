const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const headerSearchInput = $(".header__search-input");
const headerSearchBtn = $(".header__search-icon-wrapper");

export default {
    handleEvents() {
        if (headerSearchBtn) {
            headerSearchBtn.onclick = () => {
                if (headerSearchInput.value === "") {
                    headerSearchBtn.type = "button";
                } else {
                    headerSearchBtn.type = "submit";
                }
            };
        }
    },

    start() {
        this.handleEvents();
    },
};
