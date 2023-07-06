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
            <div class="user">
                <div class="grid wide">
                    <div class="row no-gutters">
                        <div class="col l-3 m-3 c-3">
                            <navbar class="user__navbar">
                                <ul class="user__list">
                                    <li class="user__item user__item--active">
                                        <svg
                                            version="1.1"
                                            xmlns="http://www.w3.org/2000/svg"
                                            xmlns:xlink="http://www.w3.org/1999/xlink"
                                            width="24"
                                            height="24"
                                            viewBox="0 0 17 17"
                                            class="user__item-icon"
                                        >
                                            <g></g>
                                            <path
                                                d="M0 3v12h17v-12h-17zM16 14h-15v-10h15v10zM2.562 13.511l-1-0.022c0.033-1.43 1.398-2.652 3.309-3.017v-0.326c-0.248-0.259-0.425-0.61-0.545-0.923-0.162-0.116-0.302-0.294-0.399-0.516-0.185-0.41-0.153-0.821 0.063-1.068-0.004-0.074-0.006-0.147-0.006-0.217l-0.002-0.184c-0.006-0.537-0.016-1.42 0.929-1.584 0.194-0.339 0.483-0.627 1.179-0.651 1.123-0.035 1.916 0.378 2.185 1.151 0.091 0.265 0.006 0.485-0.056 0.645-0.059 0.152-0.115 0.295-0.082 0.564 0.013 0.107 0.011 0.212 0.003 0.312 0.175 0.237 0.211 0.597 0.082 0.975-0.095 0.273-0.249 0.484-0.434 0.608-0.111 0.287-0.27 0.604-0.487 0.845v0.377c1.909 0.375 3.228 1.571 3.261 3.008l-1 0.023c-0.023-1.021-1.21-1.908-2.823-2.109l-0.438-0.055v-1.709l0.2-0.15c0.106-0.080 0.271-0.321 0.415-0.761l0.135-0.344 0.074-0.631c0.014-0.106 0.027-0.207 0.019-0.268-0.062-0.52 0.066-0.85 0.142-1.046 0.005-0.014 0.009-0.023 0.012-0.031-0.21-0.396-0.879-0.413-1.171-0.406-0.277 0.011-0.297 0.050-0.351 0.153-0.068 0.132-0.229 0.442-0.637 0.478-0.092 0.008-0.121 0.027-0.121 0.027-0.041 0.064-0.038 0.367-0.036 0.568l0.001 0.195c0 0.141 0.010 0.292 0.029 0.446l0.070 0.573 0.12 0.021 0.003 0.248c0.154 0.466 0.339 0.721 0.451 0.798l0.215 0.149v1.687l-0.442 0.052c-1.612 0.189-2.844 1.098-2.867 2.115zM15 8h-5v-1h5v1zM14 10h-4v-1h4v1z"
                                                fill="currentColor"
                                            />
                                        </svg>

                                        <span
                                            class="user__item-text paragraph paragraph--secondary"
                                            title="Profile"
                                        >
                                            Profile
                                        </span>
                                    </li>

                                    <li class="user__item">
                                        <svg
                                            version="1.1"
                                            xmlns="http://www.w3.org/2000/svg"
                                            xmlns:xlink="http://www.w3.org/1999/xlink"
                                            width="24"
                                            height="24"
                                            viewBox="0 0 17 17"
                                            class="user__item-icon"
                                        >
                                            <g></g>
                                            <path
                                                d="M15 4v0.069l-0.013-0.058-1.015 0.221c-0.139-1.803-1.634-3.232-3.472-3.232-1.841 0-3.339 1.435-3.474 3.242l-1.026-0.223v-0.019h-6v11h5.348l5.196 1.479 5.456-1.605v-10.874h-1zM10.5 2c1.379 0 2.5 1.122 2.5 2.5 0 1.806-1.719 4.209-2.5 5.207-0.781-0.998-2.5-3.401-2.5-5.207 0-1.378 1.121-2.5 2.5-2.5zM6 5.042l1.081 0.235c0.412 2.269 2.406 4.788 2.919 5.406v4.602l-4-1.139v-9.104zM1 5h4v9.017l-4-0.017v-9zM11 15.303v-4.621c0.514-0.619 2.513-3.145 2.921-5.416l1.079-0.234v9.094l-4 1.177zM11.858 4.583c0-0.749-0.609-1.358-1.358-1.358s-1.358 0.609-1.358 1.358 0.609 1.359 1.358 1.359 1.358-0.609 1.358-1.359zM10.142 4.583c0-0.198 0.161-0.358 0.358-0.358s0.358 0.161 0.358 0.358-0.161 0.359-0.358 0.359-0.358-0.161-0.358-0.359z"
                                                fill="currentColor"
                                            />
                                        </svg>
                                        <span
                                            class="user__item-text paragraph paragraph--secondary"
                                            title="Addresses"
                                        >
                                            Addresses
                                        </span>
                                    </li>

                                    <c:if
                                        test="${sessionScope.USER.username != null}"
                                    >
                                        <li class="user__item">
                                            <svg
                                                version="1.1"
                                                xmlns="http://www.w3.org/2000/svg"
                                                xmlns:xlink="http://www.w3.org/1999/xlink"
                                                width="24"
                                                height="24"
                                                viewBox="0 0 17 17"
                                                class="user__item-icon"
                                            >
                                                <g></g>
                                                <path
                                                    d="M9.5 10.972c0 0.366-0.207 0.672-0.5 0.846v2.154h-1v-2.153c-0.294-0.174-0.5-0.48-0.5-0.847 0-0.552 0.447-1 1-1 0.551 0 1 0.447 1 1zM14.994 8.46v7.080c0 0.827-0.673 1.5-1.5 1.5h-9.988c-0.827 0-1.5-0.673-1.5-1.5v-7.080c0-0.827 0.673-1.5 1.5-1.5h8.994v-1.988c0-2.206-1.794-4-4-4s-4 1.794-4 4h-1c0-2.757 2.243-5 5-5s5 2.243 5 5v1.988c0.824 0.004 1.494 0.675 1.494 1.5zM13.994 8.46c0-0.276-0.225-0.5-0.5-0.5h-9.988c-0.275 0-0.5 0.224-0.5 0.5v7.080c0 0.276 0.225 0.5 0.5 0.5h9.988c0.275 0 0.5-0.224 0.5-0.5v-7.080z"
                                                    fill="currentColor"
                                                />
                                            </svg>
                                            <span
                                                class="user__item-text paragraph paragraph--secondary"
                                                title="Change Password"
                                            >
                                                Change Password
                                            </span>
                                        </li>
                                    </c:if>

                                    <li class="user__item">
                                        <svg
                                            version="1.1"
                                            xmlns="http://www.w3.org/2000/svg"
                                            xmlns:xlink="http://www.w3.org/1999/xlink"
                                            width="24"
                                            height="24"
                                            viewBox="0 0 17 17"
                                            class="user__item-icon"
                                        >
                                            <g></g>
                                            <path
                                                d="M2.75 12.5c-0.965 0-1.75 0.785-1.75 1.75s0.785 1.75 1.75 1.75 1.75-0.785 1.75-1.75-0.785-1.75-1.75-1.75zM2.75 15c-0.413 0-0.75-0.337-0.75-0.75s0.337-0.75 0.75-0.75 0.75 0.337 0.75 0.75-0.337 0.75-0.75 0.75zM11.25 12.5c-0.965 0-1.75 0.785-1.75 1.75s0.785 1.75 1.75 1.75 1.75-0.785 1.75-1.75-0.785-1.75-1.75-1.75zM11.25 15c-0.413 0-0.75-0.337-0.75-0.75s0.337-0.75 0.75-0.75 0.75 0.337 0.75 0.75-0.337 0.75-0.75 0.75zM13.37 2l-0.301 2h-13.143l1.117 8.036h11.914l1.043-7.5 0.231-1.536h2.769v-1h-3.63zM12.086 11.036h-10.172l-0.84-6.036h11.852l-0.84 6.036zM11 10h-8v-3.969h1v2.969h6v-2.97h1v3.97zM4 2.969h-1v-1.969h8v1.906h-1v-0.906h-6v0.969z"
                                                fill="currentColor"
                                            />
                                        </svg>

                                        <span
                                            class="user__item-text paragraph paragraph--secondary"
                                            title="My Purchase"
                                        >
                                            My Purchase
                                        </span>
                                    </li>
                                </ul>

                                <c:url var="logoutUrl" value="MainController">
                                    <c:param name="action" value="Logout" />
                                </c:url>
                                <a href="${logoutUrl}" class="user__logout">
                                    <svg
                                        version="1.1"
                                        xmlns="http://www.w3.org/2000/svg"
                                        xmlns:xlink="http://www.w3.org/1999/xlink"
                                        width="24"
                                        height="24"
                                        viewBox="0 0 17 17"
                                        class="user__item-icon"
                                    >
                                        <g></g>
                                        <path
                                            d="M16 9.5c0 4.136-3.364 7.5-7.5 7.5s-7.5-3.364-7.5-7.5c0-3.498 2.476-6.579 5.888-7.326l0.214 0.977c-2.956 0.647-5.102 3.317-5.102 6.349 0 3.584 2.916 6.5 6.5 6.5s6.5-2.916 6.5-6.5c0-3.028-2.143-5.698-5.096-6.348l0.215-0.977c3.408 0.751 5.881 3.831 5.881 7.325zM9 0h-1v10h1v-10z"
                                            fill="currentColor"
                                        />
                                    </svg>
                                    <span
                                        class="user__item-text paragraph paragraph--secondary"
                                        title="Logout"
                                    >
                                        Logout
                                    </span>
                                </a>
                            </navbar>
                        </div>

                        <div class="col l-9 m-9 c-9">
                            <section
                                class="user__content user__content--active"
                            >
                                <p
                                    class="user__heading heading heading--quaternary"
                                >
                                    My Profile
                                </p>
                                <p
                                    class="user__desc paragraph paragraph--secondary"
                                >
                                    Manage and protect your account
                                </p>

                                <form
                                    action="MainController"
                                    method="POST"
                                    id="user__form"
                                >
                                    <div class="form-group">
                                        <c:choose>
                                            <c:when
                                                test="${sessionScope.USER.googleId != null}"
                                            >
                                                <figure
                                                    class="user__image-wrapper"
                                                >
                                                    <figcaption
                                                        class="user__image-desc paragraph paragraph--secondary"
                                                    >
                                                        Your Profile Picture
                                                    </figcaption>
                                                    <img
                                                        src="${sessionScope.USER.avatar}"
                                                        alt=""
                                                        class="user__image"
                                                    />
                                                </figure>
                                            </c:when>

                                            <c:when
                                                test="${not empty sessionScope.USER.avatar && sessionScope.USER.googleId == null}"
                                            >
                                                <label
                                                    class="form-label user__form-desc paragraph paragraph--secondary"
                                                    for="avatar"
                                                >
                                                    Your Profile Picture
                                                </label>
                                                <input
                                                    type="file"
                                                    id="avatar"
                                                    name="avatar"
                                                    hidden
                                                />
                                                <label
                                                    for="avatar"
                                                    class="user__form-label--avatar"
                                                >
                                                    <figure
                                                        class="user__image-wrapper"
                                                    >
                                                        <img
                                                            src="${sessionScope.USER.avatar}"
                                                            alt=""
                                                            class="user__image"
                                                        />
                                                    </figure>
                                                </label>
                                            </c:when>

                                            <c:otherwise>
                                                <label
                                                    class="form-label user__form-desc paragraph paragraph--secondary"
                                                    for="avatar"
                                                >
                                                    Your Profile Picture
                                                </label>
                                                <input
                                                    type="file"
                                                    id="avatar"
                                                    name="avatar"
                                                    hidden
                                                />
                                                <label
                                                    for="avatar"
                                                    class="user__form-label--avatar"
                                                >
                                                    <img
                                                        src=""
                                                        alt=""
                                                        class="user__image user__image--hidden"
                                                    />
                                                    <div
                                                        class="user__image-none-wrapper"
                                                    >
                                                        <svg
                                                            xmlns="http://www.w3.org/2000/svg"
                                                            width="26"
                                                            height="26"
                                                            viewBox="0 0 36 36"
                                                            fill="none"
                                                            class="user__image-icon"
                                                        >
                                                            <g id="gallery-add">
                                                                <path
                                                                    id="Vector (Stroke)"
                                                                    fill-rule="evenodd"
                                                                    clip-rule="evenodd"
                                                                    d="M9.99994 7.75839C10.74 7.26392 11.61 7 12.5 7C13.0714 7 13.5346 7.46322 13.5346 8.03464C13.5346 8.60606 13.0714 9.06928 12.5 9.06928C12.0193 9.06928 11.5493 9.21184 11.1496 9.47893C10.7498 9.74602 10.4383 10.1256 10.2543 10.5698C10.0703 11.014 10.0222 11.5027 10.116 11.9742C10.2098 12.4457 10.4413 12.8788 10.7812 13.2188C11.1212 13.5587 11.5543 13.7902 12.0258 13.884C12.4973 13.9778 12.986 13.9297 13.4302 13.7457C13.8744 13.5617 14.254 13.2502 14.5211 12.8504C14.7882 12.4507 14.9307 11.9807 14.9307 11.5C14.9307 10.9286 15.3939 10.4654 15.9654 10.4654C16.5368 10.4654 17 10.9286 17 11.5C17 12.39 16.7361 13.26 16.2416 14.0001C15.7471 14.7401 15.0443 15.3169 14.2221 15.6575C13.3998 15.998 12.495 16.0872 11.6221 15.9135C10.7492 15.7399 9.94736 15.3113 9.31802 14.682C8.68868 14.0526 8.2601 13.2508 8.08647 12.3779C7.91283 11.505 8.00195 10.6002 8.34254 9.77792C8.68314 8.95566 9.25991 8.25285 9.99994 7.75839Z"
                                                                    fill="currentColor"
                                                                />
                                                                <path
                                                                    id="Vector (Stroke)_2"
                                                                    fill-rule="evenodd"
                                                                    clip-rule="evenodd"
                                                                    d="M34.9802 13C35.5434 13 36 13.4661 36 14.041V22.7574C36 27.2164 35.1375 30.6085 32.9439 32.8604C30.7489 35.1136 27.4407 36 23.094 36H12.906C8.56063 36 5.25258 35.114 3.05723 32.861C0.863226 30.6094 0 27.2173 0 22.7574V19.2528C0 18.6779 0.456559 18.2118 1.01975 18.2118C1.58295 18.2118 2.03951 18.6779 2.03951 19.2528V22.7574C2.03951 27.014 2.87587 29.7227 4.50321 31.3928C6.12922 33.0615 8.76429 33.9181 12.906 33.9181H23.094C27.2371 33.9181 29.8721 33.0611 31.4977 31.3923C33.1248 29.7221 33.9605 27.0134 33.9605 22.7574V14.041C33.9605 13.4661 34.4171 13 34.9802 13Z"
                                                                    fill="currentColor"
                                                                />
                                                                <path
                                                                    id="Vector (Stroke)_3"
                                                                    fill-rule="evenodd"
                                                                    clip-rule="evenodd"
                                                                    d="M3.09967 3.07527C5.32422 0.868234 8.6763 0 13.0827 0H19.9716C20.5396 0 21 0.456808 21 1.02031C21 1.58381 20.5396 2.04062 19.9716 2.04062H13.0827C8.87924 2.04062 6.20419 2.88106 4.55405 4.51821C2.90392 6.15535 2.05681 8.80935 2.05681 12.9797C2.05681 13.5432 1.59638 14 1.0284 14C0.460432 14 0 13.5432 0 12.9797C0 8.60801 0.875122 5.28231 3.09967 3.07527Z"
                                                                    fill="currentColor"
                                                                />
                                                                <path
                                                                    id="Vector (Stroke)_4"
                                                                    fill-rule="evenodd"
                                                                    clip-rule="evenodd"
                                                                    d="M23 6C23 5.44772 23.4792 5 24.0704 5H33.9296C34.5208 5 35 5.44772 35 6C35 6.55228 34.5208 7 33.9296 7H24.0704C23.4792 7 23 6.55228 23 6Z"
                                                                    fill="currentColor"
                                                                />
                                                                <path
                                                                    id="Vector (Stroke)_5"
                                                                    fill-rule="evenodd"
                                                                    clip-rule="evenodd"
                                                                    d="M29 0C29.5523 0 30 0.479239 30 1.07041V10.9296C30 11.5208 29.5523 12 29 12C28.4477 12 28 11.5208 28 10.9296V1.07041C28 0.479239 28.4477 0 29 0Z"
                                                                    fill="currentColor"
                                                                />
                                                                <path
                                                                    id="Vector (Stroke)_6"
                                                                    fill-rule="evenodd"
                                                                    clip-rule="evenodd"
                                                                    d="M28.0496 19.675L20.9723 25.8014L20.9535 25.8173C20.0931 26.5267 19.0135 26.9145 17.8993 26.9145C16.7851 26.9145 15.7055 26.5267 14.8451 25.8173C14.8358 25.8096 14.8267 25.8018 14.8177 25.7939L14.2713 25.3101C13.8139 24.941 13.2519 24.7253 12.6651 24.694C12.0746 24.6624 11.4894 24.8191 10.9934 25.1414L2.59721 30.8241C2.12855 31.1413 1.49204 31.0177 1.17551 30.5481C0.858988 30.0784 0.982315 29.4405 1.45097 29.1233L9.86814 23.4264C10.7295 22.8634 11.7473 22.5897 12.7741 22.6445C13.801 22.6994 14.7839 23.0802 15.5806 23.7318C15.5909 23.7402 15.6011 23.7489 15.6111 23.7578L16.1591 24.2429C16.6508 24.6434 17.2653 24.8622 17.8993 24.8622C18.5351 24.8622 19.1512 24.6422 19.6436 24.2396L26.7209 18.1131L26.7397 18.0972C27.6002 17.3878 28.6797 17 29.7939 17C30.9081 17 31.9877 17.3878 32.8481 18.0972L32.867 18.1132L35.6454 20.5185C36.0734 20.889 36.1206 21.537 35.7509 21.9659C35.3812 22.3947 34.7345 22.4421 34.3066 22.0716L31.5382 19.6749C31.0458 19.2723 30.4297 19.0523 29.7939 19.0523C29.1582 19.0523 28.5421 19.2723 28.0496 19.675Z"
                                                                    fill="currentColor"
                                                                />
                                                            </g>
                                                        </svg>
                                                        <p
                                                            class="user__image-none-text paragraph paragraph--secondary"
                                                        >
                                                            Upload your photo
                                                        </p>
                                                    </div>
                                                </label>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <div
                                        class="form-group form__form-group user__form-group"
                                    >
                                        <label
                                            for="fullName"
                                            class="form-label user__form-label paragraph paragraph--primary"
                                        >
                                            Full name
                                        </label>

                                        <c:if
                                            test="${sessionScope.USER.googleId != null}"
                                        >
                                            <input
                                                readonly
                                                placeholder="${sessionScope.USER.customer.lastName} ${sessionScope.USER.customer.firstName}"
                                                class="form-control user__form-input form__form-input paragraph paragraph--secondary"
                                            />
                                        </c:if>

                                        <c:if
                                            test="${sessionScope.USER.googleId == null}"
                                        >
                                            <c:choose>
                                                <c:when
                                                    test="${sessionScope.USER.customer.lastName != null || sessionScope.USER.customer.firstName != null}"
                                                >
                                                    <input
                                                        id="fullName"
                                                        name="fullName"
                                                        type="text"
                                                        placeholder="Please enter your full name"
                                                        maxlength="100"
                                                        value="${sessionScope.USER.customer.lastName} ${sessionScope.USER.customer.firstName}"
                                                        class="form-control user__form-input form__form-input paragraph paragraph--secondary"
                                                    />
                                                </c:when>

                                                <c:otherwise>
                                                    <input
                                                        id="fullName"
                                                        name="fullName"
                                                        type="text"
                                                        placeholder="Please enter your full name"
                                                        class="form-control user__form-input form__form-input paragraph paragraph--secondary"
                                                    />
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>

                                        <span class="form-message"></span>
                                    </div>

                                    <div
                                        class="form-group form__form-group user__form-group"
                                    >
                                        <label
                                            for="email"
                                            class="form-label user__form-label paragraph paragraph--primary"
                                        >
                                            Email
                                        </label>

                                        <c:if
                                            test="${sessionScope.USER.googleId != null}"
                                        >
                                            <input
                                                readonly
                                                placeholder="${sessionScope.USER.email}"
                                                class="form-control user__form-input form__form-input paragraph paragraph--secondary"
                                            />
                                        </c:if>

                                        <c:if
                                            test="${sessionScope.USER.googleId == null}"
                                        >
                                            <input
                                                id="email"
                                                name="email"
                                                rules="email"
                                                type="email"
                                                value="${sessionScope.USER.email}"
                                                pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
                                                placeholder="Please enter your email"
                                                class="form-control user__form-input form__form-input paragraph paragraph--secondary"
                                            />
                                        </c:if>

                                        <span class="form-message"></span>
                                    </div>

                                    <c:if
                                        test="${sessionScope.USER.username != null}"
                                    >
                                        <div
                                            class="form-group form__form-group user__form-group"
                                        >
                                            <label
                                                for="username"
                                                class="form-label user__form-label paragraph paragraph--primary"
                                            >
                                                Username
                                            </label>
                                            <input
                                                readonly
                                                id="username"
                                                type="text"
                                                placeholder="${sessionScope.USER.username}"
                                                class="form-control user__form-input form__form-input paragraph paragraph--secondary"
                                            />
                                            <span class="form-message"></span>
                                        </div>
                                    </c:if>

                                    <div
                                        class="form-group form__form-group user__form-group"
                                    >
                                        <label
                                            for="phone"
                                            class="form-label user__form-label paragraph paragraph--primary"
                                        >
                                            Phone number
                                        </label>
                                        <c:if
                                            test="${sessionScope.USER.customer.phone != null}"
                                        >
                                            <input
                                                id="phone"
                                                name="phone"
                                                rules="tel"
                                                type="tel"
                                                placeholder="Please enter your phone number"
                                                value="${sessionScope.USER.customer.phone}"
                                                pattern="^(0|\+?84)(3|5|7|8|9)[0-9]{8}$"
                                                class="form-control user__form-input form__form-input paragraph paragraph--secondary"
                                            />
                                        </c:if>

                                        <c:if
                                            test="${sessionScope.USER.customer.phone == null}"
                                        >
                                            <input
                                                id="phone"
                                                name="phone"
                                                rules="tel"
                                                type="tel"
                                                placeholder="Please enter your phone number"
                                                class="form-control user__form-input form__form-input paragraph paragraph--secondary"
                                            />
                                        </c:if>
                                        <span class="form-message"></span>
                                    </div>

                                    <div class="form-group form__form-group">
                                        <button
                                            type="submit"
                                            name="action"
                                            value="UpdateUser"
                                            class="user__form-submit button-text btn btn--primary btn-effect"
                                        >
                                            Update Profile
                                        </button>
                                    </div>
                                </form>
                            </section>

                            <section class="user__content">
                                <div class="user__content-row">
                                    <p
                                        class="user__heading heading heading--quaternary"
                                    >
                                        My Addresses
                                    </p>

                                    <button
                                        class="user__content-addresses paragraph paragraph--secondary btn btn--primary btn-effect"
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
                                            />
                                        </svg>
                                        <span
                                            class="user__content-addresses-text"
                                        >
                                            Add New Address
                                        </span>
                                    </button>
                                </div>

                                <div
                                    class="user__addresses-content ${sessionScope.USER.username == null ? 'user__addresses-content--password' : ''}"
                                >
                                    <c:choose>
                                        <c:when
                                            test="${not empty sessionScope.ADDRESSES}"
                                        >
                                            <ul class="user__addresses-list">
                                                <c:forEach
                                                    var="o"
                                                    items="${sessionScope.ADDRESSES}"
                                                >
                                                    <li
                                                        class="user__address-item"
                                                    >
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

                                                            <div
                                                                class="user__address-actions"
                                                            >
                                                                <c:if
                                                                    test="${!o.isDefault}"
                                                                >
                                                                    <c:url
                                                                        var="updateDefaultAddressUrl"
                                                                        value="MainController"
                                                                    >
                                                                        <c:param
                                                                            name="action"
                                                                            value="UpdateDefaultAddress"
                                                                        />
                                                                        <c:param
                                                                            name="addressId"
                                                                            value="${o.addressId}"
                                                                        />
                                                                    </c:url>
                                                                    <a
                                                                        href="${updateDefaultAddressUrl}"
                                                                        class="user__address-set-default btn btn--primary paragraph paragraph--tertiary btn-effect"
                                                                    >
                                                                        Set as
                                                                        default
                                                                    </a>

                                                                    <c:url
                                                                        var="deleteAddressUrl"
                                                                        value="MainController"
                                                                    >
                                                                        <c:param
                                                                            name="action"
                                                                            value="DeleteAddress"
                                                                        />
                                                                        <c:param
                                                                            name="addressId"
                                                                            value="${o.addressId}"
                                                                        />
                                                                    </c:url>
                                                                    <a
                                                                        href="${deleteAddressUrl}"
                                                                        class="user__address-delete btn btn--primary paragraph paragraph--tertiary"
                                                                    >
                                                                        Delete
                                                                    </a>
                                                                </c:if>
                                                            </div>
                                                        </div>

                                                        <p
                                                            class="user__address-specific paragraph paragraph--secondary"
                                                        >
                                                            ${o.specificAddress}
                                                        </p>

                                                        <c:if
                                                            test="${o.isDefault}"
                                                        >
                                                            <button
                                                                class="user__address-flag-default paragraph paragraph--secondary"
                                                            >
                                                                Default
                                                            </button>
                                                        </c:if>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </c:when>
                                        <c:otherwise>
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
                                        </c:otherwise>
                                    </c:choose>
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
                                                    required
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
                                                    required
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
                                                    required
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
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </section>

                            <c:if test="${sessionScope.USER.username != null}">
                                <section class="user__content">
                                    <div class="user__content-row">
                                        <p
                                            class="user__heading heading heading--quaternary"
                                        >
                                            Change Password
                                        </p>
                                    </div>

                                    <div class="user__change-password-content">
                                        <form
                                            action=""
                                            class="user__form-password"
                                        >
                                            <div
                                                class="form-group form__form-group"
                                            >
                                                <input
                                                    id="oldPassword"
                                                    name="oldPassword"
                                                    rules="required|blank"
                                                    type="password"
                                                    placeholder="Password"
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
                                                    id="password"
                                                    name="password"
                                                    rules="required|blank|min:8|max:16"
                                                    type="password"
                                                    placeholder="New Password"
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
                                                    id="confirm"
                                                    name="confirm"
                                                    rules="confirm"
                                                    placeholder="Confirm Password"
                                                    type="password"
                                                    class="form-control form__form-input paragraph paragraph--secondary"
                                                />
                                                <span
                                                    class="form-message"
                                                ></span>
                                            </div>

                                            <div
                                                class="form-group form__form-group"
                                            >
                                                <button
                                                    type="submit"
                                                    class="user__form-password-submit button-text btn btn--secondary btn-effect"
                                                >
                                                    Change Password
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </section>
                            </c:if>

                            <section class="user__content">
                                <div class="user__content-row">
                                    <p
                                        class="user__heading heading heading--quaternary"
                                    >
                                        All
                                    </p>
                                </div>

                                <div class="user__change-password-content">
                                    <table class="content-table">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Address ID</th>
                                                <th>Order Date</th>
                                                <th>Amount</th>
                                                <th>Payment</th>
                                                <th>Total</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach
                                                var="o"
                                                items="${sessionScope.ORDER.keySet()}"
                                            >
                                                <c:set
                                                    var="total"
                                                    value="0"
                                                    scope="page"
                                                />
                                                <tr>
                                                    <td>${o}</td>
                                                    <c:forEach
                                                        var="item"
                                                        items="${sessionScope.ORDER.get(o)}"
                                                        varStatus="loop"
                                                    >
                                                        <c:set
                                                            var="addressId"
                                                            value="${item.order.address.addressId}"
                                                            scope="page"
                                                        />
                                                        <c:set
                                                            var="orderDate"
                                                            value="${item.order.orderDate}"
                                                            scope="page"
                                                        />
                                                        <c:set
                                                            var="amount"
                                                            value="${loop.count}"
                                                            scope="page"
                                                        />
                                                        <c:set
                                                            var="paymentMethod"
                                                            value="${item.order.paymentMethod}"
                                                            scope="page"
                                                        />
                                                        <c:set
                                                            var="total"
                                                            value="${total + (item.quantity * item.price)}"
                                                            scope="page"
                                                        />
                                                        <c:set
                                                            var="status"
                                                            value="${item.order.status}"
                                                            scope="page"
                                                        />
                                                    </c:forEach>
                                                    <td>${addressId}</td>
                                                    <td>${orderDate}</td>
                                                    <td>${amount}</td>
                                                    <td>${paymentMethod}</td>
                                                    <fmt:formatNumber
                                                        value="${total}"
                                                        pattern="#0.00"
                                                        var="formattedTotal"
                                                    />
                                                    <td>${formattedTotal}</td>
                                                    <td>${status}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <script type="module" src="./assets/js/main.js"></script>
        <script type="module">
            import toast from "./assets/js/toast.js";
            let showErrorToast = false;
            <c:if test="${requestScope.DUPLICATE_EMAIL != null}">
                showErrorToast = true;
            </c:if>;

            if (showErrorToast) {
                toast({
                    title: "Error!",
                    message: "${requestScope.DUPLICATE_EMAIL}",
                    type: "error",
                    duration: 3000,
                });
                showErrorToast = false;
            }

            <c:if test="${requestScope.DUPLICATE_PHONE != null}">
                showErrorToast = true;
            </c:if>;

            if (showErrorToast) {
                toast({
                    title: "Error!",
                    message: "${requestScope.DUPLICATE_PHONE}",
                    type: "error",
                    duration: 3000,
                });
                showErrorToast = false;
            }
        </script>
    </body>
</html>
