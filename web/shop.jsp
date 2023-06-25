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
            <section class="product">
                <div class="grid wide">
                    <div class="row">
                        <div class="col l-12 m-12 c-12">
                            <h1
                                class="product__heading heading heading--secondary"
                            >
                                Find something you love
                            </h1>
                        </div>

                        <div class="col l-12 m-12 c-12">
                            <div class="product__filter">
                                <div class="product__buttons">
                                    <button
                                        class="product__filter-btn product__filter-btn--active product__filter-btn--latest btn button-text btn-effect"
                                    >
                                        Latest
                                    </button>

                                    <button
                                        class="product__filter-btn product__filter-btn--featured btn button-text btn-effect"
                                    >
                                        Featured
                                    </button>

                                    <button
                                        class="product__filter-btn product__filter-btn--top-selling btn button-text btn-effect"
                                    >
                                        Top Selling
                                    </button>
                                </div>

                                <div class="product__filter-sort">
                                    <button
                                        class="product__filter-btn product__filter-btn--sort btn button-text btn-effect"
                                    >
                                        <svg
                                            width="18"
                                            height="11"
                                            viewBox="0 0 18 11"
                                            fill="currentColor"
                                            xmlns="http://www.w3.org/2000/svg"
                                            class="product__filter-sort-icon"
                                        >
                                            <path
                                                id="Vector"
                                                d="M0 10.2143C0 10.0059 0.0790178 9.80605 0.21967 9.6587C0.360322 9.51135 0.551088 9.42857 0.75 9.42857H5.25C5.44891 9.42857 5.63968 9.51135 5.78033 9.6587C5.92098 9.80605 6 10.0059 6 10.2143C6 10.4227 5.92098 10.6225 5.78033 10.7699C5.63968 10.9172 5.44891 11 5.25 11H0.75C0.551088 11 0.360322 10.9172 0.21967 10.7699C0.0790178 10.6225 0 10.4227 0 10.2143ZM0 5.5C0 5.29162 0.0790178 5.09177 0.21967 4.94442C0.360322 4.79707 0.551088 4.71429 0.75 4.71429H11.25C11.4489 4.71429 11.6397 4.79707 11.7803 4.94442C11.921 5.09177 12 5.29162 12 5.5C12 5.70838 11.921 5.90823 11.7803 6.05558C11.6397 6.20293 11.4489 6.28571 11.25 6.28571H0.75C0.551088 6.28571 0.360322 6.20293 0.21967 6.05558C0.0790178 5.90823 0 5.70838 0 5.5ZM0 0.785714C0 0.57733 0.0790178 0.377481 0.21967 0.230131C0.360322 0.0827805 0.551088 0 0.75 0H17.25C17.4489 0 17.6397 0.0827805 17.7803 0.230131C17.921 0.377481 18 0.57733 18 0.785714C18 0.994099 17.921 1.19395 17.7803 1.3413C17.6397 1.48865 17.4489 1.57143 17.25 1.57143H0.75C0.551088 1.57143 0.360322 1.48865 0.21967 1.3413C0.0790178 1.19395 0 0.994099 0 0.785714Z"
                                                fill="currentColor"
                                            />
                                        </svg>

                                        <span
                                            class="product__filter-sort-value"
                                        >
                                            All Filters
                                        </span>
                                    </button>

                                    <ul class="product__filter-sort-list">
                                        <li
                                            class="product__filter-sort-item"
                                        ></li>
                                        <li
                                            class="product__filter-sort-item"
                                        ></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col l-12 m-12 c-12">
                            <div class="product__list">
                                <div class="row">
                                    <c:forEach
                                        var="o"
                                        items="${requestScope.PRODUCT_LIST}"
                                    >
                                        <div class="col l-4 m-4 c-4">
                                            <article class="product__item">
                                                <div
                                                    class="product__item-header"
                                                >
                                                    <a
                                                        href="#!"
                                                        class="product__item-link"
                                                    >
                                                        <img
                                                            src="${o.imageUrl}"
                                                            alt="${o.productName}"
                                                            class="product__item-img"
                                                            loading="lazy"
                                                        />
                                                    </a>
                                                    <button
                                                        class="product__item-action paragraph paragraph--tertiary btn btn--secondary btn-effect"
                                                    >
                                                        Add to cart
                                                    </button>
                                                </div>

                                                <section
                                                    class="product__item-body"
                                                >
                                                    <div
                                                        class="product__item-row"
                                                    >
                                                        <a
                                                            href="#!"
                                                            class="product__item-link"
                                                        >
                                                            <h2
                                                                class="product__item-title heading heading--quaternary"
                                                            >
                                                                ${o.productName}
                                                            </h2>
                                                        </a>

                                                        <svg
                                                            xmlns="http://www.w3.org/2000/svg"
                                                            width="20"
                                                            height="17"
                                                            viewBox="0 0 20 17"
                                                            fill="var(--heart-color)"
                                                            class="product__item-icon"
                                                        >
                                                            <path
                                                                id="Vector"
                                                                d="M9.28469 2.93289L9.99818 3.65946L10.7117 2.93289C11.5744 2.0544 12.9509 1 14.4264 1C15.8371 1 16.9711 1.47502 17.7472 2.22871C18.5211 2.98034 19 4.06744 19 5.41255C19 6.86866 18.4185 8.09645 17.4603 9.25823C16.4829 10.4434 15.1706 11.4943 13.7759 12.606C13.7759 12.606 13.7758 12.6061 13.7758 12.6061L13.7527 12.6245C12.4865 13.6334 11.0917 14.7447 9.99867 15.9918C8.91637 14.755 7.53442 13.6523 6.27906 12.6506L6.22374 12.6065L6.22334 12.6061C4.82824 11.494 3.51605 10.4428 2.53897 9.25769C1.58118 8.09595 1 6.86833 1 5.41255C1 4.06745 1.47886 2.98037 2.25289 2.22875C3.02906 1.47506 4.16325 1 5.57455 1C7.04848 1 8.42122 2.0536 9.28469 2.93289Z"
                                                                stroke="currentColor"
                                                                stroke-width="2"
                                                            />
                                                        </svg>
                                                    </div>

                                                    <div
                                                        class="product__item-row"
                                                    >
                                                        <div
                                                            class="product__item-rating"
                                                        >
                                                            <img
                                                                src="./assets/icons/star.svg"
                                                                alt=""
                                                                class="product__item-rating-icon"
                                                            />

                                                            <p
                                                                class="product__item-rating-value paragraph paragraph--primary"
                                                            >
                                                                5.0 (18)
                                                            </p>
                                                        </div>

                                                        <p
                                                            class="product__item-price button-text"
                                                        >
                                                            ${o.getProductVariant().price}
                                                        </p>
                                                    </div>
                                                </section>
                                            </article>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <c:if
                            test="${requestScope.PRODUCT_LIST.size() < requestScope.TOTAL_PRODUCTS}"
                        >
                            <div class="col l-12 m-12 c-12">
                                <button
                                    class="product__more-btn button-text btn btn--secondary btn-effect"
                                >
                                    Load More
                                </button>
                            </div>
                        </c:if>
                    </div>
                </div>
            </section>
        </main>

        <script type="module" src="./assets/js/main.js"></script>
    </body>
</html>
