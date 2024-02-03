<%--
  Created by IntelliJ IDEA.
  User: Binali Ukwatte
  Date: 26-09-2023
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <style>
        /* Reset some default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        //font-family: Roboto;
        }

        /* Set background image */
        body {
            background-image: url('images/background.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            font-family: Arial, sans-serif;
        }

        /* Header styling */
        header {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 20px 0;
        }

        nav {
            color: black;
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .logo img {
            height: 75px;
            margin-left: -120px;
        }

        .navbar {
            list-style-type: none;
            display: flex;
            gap: 10px;
        }

        .navbar li {
            margin-right: 10px;
        }

        .navbar a {
            text-decoration: none;
            color: white;
            font-size: 16px;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        .submenu {
            display: none;
            position: absolute;
            background-color: rgba(0, 0, 0, 0.8);
            padding: 10px;
        }

        .navbar li:hover .submenu {
            display: block;
        }

        .buttons button {
            color: gold;
            background: none;
            border: none;
            font-size: 16px;
            cursor: pointer;
            margin-left: 10px;
        }

        .signup-button {
            background-color: gold;
            color: black;
            padding: 10px 20px;
            border-radius: 50px;
            text-decoration: none;
        }

        .signin-button {
            background-color: gold;
            color: black;
            padding: 10px 20px;
            border-radius: 50px;
            text-decoration: none;
        }
        main {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 120px); /* Adjust the height as needed */
        }

        .find-match {
            font-size: large;
            background-color: rgba(255, 255, 255, 0.4);
            color: white;
            padding: 10px 20px;
            border-radius: 50px;
            border: none;
            cursor: pointer;
            margin-bottom: -400px;

        }

        .find-match:hover {
            background-color: rgba(255, 255, 255, 0.2); /* Lighten on hover */
        }

    </style>
</head>
<body>
<header>
    <nav>
        <div class="logo">
            <img src='images/logomain.png' alt="Logo">
        </div>
        <ul class="navbar">
            <li><a href="#">About Us</a></li>
            <li><a href="#">Our Services</a>
                <ul class="submenu">
                    <li><a href="Astrologer_Registration.jsp">Astrologer</a></li>
                    <li><a href="registration.jsp">Event Planner</a></li>
                </ul>
            </li>
            <li><a href="pricing.jsp">Pricing</a></li>
            <li><a href="#">Help</a></li>
        </ul>
        <div class="buttons">

            <div class="buttons">
                <a href="u_reg.jsp" class="signup-button">Sign Up</a>
                <a href="login.jsp" class="signin-button">Sign In</a>
            </div>


        </div>
    </nav>
</header>
<main>

    <a href="login.jsp" class="find-match">Find Your Match</a>
</main>
</body>
</html>

