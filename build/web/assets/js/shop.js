const currentURL = window.location.href;
const lastSlashIndex = currentURL.lastIndexOf("/");
const fileName = currentURL.substring(lastSlashIndex + 1);

if (fileName === "shop.jsp") {
    window.location.href = "MainController?action=Product";
}
