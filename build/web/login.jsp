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
            href="/android-icon-192x192.png"
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
        <% String error = (String) session.getAttribute("ERROR"); if (error ==
        null) { error = ""; } String rootPath = request.getScheme() + "://" +
        request.getServerName() + ":" + request.getServerPort() +
        request.getContextPath(); %>
        <h1>Login</h1>
        <div id="toast"></div>
        <form action="" method="POST" id="login-form">
            <div class="form-group">
                <input
                    id="username"
                    name="username"
                    rules="required|blank"
                    type="text"
                    placeholder="Username"
                    class="form-control"
                />
                <span class="form-message"></span>
            </div>

            <div class="form-group">
                <input
                    id="password"
                    name="password"
                    rules="required|blank|min:6"
                    type="password"
                    placeholder="Password"
                    class="form-control"
                />
                <span class="form-message"></span>
            </div>

            <div class="form-group">
                <button type="submit" name="action" value="SignIn">
                    Sign In
                </button>
            </div>
        </form>
        <div class="google-sign-in">
            <button class="google-submit">Google</button>
            <input
                type="hidden"
                name="google-redirect-uri"
                value="<%= rootPath %>"
                class="google-redirect-uri"
            />
        </div>
        <script type="module" src="./assets/js/login.js"></script>
        <script type="module">
            import toast from "./assets/js/toast.js";

            if ("<%= error%>") {
                toast({
                    title: "Error!",
                    message: "<%= error%>",
                    type: "error",
                    duration: 3000,
                });
            }
        </script>
    </body>
</html>
