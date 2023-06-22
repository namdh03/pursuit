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

                            <!-- <div class="header__icons">
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
                            </div> -->

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
                                    >
                                        Shop
                                    </a>
                                </li>

                                <li class="navbar__item">
                                    <a
                                        href="#!"
                                        class="navbar__link paragraph paragraph--secondary"
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
    </body>
</html>
