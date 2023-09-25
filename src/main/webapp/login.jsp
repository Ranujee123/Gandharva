<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-09-25
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <style>
    /* Add your CSS styles for responsiveness and design here */
    body {
      background-image: url('images/background.jpg'); /* Replace with your image path */
      background-size: cover;
      background-repeat: no-repeat;
      color: #FFF;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh; /* Text color for black and gold theme */
    }

    .login-card {
      width: 300px;
      padding: 20px;
      background-color: rgba(255, 255, 255, 0.7); /* Transparent white background */
      border-radius: 10px; /* Rounded corners for the card */
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5); /* Box shadow for the card */
    }

    /* Style the labels in black */
    .login-card label {
      color: #000;
    }

    /* Align contents inside the card to the left */
    .login-card form {
      text-align: left;
    }


    /* Add more CSS styles for your navbar, dropdown, etc. */
  </style>
</head>
<body>
<!-- Navbar -->
<!-- ... (Navbar code remains the same) ... -->

<!-- Login Card -->
<div class="login-card">
  <h2>Login</h2>
  <form action="loginServlet" method="post">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br><br>

    <label for="remember">Remember me</label>
    <input type="checkbox" id="remember" name="remember"><br><br>

    <a href="forgotPassword.jsp">Forgot Password?</a><br><br>

    <input type="submit" value="Login">
  </form>
  <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
</div>

<!-- Add more HTML and CSS as needed for styling and responsiveness -->
</body>
</html>

<!--<h1>Login Page</h1>
<form action="login" method="post">
  User Name <input type="text" name="username" placeholder="Enter your username"><br>
  Password <input type="password" name="password" placeholder="Enter your password"><br>
  <input type="submit" name="submit" value="Login">
</form>

</body>
</html>-->