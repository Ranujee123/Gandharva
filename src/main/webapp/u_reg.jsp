<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-09-25
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Registration</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      background-image: url('images/background.jpg');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    nav {
      /* Your navigation bar styles here */
    }

    .background {
      background-color: rgba(255, 255, 255, 0.8); /* Transparent background color */
      padding: 20px;
      border-radius: 10px;
      width: 600px; /* Increase the width of the card */
      text-align: center;
    }

    .registration-card {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    form {
      width: 100%; /* Make the form width 100% of the card */
      text-align: left; /* Left-align the form fields */
    }

    label {
      margin-top: 10px;
      display: inline-block; /* Make labels display inline */
      width: 30%; /* Adjust label width as needed */
    }

    input,
    select {
      width: 40%; /* Adjust input/select width as needed */
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    button {
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      float: right; /* Move the proceed button to the right */
    }

    button:hover {
      background-color: #0056b3;
    }


    .center-elements {
      text-align: center;
    }

    .required-star {
      color: red;
    }

  </style>
</head>
<body>
<nav>
  <!-- Your navigation bar content here -->
</nav>
<div class="background">
  <div class="registration-card">
    <form id="registration-form" method="post" action="reg" >

      <label for="firstName">First Name<span class="required-star">*</span>:</label>
      <input type="text" id="firstName" name="firstName" required >

      <label for="lastName">Last Name<span class="required-star">*</span>:</label>
      <input type="text" id="lastName" name="lastName" required >

      <label for="birthday">Birthday <span class="required-star">*</span>:</label>
      <input type="date" id="birthday" name="birthday" required>

      <label for="country">Country of Residence <span class="required-star">*</span>:</label>
      <select id="country" name="country" >
        <option value="country1" >Country 1</option>
        <option value="country2">Country 2</option>
        <!-Add more countries here -->
      </select>

      <label for="email">Email<span class="required-star">*</span>:</label>
      <input type="email" id="email" name="email" required>

      <label for="password">Password<span class="required-star">*</span>:</label>
      <input type="password" id="password" name="password" required>

      <label for="confirmPassword">Confirm Password<span class="required-star">*</span>:</label>
      <input type="password" id="confirmPassword" name="confirmPassword" required>
      <h2 style="font-size: 14px" class="center-elements">Step 1 out of 2</h2><br><br> <!-- Moved the step text below the form -->
      <button type="submit" id="proceed-btn">Proceed</button>
    </form>
  </div>
</div>
</body>
</html>
