<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Import Header -->
<% response.sendRedirect("./"); %>

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
                        <input
                            id="search"
                            name="search"
                            type="text"
                            placeholder="Search for anything"
                            class="header__search-input paragraph paragraph--tertiary"
                        />
                        <div class="header__search-icon-wrapper">
                            <img
                                src="./assets/icons/search.svg"
                                alt=""
                                class="header__search-icon"
                            />
                        </div>
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
                                href="#!"
                                class="navbar__link paragraph paragraph--secondary"
                                title="Home"
                            >
                                Home
                            </a>
                            <img
                                src="./assets/icons/arrow-down.svg"
                                alt=""
                                class="navbar__icon"
                            />
                        </li>

                        <li class="navbar__item">
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
                        </li>

                        <li class="navbar__item">
                            <a
                                href="#!"
                                class="navbar__link paragraph paragraph--secondary"
                                title="Brand"
                            >
                                Brand
                            </a>
                            <img
                                src="./assets/icons/arrow-down.svg"
                                alt=""
                                class="navbar__icon"
                            />
                        </li>

                        <li class="navbar__item">
                            <a
                                href="#!"
                                class="navbar__link paragraph paragraph--secondary"
                                title="Products"
                            >
                                Products
                            </a>
                            <img
                                src="./assets/icons/arrow-down.svg"
                                alt=""
                                class="navbar__icon"
                            />
                        </li>

                        <li class="navbar__item">
                            <a
                                href="#!"
                                class="navbar__link paragraph paragraph--secondary"
                                title="About"
                            >
                                About
                            </a>
                            <img
                                src="./assets/icons/arrow-down.svg"
                                alt=""
                                class="navbar__icon"
                            />
                        </li>

                        <li class="navbar__item">
                            <a
                                href="./shop.jsp"
                                class="navbar__link paragraph paragraph--secondary"
                                title="Shop"
                            >
                                Shop
                            </a>
                        </li>

                        <li class="navbar__item">
                            <a
                                href="#!"
                                class="navbar__link paragraph paragraph--secondary"
                                title="Pages"
                            >
                                Pages
                            </a>
                            <img
                                src="./assets/icons/arrow-down.svg"
                                alt=""
                                class="navbar__icon"
                            />
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>
