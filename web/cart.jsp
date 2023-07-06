<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--Import fmt-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
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
        <c:import url="./header.jsp" />

        <main>
            <div id="toast"></div>
            <section class="cart">
                <div class="grid wide">
                    <div class="row no-gutters">
                        <div class="col l-6 m-6 c-6">
                            <h1
                                class="cart__heading heading heading--quaternary"
                            >
                                Shopping cart (${sessionScope.CART.size()}
                                items)
                            </h1>

                            <ul class="cart__list">
                                <c:forEach
                                    var="o"
                                    items="${sessionScope.CART}"
                                    varStatus="loop"
                                >
                                    <c:choose>
                                        <c:when
                                            test="${o.productVariant.quantity >= o.quantity}"
                                        >
                                            <c:set
                                                var="total"
                                                value="${total + (o.quantity * o.productVariant.price)}"
                                                scope="page"
                                            />
                                            <li class="cart__item">
                                                <article class="cart__info">
                                                    <header
                                                        class="cart__info-header"
                                                    >
                                                        <p
                                                            class="cart__header-counter paragraph paragraph--tertiary"
                                                        >
                                                            Item ${loop.count}
                                                        </p>

                                                        <div
                                                            class="cart__header-actions"
                                                        >
                                                            <a
                                                                href="#!"
                                                                class="cart__header-link paragraph paragraph--tertiary"
                                                            >
                                                                Save for later
                                                            </a>
                                                            <c:url
                                                                var="UpdateUrl"
                                                                value="MainController"
                                                            >
                                                                <c:param
                                                                    name="action"
                                                                    value="UpdateCart"
                                                                />
                                                                <c:param
                                                                    name="cartId"
                                                                    value="${o.cart.cartId}"
                                                                />
                                                                <c:param
                                                                    name="pvId"
                                                                    value="${o.productVariant.productVariantId}"
                                                                />
                                                                <c:param
                                                                    name="qty"
                                                                    value="${o.quantity}"
                                                                />
                                                            </c:url>
                                                            <a
                                                                href="${UpdateUrl}"
                                                                class="cart__header-link cart__header-link--update paragraph paragraph--tertiary"
                                                            >
                                                                Update
                                                            </a>

                                                            <c:url
                                                                var="deleteUrl"
                                                                value="MainController"
                                                            >
                                                                <c:param
                                                                    name="action"
                                                                    value="DeleteCart"
                                                                />
                                                                <c:param
                                                                    name="cartId"
                                                                    value="${o.cart.cartId}"
                                                                />
                                                                <c:param
                                                                    name="pvId"
                                                                    value="${o.productVariant.productVariantId}"
                                                                />
                                                            </c:url>
                                                            <a
                                                                href="${deleteUrl}"
                                                                class="cart__header-link paragraph paragraph--tertiary"
                                                            >
                                                                Remove
                                                            </a>
                                                        </div>

                                                        <div
                                                            class="cart__header-qty-wrapper"
                                                        >
                                                            <p
                                                                class="cart__header-qty-text button-text"
                                                            >
                                                                Qty:
                                                            </p>

                                                            <div
                                                                class="cart__header-qty-group"
                                                            >
                                                                <button
                                                                    class="cart__header-btn cart__header-btn--decrease"
                                                                >
                                                                    <svg
                                                                        width="12"
                                                                        height="2"
                                                                        viewBox="0 0 12 2"
                                                                        fill="none"
                                                                        xmlns="http://www.w3.org/2000/svg"
                                                                        class="cart__header-btn-icon"
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
                                                                    value="${o.quantity}"
                                                                    autocomplete="off"
                                                                    class="cart__header-qty-input"
                                                                    data-pv-qty="${o.productVariant.quantity}"
                                                                />

                                                                <button
                                                                    class="cart__header-btn cart__header-btn--increase"
                                                                >
                                                                    <svg
                                                                        width="12"
                                                                        height="12"
                                                                        viewBox="0 0 12 12"
                                                                        fill="none"
                                                                        xmlns="http://www.w3.org/2000/svg"
                                                                        class="cart__header-btn-icon"
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
                                                    </header>

                                                    <p
                                                        class="cart__separate"
                                                    ></p>

                                                    <c:url
                                                        var="detailUrl"
                                                        value="MainController"
                                                    >
                                                        <c:param
                                                            name="action"
                                                            value="Detail"
                                                        />
                                                        <c:param
                                                            name="productId"
                                                            value="${o.productVariant.product.productId}"
                                                        />
                                                    </c:url>
                                                    <section
                                                        class="cart__info-body"
                                                    >
                                                        <figure
                                                            class="cart__body-img-wrapper"
                                                        >
                                                            <a
                                                                href="${detailUrl}"
                                                                class="cart__product-link"
                                                            >
                                                                <img
                                                                    src="${o.productVariant.product.imageUrl}"
                                                                    alt=""
                                                                    class="cart__body-img"
                                                                />
                                                            </a>
                                                        </figure>

                                                        <div
                                                            class="cart__info-content"
                                                        >
                                                            <h2
                                                                class="cart__content-title button-text"
                                                            >
                                                                <a
                                                                    href="${detailUrl}"
                                                                    class="cart__product-link"
                                                                >
                                                                    ${o.productVariant.product.productName}
                                                                </a>
                                                            </h2>

                                                            <p
                                                                class="cart__content-id paragraph paragraph--secondary"
                                                            >
                                                                Variation:
                                                                ${o.productVariant.variantColor.colorName},
                                                                ${o.productVariant.variantSize.sizeName}
                                                            </p>

                                                            <p
                                                                class="cart__content-price button-text"
                                                            >
                                                                $${o.productVariant.price}
                                                            </p>
                                                        </div>
                                                    </section>
                                                </article>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="cart__item">
                                                <article class="cart__info">
                                                    <header
                                                        class="cart__info-header"
                                                    >
                                                        <p
                                                            class="cart__header-counter paragraph paragraph--tertiary"
                                                        >
                                                            Item ${loop.count}
                                                        </p>

                                                        <div
                                                            class="cart__header-actions cart__empty"
                                                        >
                                                            <c:url
                                                                var="deleteUrl"
                                                                value="MainController"
                                                            >
                                                                <c:param
                                                                    name="action"
                                                                    value="DeleteCart"
                                                                />
                                                                <c:param
                                                                    name="cartId"
                                                                    value="${o.cart.cartId}"
                                                                />
                                                                <c:param
                                                                    name="pvId"
                                                                    value="${o.productVariant.productVariantId}"
                                                                />
                                                            </c:url>
                                                            <a
                                                                href="${deleteUrl}"
                                                                class="cart__header-link paragraph paragraph--tertiary"
                                                            >
                                                                Remove
                                                            </a>
                                                                
                                                                

                                                        <p
                                                            class="cart__empty paragraph paragraph--tertiary"
                                                        >
                                                            Out Of Stock
                                                        </p>
                                                        </div>
                                                    </header>

                                                    <p
                                                        class="cart__separate"
                                                    ></p>

                                                    <c:url
                                                        var="detailUrl"
                                                        value="MainController"
                                                    >
                                                        <c:param
                                                            name="action"
                                                            value="Detail"
                                                        />
                                                        <c:param
                                                            name="productId"
                                                            value="${o.productVariant.product.productId}"
                                                        />
                                                    </c:url>
                                                    <section
                                                        class="cart__info-body"
                                                    >
                                                        <figure
                                                            class="cart__body-img-wrapper"
                                                        >
                                                            <a
                                                                href="${detailUrl}"
                                                                class="cart__product-link"
                                                            >
                                                                <img
                                                                    src="${o.productVariant.product.imageUrl}"
                                                                    alt=""
                                                                    class="cart__body-img"
                                                                />
                                                            </a>
                                                        </figure>

                                                        <div
                                                            class="cart__info-content"
                                                        >
                                                            <h2
                                                                class="cart__content-title button-text"
                                                            >
                                                                <a
                                                                    href="${detailUrl}"
                                                                    class="cart__product-link"
                                                                >
                                                                    ${o.productVariant.product.productName}
                                                                </a>
                                                            </h2>

                                                            <p
                                                                class="cart__content-id paragraph paragraph--secondary"
                                                            >
                                                                Variation:
                                                                ${o.productVariant.variantColor.colorName},
                                                                ${o.productVariant.variantSize.sizeName}
                                                            </p>

                                                            <p
                                                                class="cart__content-price button-text"
                                                            >
                                                                $${o.productVariant.price}
                                                            </p>
                                                        </div>
                                                    </section>
                                                </article>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </ul>
                        </div>

                        <div class="col l-6 m-6 c-6">
                            <section class="cart__summary">
                                <p
                                    class="cart__summary-title heading heading--quaternary"
                                >
                                    Order Summary
                                </p>

                                <p class="cart__separate"></p>

                                <fmt:formatNumber
                                    value="${total}"
                                    pattern="#0.00"
                                    var="formattedTotal"
                                />
                                <ul class="cart__summary-list">
                                    <li
                                        class="cart__summary-item paragraph paragraph--tertiary"
                                    >
                                        <p class="cart__summary-item-key">
                                            Original Price
                                        </p>
                                        <p class="cart__summary-item-value">
                                            $${formattedTotal}
                                        </p>
                                    </li>
                                    <li
                                        class="cart__summary-item paragraph paragraph--tertiary"
                                    >
                                        <p class="cart__summary-item-key">
                                            Savings
                                        </p>
                                        <p class="cart__summary-item-value">
                                            $0.00
                                        </p>
                                    </li>
                                    <li
                                        class="cart__summary-item paragraph paragraph--tertiary"
                                    >
                                        <p class="cart__summary-item-key">
                                            Shipping
                                        </p>
                                        <p class="cart__summary-item-value">
                                            FREE
                                        </p>
                                    </li>
                                    <li
                                        class="cart__summary-item paragraph paragraph--tertiary"
                                    >
                                        <p class="cart__summary-item-key">
                                            Estimated Sales Tax
                                        </p>
                                        <p class="cart__summary-item-value">
                                            $0.00
                                        </p>
                                    </li>
                                </ul>

                                <p class="cart__separate"></p>

                                <p
                                    class="cart__summary-total heading heading--quaternary"
                                >
                                    <span class="cart__total-key">Total</span>
                                    <span class="cart__total-value">
                                        $${formattedTotal}
                                    </span>
                                </p>

                                <a
                                    href="./checkout.jsp"
                                    class="cart__summary-checkout button-text btn btn--secondary btn-effect"
                                >
                                    Proceed to Check Out
                                </a>
                            </section>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <script type="module" src="./assets/js/main.js"></script>
        <script type="module">
            import toast from "./assets/js/toast.js";
            let showErrorToast = false;
            <c:if test="${requestScope.CART_ERROR_QUANTITY != null}">
                showErrorToast = true;
            </c:if>;

            if (showErrorToast) {
                toast({
                    title: "Error!",
                    message: "${requestScope.CART_ERROR_QUANTITY}",
                    type: "error",
                    duration: 3000,
                });
            }
        </script>
    </body>
</html>
