<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Pursuit</title>
    </head>
    <body>
        <h1>Register</h1>
        <div id="toast"></div>
        <form action="" method="POST" id="register-form">
            <div class="form-group">
                <input
                    id="email"
                    name="email"
                    rules="required|email"
                    type="email"
                    placeholder="Email"
                    class="form-control"
                />
                <span class="form-message"></span>
            </div>

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
                <input
                    id="confirm"
                    name="confirm"
                    rules="confirm"
                    placeholder="Confirm Password"
                    type="password"
                    class="form-control"
                />
                <span class="form-message"></span>
            </div>
            <div class="form-group">
                <button type="submit" name="action" value="SignUp">
                    Sign Up
                </button>
            </div>
        </form>
        <script type="module" src="./assets/js/register.js"></script>
    </body>
</html>
