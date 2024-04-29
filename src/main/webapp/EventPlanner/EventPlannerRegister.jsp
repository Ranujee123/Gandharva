<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Registration</title>
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
        align-items: center;
        padding: 50px;
        border: 2px solid #fff;
        border-radius: 10px;
        margin: 50px auto 60px;
        width: 708px;
        height: 725px;
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
        float: right;
    }

    .registration-form-wrapper {
        margin-top: 20px;
        width: 600px;
    }

    .form-item {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        margin: 5px 0;
    }

    .form-item input {
        color: #000000;
        padding: 10px;
        width: 50%;
    }

    .form-item textarea {
        color: #000000;
        padding: 10px;
        width: 50%;
    }
</style>
<body>
<%--<nav>--%>
<%--    <img src="../images/logo.png" alt="company-logo"/>--%>
<%--    <div class="buttons">--%>
<%--        <button><a href="EventPlannerLogin.jsp">Log in</a></button>--%>
<%--    </div>--%>
<%--</nav>--%>

<div class="content">
    <h1>Event Planner</h1>

    <h2>Registration</h2>

    <div class="registration-form-wrapper">
        <form id="event-planner-registration-form"  action="eventPlannerReg" method="post" class="registration-form">
            <div class="form-item">
                <label for="firstname">First Name</label>
                <input required type="text" name="firstName" id="firstname"/>
            </div>

            <div class="form-item">
                <label for="lastname">Last Name</label>
                <input required type="text" name="lastName" id="lastname"/>
            </div>

            <div class="form-item">
                <label for="years">Years of Experience</label>
                <input required type="number" name="exp" id="years"/>
            </div>

            <div class="form-item">
                <label for="email">Email</label>
                <input required type="email" name="email" id="email"/>
            </div>

            <div class="form-item">
                <label for="phone">Phone Number</label>
                <input required type="text" name="phone" id="phone"/>
            </div>

            <div class="form-item">
                <label for="noofevents">Number of Events Handled</label>
                <input required type="number" name="events" id="noofevents"/>
            </div>

            <div class="form-item">
                <label for="aboutme">About Me</label>
                <textarea required  name="about" id="aboutme"></textarea>
            </div>

            <div class="form-item">
                <label for="password">Password</label>
                <input required type="password" name="password" id="password"/>
            </div>

            <button class="reg-btn" type="submit">Submit</button>
        </form>
    </div>
</div>
</body>
</html>
