<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Import Header -->
<% response.sendRedirect("./");%>

<c:if test="${empty sessionScope.CATEGORY_LIST}">
    <c:url var="categoryUrl" value="MainController">
        <c:param name="action" value="Category" />
    </c:url>

    <script>
        window.location.href = "${categoryUrl}";
    </script>
</c:if>

<header class="header">
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
                <div class="header__body">
                    <div class="header__search">
                        <form action="MainController" method="GET">
                            <input
                                type="hidden"
                                name="action"
                                value="Product"
                            />

                            <c:if test="${requestScope.CATEGORY_ID != null}">
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

                    <c:if test="${sessionScope.USER != null}">
                        <div
                            class="header__icons"
                            data-customer-id="${sessionScope.USER.customer.customerId}"
                        >
                            <a href="./user.jsp" class="header__icon-wrapper">
                                <svg
                                    width="24"
                                    height="24"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    xmlns="http://www.w3.org/2000/svg"
                                    class="header__icon"
                                >
                                    <g id="Group">
                                        <path
                                            id="Vector"
                                            fill-rule="evenodd"
                                            clip-rule="evenodd"
                                            d="M16.364 8.72692C16.364 9.88423 15.9043 10.9941 15.0859 11.8125C14.2676 12.6308 13.1577 13.0906 12.0004 13.0906C10.843 13.0906 9.73314 12.6308 8.9148 11.8125C8.09646 10.9941 7.63672 9.88423 7.63672 8.72692C7.63672 7.56961 8.09646 6.4597 8.9148 5.64136C9.73314 4.82302 10.843 4.36328 12.0004 4.36328C13.1577 4.36328 14.2676 4.82302 15.0859 5.64136C15.9043 6.4597 16.364 7.56961 16.364 8.72692V8.72692ZM14.1822 8.72692C14.1822 9.30557 13.9523 9.86053 13.5431 10.2697C13.134 10.6789 12.579 10.9087 12.0004 10.9087C11.4217 10.9087 10.8667 10.6789 10.4576 10.2697C10.0484 9.86053 9.81854 9.30557 9.81854 8.72692C9.81854 8.14826 10.0484 7.59331 10.4576 7.18414C10.8667 6.77497 11.4217 6.5451 12.0004 6.5451C12.579 6.5451 13.134 6.77497 13.5431 7.18414C13.9523 7.59331 14.1822 8.14826 14.1822 8.72692V8.72692Z"
                                            fill="currentColor"
                                        />
                                        <path
                                            id="Vector_2"
                                            fill-rule="evenodd"
                                            clip-rule="evenodd"
                                            d="M12 0C5.37273 0 0 5.37273 0 12C0 18.6273 5.37273 24 12 24C18.6273 24 24 18.6273 24 12C24 5.37273 18.6273 0 12 0ZM2.18182 12C2.18182 14.28 2.95964 16.3789 4.26327 18.0458C5.1788 16.8435 6.35989 15.8692 7.71429 15.1989C9.06869 14.5286 10.5597 14.1805 12.0709 14.1818C13.5625 14.1804 15.0348 14.5195 16.3756 15.1732C17.7163 15.827 18.8901 16.7781 19.8076 17.9542C20.7529 16.7145 21.3893 15.2675 21.6642 13.733C21.9392 12.1985 21.8448 10.6206 21.3889 9.1298C20.933 7.63902 20.1286 6.27823 19.0423 5.16004C17.9561 4.04185 16.6192 3.19839 15.1422 2.69946C13.6653 2.20054 12.0908 2.06048 10.5489 2.29088C9.00711 2.52128 7.54232 3.11552 6.27575 4.02442C5.00918 4.93333 3.97725 6.13077 3.26534 7.51767C2.55343 8.90457 2.18202 10.4411 2.18182 12V12ZM12 21.8182C9.74613 21.8216 7.56029 21.0462 5.81236 19.6233C6.51592 18.6161 7.45237 17.7937 8.54203 17.2262C9.63169 16.6587 10.8423 16.3628 12.0709 16.3636C13.2842 16.3627 14.4802 16.6512 15.5596 17.2052C16.6389 17.7592 17.5706 18.5628 18.2771 19.5491C16.5156 21.0182 14.2937 21.8214 12 21.8182V21.8182Z"
                                            fill="currentColor"
                                        />
                                    </g>
                                </svg>
                            </a>

                            <div class="header__icon-wrapper">
                                <svg
                                    width="24"
                                    height="22"
                                    viewBox="0 0 24 22"
                                    fill="none"
                                    xmlns="http://www.w3.org/2000/svg"
                                    class="header__icon"
                                >
                                    <path
                                        id="Vector"
                                        d="M11.2742 3.94772L11.9978 4.70622L12.7214 3.94772C13.7672 2.85138 15.4666 1.5 17.3116 1.5C19.0418 1.5 20.4511 2.09993 21.4256 3.07415C22.4001 4.04835 23 5.45703 23 7.18609C23 9.06431 22.2687 10.6358 21.0978 12.0974C19.9077 13.5828 18.3141 14.8952 16.6447 16.265C16.6447 16.2651 16.6446 16.2651 16.6446 16.2652L16.6249 16.2813C15.0847 17.5446 13.405 18.9223 12.1005 20.4664C12.0808 20.4893 12.0544 20.5 12.0305 20.5H11.9673C11.9422 20.5 11.9151 20.4886 11.8955 20.4656L11.1327 21.1122L11.8972 20.4675C10.6056 18.9359 8.94115 17.5686 7.41369 16.3139L7.35476 16.2655L7.35436 16.2652C5.68446 14.8949 4.09108 13.5821 2.90139 12.0967C1.7309 10.6352 1 9.06388 1 7.18609C1 5.45703 1.59989 4.04838 2.57447 3.07419C3.54906 2.09998 4.95864 1.5 6.68945 1.5C8.53279 1.5 10.2276 2.85056 11.2742 3.94772Z"
                                        stroke="currentColor"
                                        stroke-width="2"
                                    />
                                </svg>

                                <span
                                    class="header__icon-value header__icon-value--heart paragraph paragraph--secondary"
                                >
                                    (0)
                                </span>
                            </div>

                            <a href="./cart.jsp" class="header__icon-wrapper">
                                <svg
                                    width="22"
                                    height="24"
                                    viewBox="0 0 22 24"
                                    fill="none"
                                    xmlns="http://www.w3.org/2000/svg"
                                    class="header__icon"
                                >
                                    <g id="Group">
                                        <path
                                            id="Vector"
                                            d="M1.91641 9.10286C1.96195 8.53006 2.21956 7.9956 2.63793 7.6059C3.0563 7.21621 3.60473 6.99988 4.174 7H17.826C18.3953 6.99988 18.9437 7.21621 19.3621 7.6059C19.7804 7.9956 20.038 8.53006 20.0836 9.10286L20.9927 20.5314C21.0177 20.8459 20.978 21.1623 20.8759 21.4605C20.7739 21.7587 20.6118 22.0324 20.3998 22.2643C20.1879 22.4962 19.9306 22.6813 19.6443 22.8079C19.358 22.9345 19.0489 22.9999 18.7363 23H3.26372C2.95115 22.9999 2.64198 22.9345 2.35568 22.8079C2.06938 22.6813 1.81215 22.4962 1.60018 22.2643C1.38822 22.0324 1.22611 21.7587 1.12407 21.4605C1.02202 21.1623 0.982252 20.8459 1.00726 20.5314L1.91641 9.10286V9.10286Z"
                                            stroke="currentColor"
                                            stroke-width="2"
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                        />
                                        <path
                                            id="Vector_2"
                                            d="M15 10V5C15 3.93913 14.5786 2.92172 13.8284 2.17157C13.0783 1.42143 12.0609 1 11 1C9.93913 1 8.92172 1.42143 8.17157 2.17157C7.42143 2.92172 7 3.93913 7 5V10"
                                            stroke="currentColor"
                                            stroke-width="2"
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                        />
                                    </g>
                                </svg>

                                <span
                                    class="header__icon-value header__icon-value--cart paragraph paragraph--secondary"
                                >
                                    (${sessionScope.CART.size()})
                                </span>
                            </a>
                        </div>
                    </c:if>

                    <c:if test="${sessionScope.USER == null}">
                        <div class="header__actions">
                            <a
                                href="login.jsp"
                                class="header__action-btn header__action-btn--login paragraph paragraph--secondary btn btn--tertiary"
                            >
                                Login
                            </a>
                            <a
                                href="register.jsp"
                                class="header__action-btn header__action-btn--register paragraph paragraph--secondary btn btn--tertiary btn-effect"
                            >
                                Register
                            </a>
                        </div>
                    </c:if>
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
                                title="Home"
                            >
                                Home
                            </a>
                        </li>

                        <li class="navbar__item navbar__item--drop-down">
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

                        <c:url var="shop" value="MainController">
                            <c:param name="action" value="Product" />
                        </c:url>
                        <li class="navbar__item">
                            <a
                                href="${shop}"
                                class="navbar__link paragraph paragraph--secondary"
                                title="Shop"
                            >
                                Shop
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>
