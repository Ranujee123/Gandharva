<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('images/background.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            width: 400px;
            text-align: center;
        }

        .form-container h1 {
            margin-bottom: 30px;
            color: #333;
        }

        .input-field {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
        }

        .input-field:focus {
            border-color: #007bff;
        }

        .remember-me {
            margin-top: 20px;
            text-align: left;
        }

        .remember-me input[type="checkbox"] {
            margin-right: 5px;
            vertical-align: middle;
        }

        .btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .forgot-password {
            margin-top: 20px;
            font-size: 14px;
            color: #333;
            text-decoration: none;
            transition: color 0.3s;
        }

        .forgot-password:hover {
            color: #007bff;
        }

        .sign-up-link {
            display: block;
            margin-top: 20px;
            color: #333;
            text-decoration: none;
            transition: color 0.3s;
        }

        .sign-up-link:hover {
            color: #007bff;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h1>Login</h1>
    <form action="astrologerLogin" method="POST" id="login-form">
        <input type="text" id="email" name="email" class="input-field" placeholder="Email" required><br>
        <input type="password" id="password" name="password" class="input-field" placeholder="Password" required><br>

        <div class="remember-me">
            <input type="checkbox" name="remember" id="remember">
            <label for="remember">Remember Me</label>
        </div>

        <input type="submit" class="btn" id="proceedBtn" name="proceed" value="Login">
    </form>
    <a href="home" class="sign-up-link">Don't have an account? Sign Up</a>
    <a href="Astrologer/forgotPassword.jsp" class="forgot-password">Forgot Password?</a>
</div>

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
<script src="Astrologer/js/login.js" defer></script>
</html>
