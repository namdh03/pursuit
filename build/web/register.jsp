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
        <c:if test="${sessionScope.USER != null}">
            <c:redirect url="./" />
        </c:if>

        <c:set
            var="rootPath"
            value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"
        />

        <div id="toast"></div>
        <section class="register form__container">
            <div class="form__inner form__inner--register">
                <div class="grid">
                    <div class="row">
                        <div class="col l-12 m-12 c-12">
                            <div class="form__header">
                                <h1 class="button-text">Create your account</h1>
                                <!-- <a
                                    href="./register.jsp"
                                    class="form__btn button-text btn btn--primary btn-effect"
                                >
                                    Sign In
                                </a> -->
                            </div>
                        </div>

                        <div class="col l-12 m-12 c-12">
                            <form action="" class="register__form">
                                <div class="form-group form__form-group">
                                    <input
                                        id="email"
                                        name="email"
                                        rules="required|email"
                                        type="email"
                                        placeholder="Email"
                                        class="form-control form__form-input paragraph paragraph--secondary"
                                    />
                                    <span class="form-message"></span>
                                </div>

                                <div class="form-group form__form-group">
                                    <input
                                        id="username"
                                        name="username"
                                        rules="required|blank"
                                        type="text"
                                        placeholder="Username"
                                        class="form-control form__form-input paragraph paragraph--secondary"
                                    />
                                    <span class="form-message"></span>
                                </div>

                                <div class="form-group form__form-group">
                                    <input
                                        id="password"
                                        name="password"
                                        rules="required|blank|min:6"
                                        type="password"
                                        placeholder="Password"
                                        class="form-control form__form-input paragraph paragraph--secondary"
                                    />
                                    <span class="form-message"></span>
                                </div>

                                <div class="form-group form__form-group">
                                    <input
                                        id="confirm"
                                        name="confirm"
                                        rules="confirm"
                                        placeholder="Confirm Password"
                                        type="password"
                                        class="form-control form__form-input paragraph paragraph--secondary"
                                    />
                                    <span class="form-message"></span>
                                </div>

                                <div class="form-group form__form-group">
                                    <button
                                        type="submit"
                                        class="register__form-submit form__form-submit button-text btn btn--secondary"
                                    >
                                        Sign Up
                                    </button>
                                </div>
                            </form>
                        </div>

                        <div class="col l-12 m-12 c-12">
                            <p
                                class="form__separate paragraph paragraph--primary"
                            >
                                OR
                            </p>
                        </div>

                        <div class="col l-12 m-12 c-12">
                            <div class="form__socials">
                                <!-- <div class="form__social form__facebook">
                                    <button
                                        class="form__social-btn form__facebook-submit btn btn--primary"
                                    >
                                        <img
                                            src="./assets/icons/facebook.svg"
                                            alt=""
                                            class="form__facebook-icon"
                                        />
                                        <span class="form__social-text form__facebook-text">
                                            Continue with Facebook
                                        </span>
                                    </button>
                                    <input
                                        type="hidden"
                                        name="facebook-redirect-uri"
                                        value="${rootPath}"
                                        class="form__facebook-redirect-uri"
                                    />
                                </div> -->

                                <div class="form__social form__google">
                                    <button
                                        class="form__social-btn form__google-submit btn btn--primary"
                                    >
                                        <img
                                            src="./assets/icons/google.svg"
                                            alt=""
                                            class="form__google-icon"
                                        />
                                        <span
                                            class="form__social-text form__google-text"
                                        >
                                            Continue with Google
                                        </span>
                                    </button>
                                    <input
                                        type="hidden"
                                        name="google-redirect-uri"
                                        value="${rootPath}"
                                        class="form__google-redirect-uri"
                                    />
                                </div>

                                <!-- <div class="form__social form__apple">
                                    <button
                                        class="form__social-btn form__apple-submit btn btn--primary"
                                    >
                                        <img
                                            src="./assets/icons/apple.svg"
                                            alt=""
                                            class="form__apple-icon"
                                        />
                                        <span class="form__social-text form__apple-text">
                                            Continue with Apple
                                        </span>
                                    </button>
                                    <input
                                        type="hidden"
                                        name="apple-redirect-uri"
                                        value="${rootPath}"
                                        class="form__apple-redirect-uri"
                                    />
                                </div> -->
                            </div>
                        </div>

                        <div class="col l-12 m-12 c-12">
                            <a href="./" class="form__remove-form">
                                <img
                                    src="./assets/icons/times.svg"
                                    alt=""
                                    class="form__remove-form-icon"
                                />
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script type="module" src="./assets/js/register.js"></script>
        <script type="module">
            import toast from "./assets/js/toast.js";
            let showErrorToast = false;
            <c:if test="${sessionScope.ERROR != null}">
                showErrorToast = true;
            </c:if>;

            if (showErrorToast) {
                toast({
                    title: "Error!",
                    message: "${sessionScope.ERROR}",
                    type: "error",
                    duration: 3000,
                });
            }
        </script>
    </body>
</html>
