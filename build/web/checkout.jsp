<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--Import UTF-8-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <section class="checkout">
                <div class="grid wide">
                    <div class="row no-gutters">
                        <div class="col l-6 m-6 c-6">
                            <h1
                                class="checkout__title heading heading--tertiary"
                            >
                                Delivery Address
                            </h1>

                            <c:forEach
                                var="o"
                                items="${sessionScope.ADDRESSES}"
                            >
                                <c:if test="${o.isDefault}">
                                    <c:set
                                        var="addressDefault"
                                        value="${o}"
                                        scope="page"
                                    />
                                </c:if>
                            </c:forEach>

                            <c:forEach
                                var="o"
                                items="${sessionScope.CART}"
                                varStatus="loop"
                            >
                                <c:if
                                    test="${o.productVariant.quantity >= o.quantity}"
                                >
                                    <c:set
                                        var="total"
                                        value="${total + (o.quantity * o.productVariant.price)}"
                                        scope="page"
                                    />
                                </c:if>
                            </c:forEach>

                            <div class="checkout__address">
                                <c:choose>
                                    <c:when test="${addressDefault != null}">
                                        <div
                                            class="user__address-item"
                                            data-address-id="1"
                                        >
                                            <div class="user__content-row">
                                                <p
                                                    class="user__address-name checkout__address-name paragraph paragraph--primary"
                                                >
                                                    ${addressDefault.fullName}
                                                </p>

                                                <p
                                                    class="user__address-phone checkout__address-phone paragraph paragraph--primary"
                                                >
                                                    ${addressDefault.phone}
                                                </p>

                                                <button
                                                    class="checkout__change-address btn-effect paragraph paragraph--secondary"
                                                >
                                                    <svg
                                                        xmlns="http://www.w3.org/2000/svg"
                                                        xmlns:xlink="http://www.w3.org/1999/xlink"
                                                        version="1.1"
                                                        width="17"
                                                        height="17"
                                                        viewBox="0 0 17 17"
                                                    >
                                                        <g></g>
                                                        <path
                                                            d="M8.5 5.972c-1.378 0-2.5 1.122-2.5 2.5s1.122 2.5 2.5 2.5 2.5-1.122 2.5-2.5-1.122-2.5-2.5-2.5zM8.5 9.972c-0.827 0-1.5-0.673-1.5-1.5s0.673-1.5 1.5-1.5 1.5 0.673 1.5 1.5-0.673 1.5-1.5 1.5zM16.94 9.446c0.037-0.321 0.060-0.645 0.060-0.974s-0.023-0.653-0.060-0.974l-2.588-0.778c-0.119-0.402-0.278-0.787-0.474-1.149l1.279-2.377c-0.406-0.51-0.869-0.973-1.38-1.38l-2.377 1.28c-0.363-0.196-0.748-0.354-1.15-0.474l-0.776-2.588c-0.32-0.037-0.644-0.060-0.974-0.060s-0.654 0.023-0.974 0.060l-0.776 2.588c-0.403 0.119-0.789 0.278-1.15 0.475l-2.377-1.28c-0.511 0.406-0.974 0.869-1.379 1.38l1.279 2.375c-0.196 0.362-0.354 0.748-0.474 1.15l-2.589 0.778c-0.037 0.32-0.060 0.644-0.060 0.974s0.023 0.654 0.060 0.974l2.588 0.776c0.12 0.403 0.278 0.789 0.474 1.151l-1.279 2.376c0.406 0.511 0.869 0.974 1.38 1.38l2.377-1.279c0.362 0.196 0.748 0.354 1.15 0.474l0.776 2.588c0.321 0.037 0.645 0.060 0.974 0.060s0.654-0.023 0.974-0.060l0.776-2.588c0.402-0.12 0.788-0.278 1.15-0.474l2.376 1.279c0.511-0.407 0.974-0.87 1.38-1.381l-1.278-2.376c0.196-0.362 0.354-0.748 0.474-1.15l2.588-0.776zM13.548 9.419l-0.154 0.518c-0.1 0.337-0.233 0.66-0.396 0.959l-0.256 0.475 0.255 0.475 0.952 1.77c-0.099 0.105-0.201 0.207-0.306 0.306l-2.243-1.209-0.475 0.256c-0.301 0.163-0.624 0.295-0.96 0.396l-0.518 0.154-0.155 0.518-0.579 1.932c-0.072 0.002-0.143 0.003-0.213 0.003s-0.141-0.001-0.213-0.003l-0.579-1.932-0.155-0.518-0.518-0.154c-0.336-0.1-0.659-0.233-0.959-0.396l-0.475-0.256-2.245 1.207c-0.104-0.099-0.207-0.201-0.306-0.306l1.208-2.244-0.256-0.475c-0.162-0.3-0.295-0.623-0.396-0.96l-0.153-0.517-2.449-0.734c-0.003-0.072-0.004-0.143-0.004-0.212 0-0.070 0.001-0.141 0.004-0.213l2.448-0.734 0.154-0.518c0.1-0.337 0.233-0.66 0.396-0.959l0.256-0.475-1.208-2.245c0.099-0.104 0.201-0.207 0.305-0.306l2.247 1.21 0.476-0.259c0.297-0.162 0.619-0.295 0.956-0.395l0.518-0.154 0.155-0.518 0.579-1.932c0.073-0.001 0.144-0.002 0.214-0.002s0.141 0.001 0.213 0.003l0.579 1.932 0.155 0.518 0.518 0.154c0.335 0.1 0.659 0.233 0.96 0.396l0.475 0.255 2.244-1.208c0.104 0.099 0.207 0.201 0.306 0.306l-0.953 1.77-0.255 0.475 0.257 0.475c0.163 0.3 0.295 0.622 0.395 0.957l0.154 0.518 0.518 0.155 1.932 0.581c0.001 0.072 0.002 0.143 0.002 0.213s-0.001 0.141-0.004 0.213l-2.448 0.734z"
                                                            fill="currentColor"
                                                        />
                                                    </svg>
                                                    <span
                                                        class="checkout__change-address-text"
                                                    >
                                                        Settings
                                                    </span>
                                                </button>
                                            </div>

                                            <p
                                                class="user__address-specific checkout__address-specific paragraph paragraph--secondary"
                                            >
                                                ${addressDefault.specificAddress}
                                            </p>

                                            <button
                                                class="user__address-flag-default checkout__address-flag checkout__address-flag--active paragraph paragraph--secondary"
                                            >
                                                Default
                                            </button>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="user__addresses-content">
                                            <div class="user__address-empty">
                                                <img
                                                    src="./assets/icons/face-sad.svg"
                                                    alt=""
                                                    class="user__address-empty-icon"
                                                />
                                                <p
                                                    class="user__address-empty-text paragraph paragraph--primary"
                                                >
                                                    You don't have any addresses
                                                </p>
                                            </div>

                                            <button
                                                class="checkout__change-address checkout__change-address--active btn-effect paragraph paragraph--secondary"
                                            >
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                                    version="1.1"
                                                    width="17"
                                                    height="17"
                                                    viewBox="0 0 17 17"
                                                >
                                                    <g></g>
                                                    <path
                                                        d="M8.5 5.972c-1.378 0-2.5 1.122-2.5 2.5s1.122 2.5 2.5 2.5 2.5-1.122 2.5-2.5-1.122-2.5-2.5-2.5zM8.5 9.972c-0.827 0-1.5-0.673-1.5-1.5s0.673-1.5 1.5-1.5 1.5 0.673 1.5 1.5-0.673 1.5-1.5 1.5zM16.94 9.446c0.037-0.321 0.060-0.645 0.060-0.974s-0.023-0.653-0.060-0.974l-2.588-0.778c-0.119-0.402-0.278-0.787-0.474-1.149l1.279-2.377c-0.406-0.51-0.869-0.973-1.38-1.38l-2.377 1.28c-0.363-0.196-0.748-0.354-1.15-0.474l-0.776-2.588c-0.32-0.037-0.644-0.060-0.974-0.060s-0.654 0.023-0.974 0.060l-0.776 2.588c-0.403 0.119-0.789 0.278-1.15 0.475l-2.377-1.28c-0.511 0.406-0.974 0.869-1.379 1.38l1.279 2.375c-0.196 0.362-0.354 0.748-0.474 1.15l-2.589 0.778c-0.037 0.32-0.060 0.644-0.060 0.974s0.023 0.654 0.060 0.974l2.588 0.776c0.12 0.403 0.278 0.789 0.474 1.151l-1.279 2.376c0.406 0.511 0.869 0.974 1.38 1.38l2.377-1.279c0.362 0.196 0.748 0.354 1.15 0.474l0.776 2.588c0.321 0.037 0.645 0.060 0.974 0.060s0.654-0.023 0.974-0.060l0.776-2.588c0.402-0.12 0.788-0.278 1.15-0.474l2.376 1.279c0.511-0.407 0.974-0.87 1.38-1.381l-1.278-2.376c0.196-0.362 0.354-0.748 0.474-1.15l2.588-0.776zM13.548 9.419l-0.154 0.518c-0.1 0.337-0.233 0.66-0.396 0.959l-0.256 0.475 0.255 0.475 0.952 1.77c-0.099 0.105-0.201 0.207-0.306 0.306l-2.243-1.209-0.475 0.256c-0.301 0.163-0.624 0.295-0.96 0.396l-0.518 0.154-0.155 0.518-0.579 1.932c-0.072 0.002-0.143 0.003-0.213 0.003s-0.141-0.001-0.213-0.003l-0.579-1.932-0.155-0.518-0.518-0.154c-0.336-0.1-0.659-0.233-0.959-0.396l-0.475-0.256-2.245 1.207c-0.104-0.099-0.207-0.201-0.306-0.306l1.208-2.244-0.256-0.475c-0.162-0.3-0.295-0.623-0.396-0.96l-0.153-0.517-2.449-0.734c-0.003-0.072-0.004-0.143-0.004-0.212 0-0.070 0.001-0.141 0.004-0.213l2.448-0.734 0.154-0.518c0.1-0.337 0.233-0.66 0.396-0.959l0.256-0.475-1.208-2.245c0.099-0.104 0.201-0.207 0.305-0.306l2.247 1.21 0.476-0.259c0.297-0.162 0.619-0.295 0.956-0.395l0.518-0.154 0.155-0.518 0.579-1.932c0.073-0.001 0.144-0.002 0.214-0.002s0.141 0.001 0.213 0.003l0.579 1.932 0.155 0.518 0.518 0.154c0.335 0.1 0.659 0.233 0.96 0.396l0.475 0.255 2.244-1.208c0.104 0.099 0.207 0.201 0.306 0.306l-0.953 1.77-0.255 0.475 0.257 0.475c0.163 0.3 0.295 0.622 0.395 0.957l0.154 0.518 0.518 0.155 1.932 0.581c0.001 0.072 0.002 0.143 0.002 0.213s-0.001 0.141-0.004 0.213l-2.448 0.734z"
                                                        fill="currentColor"
                                                    />
                                                </svg>
                                                <span
                                                    class="checkout__change-address-text"
                                                >
                                                    Settings
                                                </span>
                                            </button>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                                <div class="checkout__address-popup">
                                    <div class="checkout__address-inner">
                                        <div class="checkout__address-top">
                                            <p
                                                class="checkout__popup-title paragraph paragraph--primary"
                                            >
                                                My Address
                                            </p>

                                            <ul class="checkout__address-list">
                                                <c:forEach
                                                    var="o"
                                                    items="${sessionScope.ADDRESSES}"
                                                >
                                                    <c:choose>
                                                        <c:when
                                                            test="${o.isDefault}"
                                                        >
                                                            <li
                                                                class="checkout__address-item"
                                                            >
                                                                <p
                                                                    class="cart__separate"
                                                                ></p>
                                                                <label
                                                                    for="${o.addressId}"
                                                                    class="checkout__label-option"
                                                                    data-address-default="true"
                                                                >
                                                                    <input
                                                                        id="${o.addressId}"
                                                                        name="address"
                                                                        type="radio"
                                                                        value="${o.addressId}"
                                                                        checked
                                                                        class="form-control checkout__input-option"
                                                                    />
                                                                    <div
                                                                        class="user__content-row"
                                                                    >
                                                                        <p
                                                                            class="user__address-name paragraph paragraph--secondary"
                                                                        >
                                                                            ${o.fullName}
                                                                        </p>

                                                                        <p
                                                                            class="user__address-phone paragraph paragraph--secondary"
                                                                        >
                                                                            ${o.phone}
                                                                        </p>
                                                                    </div>

                                                                    <p
                                                                        class="user__address-specific paragraph paragraph--secondary"
                                                                    >
                                                                        ${o.specificAddress}
                                                                    </p>

                                                                    <button
                                                                        class="user__address-flag-default checkout__address-flag checkout__address-flag--active paragraph paragraph--secondary"
                                                                    >
                                                                        Default
                                                                    </button>
                                                                </label>
                                                            </li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li
                                                                class="checkout__address-item"
                                                            >
                                                                <p
                                                                    class="cart__separate"
                                                                ></p>
                                                                <label
                                                                    for="${o.addressId}"
                                                                    class="checkout__label-option"
                                                                >
                                                                    <input
                                                                        id="${o.addressId}"
                                                                        name="address"
                                                                        type="radio"
                                                                        value="${o.addressId}"
                                                                        class="form-control checkout__input-option"
                                                                    />
                                                                    <div
                                                                        class="user__content-row"
                                                                    >
                                                                        <p
                                                                            class="user__address-name paragraph paragraph--secondary"
                                                                        >
                                                                            ${o.fullName}
                                                                        </p>

                                                                        <p
                                                                            class="user__address-phone paragraph paragraph--secondary"
                                                                        >
                                                                            ${o.phone}
                                                                        </p>
                                                                    </div>

                                                                    <p
                                                                        class="user__address-specific paragraph paragraph--secondary"
                                                                    >
                                                                        ${o.specificAddress}
                                                                    </p>

                                                                    <button
                                                                        class="user__address-flag-default checkout__address-flag paragraph paragraph--secondary"
                                                                    >
                                                                        Default
                                                                    </button>
                                                                </label>
                                                            </li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </ul>

                                            <button
                                                class="user__content-addresses checkout__address-new paragraph paragraph--secondary btn btn--primary btn-effect"
                                            >
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                                    version="1.1"
                                                    width="17"
                                                    height="17"
                                                    viewBox="0 0 17 17"
                                                    class="user__content-addresses-icon"
                                                >
                                                    <path
                                                        d="M16 9h-7v7h-1v-7h-7v-1h7v-7h1v7h7v1z"
                                                        fill="currentColor"
                                                    ></path>
                                                </svg>
                                                <span
                                                    class="user__content-addresses-text"
                                                >
                                                    Add New Address
                                                </span>
                                            </button>
                                        </div>

                                        <div class="checkout__address-bottom">
                                            <p class="cart__separate"></p>

                                            <div
                                                class="checkout__address-actions"
                                            >
                                                <button
                                                    class="checkout__address-action-btn checkout__address-action-btn--cancel btn btn--primary btn-effect"
                                                >
                                                    Cancel
                                                </button>
                                                <c:if
                                                    test="${not empty sessionScope.ADDRESSES}"
                                                >
                                                    <button
                                                        class="checkout__address-action-btn checkout__address-action-btn--confirm btn btn--secondary btn-effect"
                                                    >
                                                        Confirm
                                                    </button>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="user__address-popup">
                                    <div class="user__address-popup-inner">
                                        <p
                                            class="user__address-popup-title paragraph paragraph--primary"
                                        >
                                            New Address
                                        </p>

                                        <form
                                            action="MainController"
                                            method="POST"
                                            id="user__address-form"
                                            autocomplete="off"
                                        >
                                            <div
                                                class="form-group form__form-group"
                                            >
                                                <input
                                                    id="fullName"
                                                    name="fullName"
                                                    rules="required"
                                                    type="text"
                                                    placeholder="Full name"
                                                    required=""
                                                    class="form-control form__form-input paragraph paragraph--secondary"
                                                />
                                                <span
                                                    class="form-message"
                                                ></span>
                                            </div>

                                            <div
                                                class="form-group form__form-group"
                                            >
                                                <input
                                                    id="phone"
                                                    name="phone"
                                                    rules="required|tel"
                                                    type="tel"
                                                    placeholder="Phone Number"
                                                    required=""
                                                    pattern="^(0|\+?84)(3|5|7|8|9)[0-9]{8}$"
                                                    class="form-control form__form-input paragraph paragraph--secondary"
                                                />
                                                <span
                                                    class="form-message"
                                                ></span>
                                            </div>

                                            <div
                                                class="form-group form__form-group"
                                            >
                                                <input
                                                    id="address"
                                                    name="address"
                                                    rules="required"
                                                    type="text"
                                                    placeholder="Specific Address"
                                                    required=""
                                                    maxlength="255"
                                                    class="form-control form__form-input paragraph paragraph--secondary"
                                                />
                                                <span
                                                    class="form-message"
                                                ></span>
                                            </div>

                                            <div
                                                class="form-group form__form-group"
                                            >
                                                <div
                                                    class="user__address-buttons"
                                                >
                                                    <button
                                                        type="button"
                                                        class="user__address-btn user__address-btn--cancel paragraph paragraph--secondary"
                                                    >
                                                        Cancel
                                                    </button>

                                                    <button
                                                        type="submit"
                                                        name="action"
                                                        value="SetAddress"
                                                        class="user__address-btn user__address-btn--submit paragraph paragraph--secondary"
                                                    >
                                                        Submit
                                                    </button>
                                                </div>
                                                <input
                                                    type="hidden"
                                                    name="page"
                                                    value="checkout"
                                                />
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col l-6 m-6 c-6">
                            <section class="cart__summary">
                                <p
                                    class="cart__summary-title heading heading--quaternary"
                                >
                                    Your order
                                </p>

                                <p class="cart__separate"></p>

                                <fmt:formatNumber
                                    value="${total}"
                                    pattern="#0.00"
                                    var="formattedTotal"
                                />
                                <ul class="cart__summary-list">
                                    <li
                                        class="cart__summary-item paragraph paragraph--secondary"
                                    >
                                        <p class="cart__summary-item-key">
                                            Original Price
                                        </p>
                                        <p class="cart__summary-item-value">
                                            $${formattedTotal}
                                        </p>
                                    </li>
                                    <li
                                        class="cart__summary-item paragraph paragraph--secondary"
                                    >
                                        <p class="cart__summary-item-key">
                                            Savings
                                        </p>
                                        <p class="cart__summary-item-value">
                                            $0.00
                                        </p>
                                    </li>
                                    <li
                                        class="cart__summary-item paragraph paragraph--secondary"
                                    >
                                        <p class="cart__summary-item-key">
                                            Shipping
                                        </p>
                                        <p class="cart__summary-item-value">
                                            FREE
                                        </p>
                                    </li>
                                    <li
                                        class="cart__summary-item paragraph paragraph--secondary"
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

                                <c:if test="${addressDefault != null}">
                                    <div class="checkout__pay-method">
                                        <p
                                            class="cart__summary-title heading heading--quaternary"
                                        >
                                            Pay with
                                        </p>

                                        <form
                                            action=""
                                            method="post"
                                            id="checkout__form"
                                        >
                                            <div
                                                class="form-group checkout__form-group"
                                            >
                                                <label
                                                    for="cash"
                                                    class="checkout__form-label paragraph paragraph--secondary"
                                                >
                                                    <input
                                                        id="cash"
                                                        name="payment"
                                                        type="radio"
                                                        value="cash"
                                                        class="form-control checkout__form-control"
                                                        checked
                                                    />
                                                    CASH
                                                </label>
                                            </div>

                                            <p
                                                class="cart__separate checkout__separate"
                                            ></p>

                                            <div
                                                class="form-group checkout__form-group"
                                            >
                                                <label
                                                    for="vnpay"
                                                    class="checkout__form-label paragraph paragraph--secondary"
                                                >
                                                    <input
                                                        id="vnpay"
                                                        name="payment"
                                                        type="radio"
                                                        value="vnpay"
                                                        class="form-control checkout__form-control"
                                                    />
                                                    VNPAY
                                                    <a
                                                        class="checkout__form-icon-wrapper"
                                                    >
                                                        <img
                                                            src="./assets/icons/vnpay-seeklogo.com.svg"
                                                            alt=""
                                                            class="checkout__form-icon"
                                                        />
                                                    </a>
                                                </label>
                                            </div>

                                            <button
                                                type="submit"
                                                class="cart__summary-checkout checkout__form-submit button-text btn btn--secondary btn-effect"
                                            >
                                                Place Order
                                            </button>
                                        </form>
                                    </div>
                                </c:if>
                            </section>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <script type="module" src="./assets/js/main.js"></script>
    </body>
</html>
