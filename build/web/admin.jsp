<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if
    test="${sessionScope.USER == null || sessionScope.USER.role.roleId.trim() ne 'AD'}"
>
    <c:redirect url="user.jsp" />
</c:if>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Pursuit</title>

        <!-- Check URL -->
        <script src="./assets/js/shop.js"></script>

        <!-- Embed Favicon -->
        <link
            rel="apple-touch-icon"
            sizes="57x57"
            href="./assets/favicon/apple-icon-57x57.png"
        />
        <link
            rel="apple-touch-icon"
            sizes="60x60"
            href="./assets/favicon/apple-icon-60x60.png"
        />
        <link
            rel="apple-touch-icon"
            sizes="72x72"
            href="./assets/favicon/apple-icon-72x72.png"
        />
        <link
            rel="apple-touch-icon"
            sizes="76x76"
            href="./assets/favicon/apple-icon-76x76.png"
        />
        <link
            rel="apple-touch-icon"
            sizes="114x114"
            href="./assets/favicon/apple-icon-114x114.png"
        />
        <link
            rel="apple-touch-icon"
            sizes="120x120"
            href="./assets/favicon/apple-icon-120x120.png"
        />
        <link
            rel="apple-touch-icon"
            sizes="144x144"
            href="./assets/favicon/apple-icon-144x144.png"
        />
        <link
            rel="apple-touch-icon"
            sizes="152x152"
            href="./assets/favicon/apple-icon-152x152.png"
        />
        <link
            rel="apple-touch-icon"
            sizes="180x180"
            href="./assets/favicon/apple-icon-180x180.png"
        />
        <link
            rel="icon"
            type="image/png"
            sizes="192x192"
            href="./assets/favicon/android-icon-192x192.png"
        />
        <link
            rel="icon"
            type="image/png"
            sizes="32x32"
            href="./assets/favicon/favicon-32x32.png"
        />
        <link
            rel="icon"
            type="image/png"
            sizes="96x96"
            href="./assets/favicon/favicon-96x96.png"
        />
        <link
            rel="icon"
            type="image/png"
            sizes="16x16"
            href="./assets/favicon/favicon-16x16.png"
        />
        <link rel="manifest" href="./assets/favicon/manifest.json" />
        <meta name="msapplication-TileColor" content="#ffffff" />
        <meta
            name="msapplication-TileImage"
            content="./assets/favicon/ms-icon-144x144.png"
        />
        <meta name="theme-color" content="#ffffff" />

        <!-- Embed Font Awesome -->
        <link
            rel="preconnect"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
        />

        <!-- Styles CSS -->
        <link rel="stylesheet" href="./assets/css/main.css" />
    </head>
    <body>
        <header class="admin__header">
            <div class="grid wide">
                <div class="row no-gutters">
                    <div class="col l-1 m-1 c-1">
                        <a href="./">
                            <img
                                src="./assets/icons/logo.svg"
                                alt="Pursuit"
                                class="header__logo"
                            />
                        </a>
                    </div>

                    <div class="col l-11 m-11 c-11">
                        <div class="admin__header-inner">
                            <form action="MainController" method="GET">
                                <input
                                    type="hidden"
                                    name="action"
                                    value="Product"
                                />
                                <input
                                    type="hidden"
                                    name="location"
                                    value="admin"
                                />
                                <input type="hidden" name="flag" value="true" />

                                <c:if
                                    test="${requestScope.CATEGORY_ID != null}"
                                >
                                    <input
                                        type="hidden"
                                        name="categoryID"
                                        value="${requestScope.CATEGORY_ID}"
                                    />
                                </c:if>
                                <input
                                    id="search"
                                    name="search"
                                    type="text"
                                    placeholder="Search for anything"
                                    class="header__search-input paragraph paragraph--tertiary"
                                    value="${param.search}"
                                />
                                <button class="header__search-icon-wrapper">
                                    <img
                                        src="./assets/icons/search.svg"
                                        alt=""
                                        class="header__search-icon"
                                    />
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="row no-gutters">
                    <div class="col l-11 m-12 c-12 l-o-1">
                        <nav class="navbar">
                            <ul class="navbar__list">
                                <li class="navbar__item">
                                    <a
                                        href="./"
                                        class="navbar__link paragraph paragraph--secondary"
                                        title="User View"
                                    >
                                        User View
                                    </a>
                                </li>

                                <li
                                    class="navbar__item navbar__item--drop-down"
                                >
                                    <a
                                        href="#!"
                                        class="navbar__link paragraph paragraph--secondary"
                                        title="Category"
                                    >
                                        Category
                                    </a>
                                    <img
                                        src="./assets/icons/arrow-down.svg"
                                        alt=""
                                        class="navbar__icon"
                                    />

                                    <ul class="navbar__popup-list">
                                        <c:forEach
                                            var="o"
                                            items="${sessionScope.CATEGORY_LIST}"
                                        >
                                            <li
                                                class="navbar__popup-item ${requestScope.CATEGORY_ID == o.categoryId ? 'navbar__popup-item--active' : ''}"
                                            >
                                                <c:url
                                                    var="productUrl"
                                                    value="MainController"
                                                >
                                                    <c:param
                                                        name="action"
                                                        value="Product"
                                                    />
                                                    <c:param
                                                        name="location"
                                                        value="admin"
                                                    />
                                                    <c:param
                                                        name="flag"
                                                        value="true"
                                                    />
                                                    <c:param
                                                        name="categoryID"
                                                        value="${o.categoryId}"
                                                    />
                                                    <c:if
                                                        test="${param.search != null}"
                                                    >
                                                        <c:param
                                                            name="search"
                                                            value="${param.search}"
                                                        />
                                                    </c:if>
                                                </c:url>
                                                <a
                                                    href="${productUrl}"
                                                    class="navbar__popup-link paragraph paragraph--secondary"
                                                >
                                                    ${o.categoryName}
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </li>

                                <c:url var="product" value="MainController">
                                    <c:param name="action" value="Product" />
                                    <c:param name="location" value="admin" />
                                    <c:param name="flag" value="true" />
                                </c:url>
                                <li class="navbar__item">
                                    <a
                                        href="${product}"
                                        class="navbar__link paragraph paragraph--secondary"
                                        title="Reset Product"
                                    >
                                        Reset Product
                                    </a>
                                </li>
                                <c:url var="logoutUrl" value="MainController">
                                    <c:param name="action" value="Logout" />
                                </c:url>
                                <li class="navbar__item">
                                    <a
                                        href="${logoutUrl}"
                                        class="navbar__link paragraph paragraph--secondary"
                                        title="Logout"
                                    >
                                        Logout
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </header>

        <main>
            <div id="toast"></div>
            <session class="admin__body">
                <div class="grid wide">
                    <div class="row no-gutters">
                        <c:choose>
                            <c:when
                                test="${not empty requestScope.PRODUCT_LIST}"
                            >
                                <div class="col l-12 m-12 c-12">
                                    <ul class="admin__table-list">
                                        <li class="admin__table-item">
                                            <button
                                                class="admin__table-btn admin__table-btn--create-product btn btn--secondary btn-effect"
                                            >
                                                <i class="fa-solid fa-plus"></i>
                                            </button>
                                            <table
                                                class="content-table admin__table admin__table--product"
                                            >
                                                <thead>
                                                    <tr>
                                                        <th colspan="3">
                                                            Actions
                                                        </th>
                                                        <th>Product Name</th>
                                                        <th>Category Name</th>
                                                        <th>Description</th>
                                                        <th>Units In Stock</th>
                                                        <th>Units On Order</th>
                                                        <th>Discontinued</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach
                                                        var="o"
                                                        items="${requestScope.PRODUCT_LIST}"
                                                    >
                                                        <tr
                                                            class="admin__tr-item"
                                                            data-pId="${o.productId}"
                                                        >
                                                            <td
                                                                class="admin__btn-view"
                                                            >
                                                                <i
                                                                    class="fa-regular fa-eye"
                                                                ></i>
                                                            </td>
                                                            <td
                                                                class="admin__btn-update"
                                                            >
                                                                <i
                                                                    class="fa-regular fa-pen-to-square"
                                                                ></i>
                                                            </td>
                                                            <td>
                                                                <i
                                                                    class="fa-regular fa-trash-can"
                                                                ></i>
                                                            </td>
                                                            <td
                                                                class="admin__product-name paragraph paragraph--tertiary"
                                                            >
                                                                ${o.productName}
                                                            </td>
                                                            <td
                                                                class="admin__product-category paragraph paragraph--tertiary"
                                                                data-category-id="${o.category.categoryId}"
                                                            >
                                                                ${o.category.categoryName}
                                                            </td>
                                                            <td
                                                                class="admin__product-description paragraph paragraph--tertiary"
                                                            >
                                                                ${o.description}
                                                            </td>
                                                            <td
                                                                class="admin__product-uis paragraph paragraph--tertiary"
                                                            >
                                                                ${o.unitsInStock}
                                                            </td>
                                                            <td
                                                                class="admin__product-uoo paragraph paragraph--tertiary"
                                                            >
                                                                ${o.unitsOnOrder}
                                                            </td>
                                                            <td
                                                                class="admin__product-discontinued paragraph paragraph--tertiary"
                                                                data-discontinued-id="${o.discontinued}"
                                                            >
                                                                ${o.discontinued}
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <div class="admin__popup">
                                                <div class="admin__popup-inner">
                                                    <form
                                                        action="MainController"
                                                        method="POST"
                                                        class="admin__form"
                                                        autocomplete="off"
                                                    >
                                                        <div
                                                            class="admin__form-group admin__form-group--hidden"
                                                        >
                                                            <input
                                                                id="action"
                                                                name="action"
                                                                type="hidden"
                                                            />
                                                            <input
                                                                id="location"
                                                                name="location"
                                                                value="admin"
                                                                type="hidden"
                                                            />
                                                            <input
                                                                id="flag"
                                                                name="flag"
                                                                value="true"
                                                                type="hidden"
                                                            />

                                                            <input
                                                                id="page"
                                                                name="page"
                                                                type="hidden"
                                                            />

                                                            <c:if
                                                                test="${requestScope.CATEGORY_ID != null}"
                                                            >
                                                                <input
                                                                    id="categoryID"
                                                                    name="categoryID"
                                                                    value="${requestScope.CATEGORY_ID}"
                                                                    type="hidden"
                                                                />
                                                            </c:if>
                                                            <c:if
                                                                test="${param.search != null}"
                                                            >
                                                                <input
                                                                    id="search"
                                                                    name="${param.search}"
                                                                    type="hidden"
                                                                />
                                                            </c:if>

                                                            <input
                                                                id="productId"
                                                                name="productId"
                                                                type="hidden"
                                                            />
                                                        </div>
                                                        <div
                                                            class="form-group form__form-group admin__form-group admin__form-group--multi"
                                                        >
                                                            <div
                                                                class="admin__group"
                                                            >
                                                                <label
                                                                    for="productName"
                                                                    class="paragraph paragraph--secondary admin__form-label"
                                                                >
                                                                    Product Name
                                                                </label>
                                                                <input
                                                                    id="productName"
                                                                    name="productName"
                                                                    type="text"
                                                                    class="form-control form__form-input admin__form-input paragraph paragraph--secondary"
                                                                />
                                                                <span
                                                                    class="form-message"
                                                                ></span>
                                                            </div>

                                                            <div
                                                                class="admin__group"
                                                            >
                                                                <label
                                                                    for="discontinued"
                                                                    class="paragraph paragraph--secondary admin__form-label"
                                                                >
                                                                    Status
                                                                </label>
                                                                <select
                                                                    name="discontinued"
                                                                    id="discontinued"
                                                                    class="admin__form-select"
                                                                >
                                                                    <option
                                                                        value="true"
                                                                    >
                                                                        Discontinued
                                                                    </option>
                                                                    <option
                                                                        value="false"
                                                                    >
                                                                        Continued
                                                                    </option>
                                                                </select>
                                                                <span
                                                                    class="form-message"
                                                                ></span>
                                                            </div>
                                                        </div>

                                                        <div
                                                            class="form-group form__form-group admin__form-group admin__form-group--multi"
                                                        >
                                                            <div
                                                                class="admin__group"
                                                            >
                                                                <label
                                                                    for="unitsInStock"
                                                                    class="paragraph paragraph--secondary admin__form-label"
                                                                >
                                                                    Units In
                                                                    Stock
                                                                </label>
                                                                <input
                                                                    id="unitsInStock"
                                                                    name="unitsInStock"
                                                                    type="number"
                                                                    min="1"
                                                                    max="9999"
                                                                    class="form-control form__form-input admin__form-input paragraph paragraph--secondary"
                                                                />
                                                                <span
                                                                    class="form-message"
                                                                ></span>
                                                            </div>

                                                            <div
                                                                class="admin__group"
                                                            >
                                                                <label
                                                                    for="unitsOnOrder"
                                                                    class="paragraph paragraph--secondary admin__form-label"
                                                                >
                                                                    Units On
                                                                    Order
                                                                </label>
                                                                <input
                                                                    id="unitsOnOrder"
                                                                    name="unitsOnOrder"
                                                                    type="number"
                                                                    min="1"
                                                                    max="9999"
                                                                    class="form-control form__form-input admin__form-input paragraph paragraph--secondary"
                                                                />
                                                                <span
                                                                    class="form-message"
                                                                ></span>
                                                            </div>
                                                        </div>

                                                        <div
                                                            class="form-group form__form-group admin__form-group"
                                                        >
                                                            <label
                                                                for="category"
                                                                class="paragraph paragraph--secondary admin__form-label"
                                                            >
                                                                Category Name
                                                            </label>
                                                            <select
                                                                name="category"
                                                                id="category"
                                                                class="admin__form-select"
                                                            >
                                                                <c:forEach
                                                                    var="o"
                                                                    items="${sessionScope.CATEGORY_LIST}"
                                                                >
                                                                    <option
                                                                        value="${o.categoryId}"
                                                                    >
                                                                        ${o.categoryName}
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                            <span
                                                                class="form-message"
                                                            ></span>
                                                        </div>

                                                        <div
                                                            class="form-group form__form-group admin__form-group"
                                                        >
                                                            <label
                                                                for="description"
                                                                class="paragraph paragraph--secondary admin__form-label"
                                                            >
                                                                Description
                                                            </label>
                                                            <input
                                                                id="description"
                                                                name="description"
                                                                type="text"
                                                                class="form-control form__form-input admin__form-input paragraph paragraph--secondary"
                                                            />
                                                            <span
                                                                class="form-message"
                                                            ></span>
                                                        </div>

                                                        <div
                                                            class="form-group form__form-group admin__form-group admin__form-group--actions"
                                                        >
                                                            <button
                                                                type="button"
                                                                class="admin__form-button admin__form-button--cancel paragraph paragraph--secondary btn btn--primary btn-effect"
                                                            >
                                                                Cancel
                                                            </button>

                                                            <button
                                                                type="submit"
                                                                class="admin__form-button admin__form-button--submit paragraph paragraph--secondary btn btn--secondary btn-effect"
                                                            >
                                                                Submit
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="admin__table-item">
                                            <button
                                                class="admin__table-btn admin__table-btn--create-pv btn btn--secondary btn-effect admin__hidden"
                                            >
                                                <i class="fa-solid fa-plus"></i>
                                            </button>

                                            <table
                                                class="content-table admin__table admin__table--product-variant admin__hidden"
                                            >
                                                <thead>
                                                    <tr>
                                                        <th>Actions</th>
                                                        <th>Size Name</th>
                                                        <th>Color Name</th>
                                                        <th>Price</th>
                                                        <th>Quantity</th>
                                                        <th>Default</th>
                                                    </tr>
                                                </thead>
                                            </table>

                                            <div
                                                class="admin__popup admin__popup--pv"
                                            >
                                                <div class="admin__popup-inner">
                                                    <form
                                                        action="MainController"
                                                        method="GET"
                                                        class="admin__form"
                                                        autocomplete="off"
                                                    >
                                                        <div
                                                            class="admin__form-group admin__form-group--hidden"
                                                        >
                                                            <input
                                                                id="actionPV"
                                                                name="action"
                                                                type="hidden"
                                                            />
                                                            <input
                                                                id="location"
                                                                name="location"
                                                                value="admin"
                                                                type="hidden"
                                                            />
                                                            <input
                                                                id="flag"
                                                                name="flag"
                                                                value="true"
                                                                type="hidden"
                                                            />

                                                            <input
                                                                id="pagePV"
                                                                name="page"
                                                                type="hidden"
                                                            />

                                                            <c:if
                                                                test="${requestScope.CATEGORY_ID != null}"
                                                            >
                                                                <input
                                                                    id="categoryID"
                                                                    name="categoryID"
                                                                    value="${requestScope.CATEGORY_ID}"
                                                                    type="hidden"
                                                                />
                                                            </c:if>
                                                            <c:if
                                                                test="${param.search != null}"
                                                            >
                                                                <input
                                                                    id="search"
                                                                    name="${param.search}"
                                                                    type="hidden"
                                                                />
                                                            </c:if>

                                                            <input
                                                                id="productIdPV"
                                                                name="productId"
                                                                type="hidden"
                                                            />

                                                            <input
                                                                id="productVariantId"
                                                                name="productVariantId"
                                                                type="hidden"
                                                            />
                                                        </div>
                                                        <div
                                                            class="form-group form__form-group admin__form-group"
                                                        >
                                                            <label
                                                                for="default"
                                                                class="paragraph paragraph--secondary admin__form-label"
                                                            >
                                                                Default
                                                            </label>
                                                            <select
                                                                name="default"
                                                                id="default"
                                                                class="admin__form-select"
                                                            >
                                                                <option
                                                                    value="false"
                                                                >
                                                                    False
                                                                </option>
                                                                <option
                                                                    value="true"
                                                                >
                                                                    True
                                                                </option>
                                                            </select>
                                                            <span
                                                                class="form-message"
                                                            ></span>
                                                        </div>
                                                        <div
                                                            class="form-group form__form-group admin__form-group admin__form-group--multi"
                                                        >
                                                            <div
                                                                class="admin__group"
                                                            >
                                                                <label
                                                                    for="sizeId"
                                                                    class="paragraph paragraph--secondary admin__form-label"
                                                                >
                                                                    Size Name
                                                                </label>
                                                                <select
                                                                    name="sizeId"
                                                                    id="sizeId"
                                                                    class="admin__form-select"
                                                                >
                                                                    <c:forEach
                                                                        var="o"
                                                                        items="${sessionScope.SIZE}"
                                                                    >
                                                                        <option
                                                                            value="${o.sizeId}"
                                                                        >
                                                                            ${o.sizeName}
                                                                        </option>
                                                                    </c:forEach>
                                                                </select>
                                                                <span
                                                                    class="form-message"
                                                                ></span>
                                                                <span
                                                                    class="form-message"
                                                                ></span>
                                                            </div>

                                                            <div
                                                                class="admin__group"
                                                            >
                                                                <label
                                                                    for="colorId"
                                                                    class="paragraph paragraph--secondary admin__form-label"
                                                                >
                                                                    Color Name
                                                                </label>
                                                                <select
                                                                    name="colorId"
                                                                    id="colorId"
                                                                    class="admin__form-select"
                                                                >
                                                                    <c:forEach
                                                                        var="o"
                                                                        items="${sessionScope.COLOR}"
                                                                    >
                                                                        <option
                                                                            value="${o.colorId}"
                                                                        >
                                                                            ${o.colorName}
                                                                        </option>
                                                                    </c:forEach>
                                                                </select>
                                                                <span
                                                                    class="form-message"
                                                                ></span>
                                                            </div>
                                                        </div>

                                                        <div
                                                            class="form-group form__form-group admin__form-group admin__form-group--multi"
                                                        >
                                                            <div
                                                                class="admin__group"
                                                            >
                                                                <label
                                                                    for="price"
                                                                    class="paragraph paragraph--secondary admin__form-label"
                                                                >
                                                                    Price
                                                                </label>
                                                                <input
                                                                    id="price"
                                                                    name="price"
                                                                    type="number"
                                                                    step="any"
                                                                    min="0"
                                                                    max="9999"
                                                                    required
                                                                    class="form-control form__form-input admin__form-input paragraph paragraph--secondary"
                                                                />
                                                                <span
                                                                    class="form-message"
                                                                ></span>
                                                            </div>

                                                            <div
                                                                class="admin__group"
                                                            >
                                                                <label
                                                                    for="quantity"
                                                                    class="paragraph paragraph--secondary admin__form-label"
                                                                >
                                                                    Quantity
                                                                </label>
                                                                <input
                                                                    id="quantity"
                                                                    name="quantity"
                                                                    type="number"
                                                                    min="1"
                                                                    max="9999"
                                                                    required
                                                                    class="form-control form__form-input admin__form-input paragraph paragraph--secondary"
                                                                />
                                                                <span
                                                                    class="form-message"
                                                                ></span>
                                                            </div>
                                                        </div>

                                                        <div
                                                            class="form-group form__form-group admin__form-group admin__form-group--actions"
                                                        >
                                                            <button
                                                                type="button"
                                                                class="admin__form-button admin__form-button--cancel-pv paragraph paragraph--secondary btn btn--primary btn-effect"
                                                            >
                                                                Cancel
                                                            </button>

                                                            <button
                                                                type="submit"
                                                                class="admin__form-button admin__form-button--submit paragraph paragraph--secondary btn btn--secondary btn-effect"
                                                            >
                                                                Submit
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col l-12 m-12 c-12">
                                    <p
                                        class="admin__empty-product product__empty paragraph paragraph--primary"
                                    >
                                        No results found
                                    </p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <c:set
                        var="pages"
                        value="${Math.ceil(requestScope.TOTAL_PRODUCTS / requestScope.size)}"
                        scope="page"
                    />
                    <c:choose>
                        <c:when test="${pages > 1}">
                            <div class="pagination">
                                <c:if test="${requestScope.page > 1}">
                                    <c:url value="MainController" var="prevUrl">
                                        <c:param
                                            name="action"
                                            value="Product"
                                        />
                                        <c:param
                                            name="location"
                                            value="admin"
                                        />
                                        <c:param name="flag" value="true" />
                                        <c:param
                                            name="page"
                                            value="${page - 1}"
                                        />
                                        <c:if
                                            test="${requestScope.CATEGORY_ID != null}"
                                        >
                                            <c:param
                                                name="categoryID"
                                                value="${requestScope.CATEGORY_ID}"
                                            />
                                        </c:if>
                                        <c:if test="${param.search != null}">
                                            <c:param
                                                name="search"
                                                value="${param.search}"
                                            />
                                        </c:if>
                                    </c:url>
                                    <a
                                        href="${prevUrl}"
                                        class="pagination__link pagination__link--prev"
                                    >
                                        <i class="fa-solid fa-backward"></i>
                                    </a>
                                </c:if>

                                <c:set var="begin" value="1" />
                                <c:set var="end" value="5" />

                                <c:choose>
                                    <c:when
                                        test="${requestScope.page - 4 <= 1}"
                                    >
                                        <c:if test="${pages < 5}">
                                            <c:set var="end" value="${pages}" />
                                        </c:if>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set
                                            var="begin"
                                            value="${page - 4}"
                                        />
                                        <c:set var="end" value="${begin + 4}" />
                                        <c:if test="${end >= pages}">
                                            <c:set var="begin" value="1" />
                                            <c:set var="end" value="${pages}" />
                                            <c:if test="${pages > 5}">
                                                <c:set
                                                    var="begin"
                                                    value="${pages - 4}"
                                                />
                                            </c:if>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>

                                <c:forEach
                                    var="i"
                                    begin="${begin}"
                                    end="${end}"
                                    step="1"
                                >
                                    <c:url value="MainController" var="url">
                                        <c:param
                                            name="action"
                                            value="Product"
                                        />
                                        <c:param
                                            name="location"
                                            value="admin"
                                        />
                                        <c:param name="flag" value="true" />
                                        <c:param name="page" value="${i}" />
                                        <c:if
                                            test="${requestScope.CATEGORY_ID != null}"
                                        >
                                            <c:param
                                                name="categoryID"
                                                value="${requestScope.CATEGORY_ID}"
                                            />
                                        </c:if>
                                        <c:if test="${param.search != null}">
                                            <c:param
                                                name="search"
                                                value="${param.search}"
                                            />
                                        </c:if>
                                    </c:url>
                                    <c:choose>
                                        <c:when test="${i == page}">
                                            <a
                                                href="${url}"
                                                class="pagination__link paragraph paragraph--primary pagination__link--active"
                                            >
                                                ${i}
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a
                                                href="${url}"
                                                class="pagination__link paragraph paragraph--primary"
                                            >
                                                ${i}
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <c:if test="${pages > page}">
                                    <c:url value="MainController" var="nextUrl">
                                        <c:param
                                            name="action"
                                            value="Product"
                                        />
                                        <c:param
                                            name="location"
                                            value="admin"
                                        />
                                        <c:param name="flag" value="true" />
                                        <c:param
                                            name="page"
                                            value="${page + 1}"
                                        />
                                        <c:if
                                            test="${requestScope.CATEGORY_ID != null}"
                                        >
                                            <c:param
                                                name="categoryID"
                                                value="${requestScope.CATEGORY_ID}"
                                            />
                                        </c:if>
                                        <c:if test="${param.search != null}">
                                            <c:param
                                                name="search"
                                                value="${param.search}"
                                            />
                                        </c:if>
                                    </c:url>
                                    <a
                                        href="${nextUrl}"
                                        class="pagination__link pagination__link--next"
                                    >
                                        <i class="fa-solid fa-forward"></i>
                                    </a>
                                </c:if>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </session>
        </main>
        <script type="module" src="./assets/js/main.js"></script>
        <script type="module">
            import toast from "./assets/js/toast.js";
            let showErrorToast = false;
            <c:if test="${requestScope.UPDATE_SUCCESS != null}">
                showErrorToast = true;
            </c:if>;

            if (showErrorToast) {
                toast({
                    title: "Success!",
                    message: "${requestScope.UPDATE_SUCCESS}",
                    type: "success",
                    duration: 3000,
                });
                showErrorToast = false;
            }

            <c:if test="${requestScope.UPDATE_ERROR != null}">
                showErrorToast = true;
            </c:if>;

            if (showErrorToast) {
                toast({
                    title: "Error!",
                    message: "${requestScope.UPDATE_ERROR}",
                    type: "error",
                    duration: 3000,
                });
                showErrorToast = false;
            }

            <c:if test="${requestScope.CREATE_SUCCESS != null}">
                showErrorToast = true;
            </c:if>;

            if (showErrorToast) {
                toast({
                    title: "Success!",
                    message: "${requestScope.CREATE_SUCCESS}",
                    type: "success",
                    duration: 3000,
                });
                showErrorToast = false;
            }

            <c:if test="${requestScope.CREATE_ERROR != null}">
                showErrorToast = true;
            </c:if>;

            if (showErrorToast) {
                toast({
                    title: "Error!",
                    message: "${requestScope.CREATE_ERROR}",
                    type: "error",
                    duration: 3000,
                });
                showErrorToast = false;
            }
        </script>
    </body>
</html>
