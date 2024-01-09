<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-09-30
  Time: 00:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Password Reset Successful</title>
  <style>
    /* Add your CSS styles for responsiveness and design here */
    body {
      background-image: url('../images/background.jpg'); /* Replace with your image path */
      background-size: cover;
      background-repeat: no-repeat;
      color: #000; /* Change text color to black */
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      padding: 0;
    }

    .reset-card {
      width: 300px;
      text-align: center;
      padding: 20px;
      background-color: rgba(255, 255, 255, 0.7); /* Semi-transparent card background */
      border-radius: 10px; /* Rounded corners for the card */
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5); /* Box shadow for the card */
    }

    .tick-icon {
      font-size: 48px;
      color: green;
    }

    .reset-message {
      font-size: 24px;
      margin-top: 10px;
    }

    .info-text {
      font-size: 14px;
      color: #888;
      margin-top: 10px;
    }

    .login-link {
      text-decoration: underline;
      cursor: pointer;
    }
  </style>
</head>

<body>
<!-- Reset Success Card -->
<div class="reset-card">
  <div class="tick-icon">&#10004;</div>
  <div class="reset-message">Password Reset</div>
  <div class="info-text">Your password has been successfully reset.</div>
  <div class="info-text">Click below to log in.</div>
  <div class="login-link" onclick="redirectToDashboard()">Log In</div>
</div>

<script>
  function redirectToDashboard() {
    // Redirect to the user's dashboard page
    window.location.href = "dashboard.jsp";
  }
</script>
</body>

</html>

