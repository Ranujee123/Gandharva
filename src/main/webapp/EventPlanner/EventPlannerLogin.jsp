<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Login</title>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-image: url('../images/background.jpg');
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
<body>
<%--<nav>--%>
<%--    <img src="../images/logo.png" alt="company-logo"/>--%>
<%--    <div class="buttons">--%>
<%--        <button><a href="EventPlannerLogin.jsp">Log in</a></button>--%>
<%--    </div>--%>
<%--</nav>--%>

<%--<div class="content">--%>
<%--    <h1>Event Planner</h1>--%>

<%--    <h2>Login</h2>--%>

<%--    <div class="login-form-wrapper">--%>
<%--        <form action="eventPlannerLog" method="post" class="login-form" id="addeventplannerform">--%>
<%--            <div class="form-item">--%>
<%--                <label for="email">Email</label>--%>
<%--                <input required type="email" name="email" id="email" placeholder="example@email.com"/>--%>
<%--            </div>--%>

<%--            <div class="form-item">--%>
<%--                <label for="password">Password</label>--%>
<%--                <input required type="password" name="password" id="password"/>--%>
<%--            </div>--%>
<%--            <div class="remember">--%>
<%--                <label for="remember">--%>
<%--                    <input type="checkbox" name="remember" id="remember">--%>
<%--                    Remember Me--%>
<%--                </label>--%>
<%--            </div>--%>
<%--            <button class="reg-btn" type="submit">Login</button>--%>
<%--            <p class="signup-text">Don't have an account? <a href="EventPlannerRegister.jsp">Sign Up</a></p>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</div>--%>
<div class="form-container">
    <h1>Login</h1>
    <form action="eventPlannerLog" method="POST" id="login-form">
        <input type="text" id="email" name="email" class="input-field" placeholder="Email" required><br>
        <input type="password" id="password" name="password" class="input-field" placeholder="Password" required><br>

        <div class="remember-me">
            <input type="checkbox" name="remember" id="remember">
            <label for="remember">Remember Me</label>
        </div>

        <input type="submit" class="btn" id="proceedBtn" name="proceed" value="Login">
    </form>
    <a href="EventPlannerRegister.jsp" class="sign-up-link">Don't have an account? Sign Up</a>
    <a href="/Astrologer/forgotPassword.jsp" class="forgot-password">Forgot Password?</a>
</div>

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
<script src="Astrologer/js/login.js" defer></script>
</html>
