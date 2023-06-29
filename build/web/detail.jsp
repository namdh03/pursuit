<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Pursuit</title>

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

        <!-- Styles CSS -->
        <link rel="stylesheet" href="./assets/css/main.css" />
    </head>
    <body>
        <c:import url="./header.jsp" />

        <main>
            <div id="toast"></div>
            <section class="detail">
                <div class="grid wide">
                    <div class="row no-gutters">
                        <div class="col l-6 m-6 c-6">
                            <figure class="detail__img-wrapper">
                                <img src="" alt="" class="detail__main-img" />
                            </figure>
                        </div>

                        <div class="col l-6 m-6 c-6">
                            <div class="detail__content">
                                <c:url
                                    var="categoryByIdUrl"
                                    value="MainController"
                                >
                                    <c:param name="action" value="Product" />
                                    <c:param
                                        name="categoryID"
                                        value="${requestScope.PRODUCT.product.category.categoryId}"
                                    />
                                </c:url>
                                <a
                                    href="${categoryByIdUrl}"
                                    class="detail__category paragraph paragraph--tertiary"
                                >
                                    ${requestScope.PRODUCT.product.category.categoryName}
                                </a>

                                <h1
                                    class="detail__heading heading heading--tertiary"
                                >
                                    ${requestScope.PRODUCT.product.productName}
                                </h1>

                                <div class="detail__price-wrapper">
                                    <input
                                        type="hidden"
                                        name="originPrice"
                                        value="${requestScope.PRODUCT.price}"
                                        class="detail__price-origin"
                                    />
                                    <p
                                        class="detail__price detail__price--main paragraph paragraph--primary"
                                    >
                                        $${requestScope.PRODUCT.price}
                                    </p>
                                    <p
                                        class="detail__price detail__price--discount paragraph paragraph--primary"
                                    >
                                        $${requestScope.PRODUCT.price}
                                    </p>
                                </div>

                                <div class="detail__rating">
                                    <img
                                        src="./assets/icons/star.svg"
                                        alt=""
                                        class="detail__rating-icon"
                                    />

                                    <p
                                        class="detail__rating-value paragraph paragraph--primary"
                                    >
                                        5.0 (37)
                                    </p>
                                </div>

                                <form
                                    action=""
                                    class="detail__form"
                                    data-product-id="${requestScope.PRODUCT.product.productId}"
                                >
                                    <div class="form-group">
                                        <div class="detail__color">
                                            <p class="detail__text button-text">
                                                Color:
                                            </p>
                                            <ul class="detail__list">
                                                <c:forEach
                                                    var="o"
                                                    items="${requestScope.COLOR}"
                                                >
                                                    <li
                                                        class="detail__color-item"
                                                    >
                                                        <label
                                                            for="${o.colorName}"
                                                            class="detail__label paragraph paragraph--tertiary btn-effect"
                                                        >
                                                            <input
                                                                type="radio"
                                                                name="color"
                                                                id="${o.colorName}"
                                                                value="${o.colorId}"
                                                                rules="required"
                                                                class="form-control detail__radio detail__radio--color"
                                                            />
                                                            ${o.colorName}
                                                        </label>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="detail__size">
                                            <p class="detail__text button-text">
                                                Size:
                                            </p>
                                            <ul class="detail__list">
                                                <c:forEach
                                                    var="o"
                                                    items="${requestScope.SIZE}"
                                                >
                                                    <li
                                                        class="detail__size-item"
                                                    >
                                                        <label
                                                            for="${o.sizeName}"
                                                            class="detail__label paragraph paragraph--tertiary btn-effect"
                                                        >
                                                            <input
                                                                type="radio"
                                                                name="size"
                                                                id="${o.sizeName}"
                                                                value="${o.sizeId}"
                                                                rules="required"
                                                                class="form-control detail__radio detail__radio--size"
                                                            />
                                                            ${o.sizeName}
                                                        </label>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="detail__qty">
                                            <p class="detail__text button-text">
                                                Qty:
                                            </p>
                                            <div class="form-group">
                                                <div class="detail__list">
                                                    <button
                                                        type="button"
                                                        class="detail__btn detail__btn--minus"
                                                    >
                                                        <svg
                                                            width="12"
                                                            height="2"
                                                            viewBox="0 0 12 2"
                                                            fill="none"
                                                            xmlns="http://www.w3.org/2000/svg"
                                                            class="detail__btn-icon"
                                                        >
                                                            <rect
                                                                y="0.5"
                                                                width="12"
                                                                height="1"
                                                                fill="currentColor"
                                                            />
                                                        </svg>
                                                    </button>

                                                    <input
                                                        id="quantity"
                                                        name="quantity"
                                                        type="text"
                                                        value="1"
                                                        autocomplete="off"
                                                        class="form-control detail__qty-input"
                                                    />

                                                    <button
                                                        type="button"
                                                        class="detail__btn detail__btn--plus"
                                                    >
                                                        <svg
                                                            width="12"
                                                            height="12"
                                                            viewBox="0 0 12 12"
                                                            fill="none"
                                                            xmlns="http://www.w3.org/2000/svg"
                                                            class="detail__btn-icon"
                                                        >
                                                            <rect
                                                                y="5.5"
                                                                width="12"
                                                                height="1"
                                                                fill="currentColor"
                                                            />
                                                            <rect
                                                                x="5.5"
                                                                y="12"
                                                                width="12"
                                                                height="1"
                                                                transform="rotate(-90 5.5 12)"
                                                                fill="currentColor"
                                                            />
                                                        </svg>
                                                    </button>
                                                </div>
                                            </div>

                                            <p
                                                class="detail__qty-value paragraph paragraph--tertiary"
                                            >
                                                <input
                                                    type="hidden"
                                                    name="originPrice"
                                                    value="${requestScope.PRODUCT.product.unitsInStock}"
                                                    class="detail__qty-origin"
                                                />
                                                ${requestScope.PRODUCT.product.unitsInStock}
                                                product(s) are available
                                            </p>
                                        </div>
                                    </div>

                                    <p
                                        class="detail__desc paragraph paragraph--primary"
                                    >
                                        ${requestScope.PRODUCT.product.description}
                                    </p>

                                    <button
                                        type="submit"
                                        class="detail__btn-add-cart button-text btn btn--secondary btn-effect"
                                    >
                                        Add to Cart
                                    </button>
                                </form>

                                <a
                                    href=""
                                    class="detail__btn-checkout button-text btn btn--secondary btn-effect"
                                >
                                    Check Out
                                </a>
                            </div>
                        </div>

                        <div class="col l-6 m-6 c-6">
                            <div class="detail__images-wrapper">
                                <button
                                    class="detail__image-btn detail__image-btn--prev"
                                >
                                    <img
                                        src="./assets/icons/arrow-left.svg"
                                        alt=""
                                        class="detail__image-icon"
                                    />
                                </button>

                                <ul class="detail__image-list">
                                    <c:forEach
                                        var="o"
                                        items="${requestScope.IMAGES}"
                                        varStatus="loop"
                                    >
                                        <c:choose>
                                            <c:when
                                                test="${o.isDefault && o.productVariant.isDefault}"
                                            >
                                                <li
                                                    class="detail__image-item detail__image-item--active"
                                                >
                                                    <img
                                                        src="${o.imageUrl}"
                                                        alt=""
                                                        class="detail__image"
                                                    />
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="detail__image-item">
                                                    <img
                                                        src="${o.imageUrl}"
                                                        alt=""
                                                        class="detail__image"
                                                    />
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </ul>

                                <button
                                    class="detail__image-btn detail__image-btn--next"
                                >
                                    <img
                                        src="./assets/icons/arrow-right.svg"
                                        alt=""
                                        class="detail__image-icon"
                                    />
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <script type="module" src="./assets/js/main.js"></script>
    </body>
</html>
