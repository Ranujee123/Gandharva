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
    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        color: #fff;
        font-family: "Poppins", sans-serif;
    }

    body {
        background-image: url('../images/background.jpg');
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        min-height: 100vh;
    }

    a {
        text-decoration: none;
    }

    /* Navogation bar */

    nav {
        display: flex;
        justify-content: space-around;
        align-items: center;
        font-family: "Roboto", sans-serif;
        background-color: #000;
        height: 75px;
        margin-bottom: 25px;
    }

    nav img {
        border: none;
        height: 75px;
        width: auto;
    }

    nav ul {
        display: flex;
        gap: 100px;
    }

    nav ul li {
        font-size: 20px;
        list-style-type: none;
    }

    nav button {
        cursor: pointer;
        width: 90px;
        height: 30px;
        background-color: #000;
        font-size: 20px;
        border-radius: 20px;
        border: none;
    }

    nav .buttons {
        display: flex;
        gap: 5px;
    }

    nav .buttons #sign-up-button {
        color: #000;
        font-weight: bold;
        border-radius: 0;
    }

    /* Content */

    .content {
        background-color: rgba(0, 0, 0, 0.8);
        display: flex;
        flex-direction: column;
        padding: 50px;
        border: 2px solid #fff;
        border-radius: 10px;
        margin: 50px auto 60px;
        width: 600px;
        height: 500px;
    }

    .content h1 {
        margin-bottom: 5px;
    }

    .reg-btn {
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        width: 40%;
    }

    .login-form-wrapper {
        margin-top: 20px;
        width: 500px;
        align-self: center;;
    }

    .form-item {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        margin: 16px 0;
    }

    .form-item input {
        color: #000000;
        padding: 10px;
        width: 50%;
        margin-top: 4px;
    }
    .form-group {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }

    .form-group input[type="checkbox"] {
        margin-right: 5px;
    }

    .remember{
        margin-top: 10px;
        opacity: 0.75;
    }

    .signup-text {
        text-align: left;
        font-size: 14px;
        margin-top: 10px;
    }
</style>
<body>
<nav>
    <img src="../images/logo.png" alt="company-logo"/>
    <div class="buttons">
        <button><a href="EventPlannerLogin.jsp">Log in</a></button>
    </div>
</nav>

<div class="content">
    <h1>Event Planner</h1>

    <h2>Login</h2>

    <div class="login-form-wrapper">
        <form action="eventPlannerLog" method="post" class="login-form" id="addeventplannerform">
            <div class="form-item">
                <label for="email">Email</label>
                <input required type="email" name="email" id="email" placeholder="example@email.com"/>
            </div>

            <div class="form-item">
                <label for="password">Password</label>
                <input required type="password" name="password" id="password"/>
            </div>
            <div class="remember">
                <label for="remember">
                    <input type="checkbox" name="remember" id="remember">
                    Remember Me
                </label>
            </div>
            <button class="reg-btn" type="submit">Login</button>
            <p class="signup-text">Don't have an account? <a href="EventPlannerRegister.jsp">Sign Up</a></p>
        </form>
    </div>
</div>
</body>
</html>
