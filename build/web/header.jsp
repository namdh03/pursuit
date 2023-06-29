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
                        <div class="header__icons">
                            <div class="header__icon-wrapper">
                                <img
                                    src="./assets/icons/user.svg"
                                    alt=""
                                    class="header__icon"
                                />
                            </div>

                            <div class="header__icon-wrapper">
                                <img
                                    src="./assets/icons/heart.svg"
                                    alt=""
                                    class="header__icon"
                                />
                                <span
                                    class="header__icon-value header__icon-value--heart paragraph paragraph--secondary"
                                >
                                    (0)
                                </span>
                            </div>

                            <div class="header__icon-wrapper">
                                <img
                                    src="./assets/icons/cart.svg"
                                    alt=""
                                    class="header__icon"
                                />
                                <span
                                    class="header__icon-value header__icon-value--cart paragraph paragraph--secondary"
                                >
                                    (0)
                                </span>
                            </div>
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
