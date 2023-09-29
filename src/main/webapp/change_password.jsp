<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-09-29
  Time: 23:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Change Password</title>
  <style>
    /* Add your CSS styles for responsiveness and design here */
    body {
      background-color: #f5f5f5;
      color: #000;
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: space-between;
      height: 100vh;
    }

    .left-content {
      flex: 1;
      background-image: url('images/background.jpg');
      background-size: cover;
      background-repeat: no-repeat;
    }

    .right-content {
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 20px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    .key-icon {
      font-size: 48px;
      color: #333;
    }

    .change-password-text {
      font-size: 24px;
      color: #333;
      margin-top: 10px;
    }

    .password-requirements {
      font-size: 14px;
      color: #888;
      margin-top: 10px;
      text-align: left;
    }

    .password-input {
      width: 100%;
      margin-top: 10px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 16px;
      display: inline-block;
      box-sizing: border-box;
    }

    .eye-icon {
      font-size: 20px;
      cursor: pointer;
    }

    .change-password-button {
      width: 100%;
      margin-top: 20px;
      padding: 10px;
      background-color: #f5f5f5;
      color: #333;
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
<!-- Left Content (Image) -->
<div class="left-content"></div>

<!-- Right Content (Change Password Form) -->
<div class="right-content">
  <div class="key-icon">&#128273;</div>
  <div class="change-password-text">Change Password</div>
  <div class="password-requirements">
    <ul>
      <li>Is longer than 8 characters</li>
      <li>Inclusion of at least one special character, e.g., ! @ # ?</li>
      <li>Does not match or significantly contain your username, eg: Do not use ‘username123’</li>
    </ul>
  </div>

  <input type="password" id="password" placeholder="Enter new password" class="password-input">

  <input type="password" id="confirmPassword" placeholder="Confirm new password" class="password-input">
 

  <button class="change-password-button" onclick="changePassword()">Change Password</button>

  <div class="back-to-signup">
    <p class="back-to-signup">Back to <a href="signup.jsp">Sign In</a></p>
  </div>
</div>

<script>
  var passwordInput = document.getElementById("password");
  var confirmPasswordInput = document.getElementById("confirmPassword");
  var eyeIcon = document.getElementById("eye-icon");
  var confirmEyeIcon = document.getElementById("confirm-eye-icon");

  eyeIcon.addEventListener("click", function() {
    togglePasswordVisibility(passwordInput, eyeIcon);
  });

  confirmEyeIcon.addEventListener("click", function() {
    togglePasswordVisibility(confirmPasswordInput, confirmEyeIcon);
  });

  function togglePasswordVisibility(input, eyeIcon) {
    if (input.type === "password") {
      input.type = "text";
      eyeIcon.innerHTML = "&#x1F440;"; // Closed eye icon
    } else {
      input.type = "password";
      eyeIcon.innerHTML = "&#x1F441;"; // Open eye icon
    }
  }

  function changePassword() {
    var newPassword = passwordInput.value;
    var confirmPassword = confirmPasswordInput.value;

    // Validate the password and confirm password fields
    if (newPassword.length < 8) {
      alert("Password must be at least 8 characters long.");
      return;
    }

    if (newPassword !== confirmPassword) {
      alert("Passwords do not match.");
      return;
    }

    // AJAX request logic here
    alert("Password changed successfully!");
    // Redirect to the next page after password change
    window.location.href = "next_page.jsp";
  }
</script>
</body>

</html>
