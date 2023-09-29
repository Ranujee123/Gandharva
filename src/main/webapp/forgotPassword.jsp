<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-09-29
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <style>
        /* Add your CSS styles for responsiveness and design here */
        body {
            background-image: url('images/background.jpg'); /* Replace with your image path */
            background-size: cover;
            background-repeat: no-repeat;
            color: #000; /* Change text color to black */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .forgot-password-card {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            text-align: center;
        }

        .key-icon {
            font-size: 48px;
            color: black;
        }

        .forgot-password-text {
            font-size: 24px;
            margin-top: 10px;
        }

        .email-input {
            width: 100%;
            margin-top: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box; /* Include padding and border in element's total width */
        }


        .reset-button {
            width: 100%;
            margin-top: 20px;
            padding: 10px;
            background-color: #F5F5F5;
            color: #000;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .back-to-signup {
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>

<body>
<!-- Forgot Password Card -->
<div class="forgot-password-card">
    <div class="key-icon">&#128273;</div>
    <div class="forgot-password-text">Forgot Password?</div>
    <input type="email" id="email" name="email" placeholder="Email" class="email-input" required><br><br>
    <button class="reset-button">Reset Password</button><br>
    <p class="back-to-signup">Back to <a href="signup.jsp">Sign In</a></p>
</div>
<!-- Add more HTML and CSS as needed for styling and responsiveness -->
</body>

</html>
