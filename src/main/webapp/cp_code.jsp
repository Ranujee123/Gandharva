<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-09-29
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<!--change password code -->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Reset</title>
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

        .reset-card {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            text-align: center;
        }

        .email-icon {
            font-size: 48px;
            color: black;
        }

        .check-email-text {

            color: #888;
            cursor: pointer;
            font-size: 14px;
            text-align: left;
        }

        .code-input {
            width: 100%;
            margin-top: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box; /* Include padding*/
        }

        .resend-link{

            color: #888;
            cursor: pointer;
            font-size: 14px;
        }
        .check-your-email{
                font-size: 24px;
                margin-top: 10px;
            }


        .back-to-signup {
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>

<body>
<!-- Reset Code Card -->
<div class="reset-card">
    <div class="email-icon">&#128231;</div>
    <div class="check-your-email">Check your e-mail.</div><br>
    <div class="check-email-text">We sent a password reset link and a code to your E-mail.</div><br>
    <input type="text" id="code" name="code" placeholder="Enter code" class="code-input" required><br><br>
    <div class="resend-link" onclick="resendEmail()">Didn’t receive the e-mail? Click to resend</div>
    <p class="back-to-signup">Back to <a href="signup.jsp">Sign In</a></p>
</div>
<script>
    function resendEmail() {
        // Logic to resend email goes here
        alert("Email has been resent!");
    }
</script>
<!-- Add more HTML and CSS as needed for styling and responsiveness -->
</body>

</html>


