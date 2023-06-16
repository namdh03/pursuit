<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Pursuit</title>
    </head>
    <body>
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
        <script type="module" src="./assets/js/login.js"></script>
    </body>
</html>
