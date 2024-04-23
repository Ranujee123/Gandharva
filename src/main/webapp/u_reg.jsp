<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserDBUtil" %><%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-09-25
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

  List<String> province = UserDBUtil.getAllProvince();
%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Registration</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <style>
    *{
      font-family: "Poppins", sans-serif;
    }

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


  <script src="js/nic-utils.js"></script>
  <script src="js/validate.js"></script>

</head>
<body>
<nav>
  <!-- Your navigation bar content here -->
</nav>
<div class="background">
  <div class="registration-card">
    <% if (request.getAttribute("errorMessage") != null) { %>
    <div style="color: red;"><%= request.getAttribute("errorMessage").toString() %></div>
    <% } %>
    <form id="registration-form" method="post" action="reg" enctype="multipart/form-data" >

      <label for="firstName">First Name<span class="required-star">*</span>:</label>
      <input type="text" id="firstName" name="firstName" required onchange="validateFirstName()" />


      <label for="lastName">Last Name<span class="required-star">*</span>:</label>
      <input type="text" id="lastName" name="lastName" required onchange="validateLastName()" />

      <!-- Your existing form structure -->
      <label for="nic">Nation Identity Number<span class="required-star">*</span>:</label>
      <input type="text" id="nic" name="nic" onchange="updateGenderAndAgeFromNIC('nic', 'gender', 'dob', 'proceed-btn', 'nicError')" required />


      <div id="nicError" style="color: red; display: none;"></div>

      <input type="hidden" id="gender" name="gender" value="" />
      <input type="hidden" id="dob" name="dob" value="" />
      <input type="hidden" id="age" name="age" value="" />


      <label> District:</label>
      <select name="province">
        <option value=""></option>
        <option value="Ampara">Ampara</option>
        <option value="Anuradhapura">Anuradhapura</option>
        <option value="Badulla">Badulla</option>
        <option value="Batticaloa">Batticaloa</option>
        <option value="Colombo">Colombo</option>
        <option value="Galle">Galle</option>
        <option value="Gampaha">Gampaha</option>
        <option value="Hambantota">Hambantota</option>
        <option value="Jaffna">Jaffna</option>
        <option value="Kalutara"> Kalutara</option>
        <option value="Kandy">Kandy</option>
        <option value="Kegalle">Kegalle</option>
        <option value="Kilinochchi">Kilinochchi</option>
        <option value="Kurunegala"> Kurunegala</option>
        <option value="Mannar">Mannar</option>
        <option value="Matale">Matale</option>
        <option value="Matara">Matara</option>
        <option value="Monaragala">Monaragala</option>
        <option value="Mullaitivu">Mullaitivu</option>
        <option value="Nuwara Eliya"> Nuwara Eliya</option>
        <option value="Polonnaruwa">Polonnaruwa</option>
        <option value="Puttalam">Puttalam</option>
        <option value="Ratnapura"> Ratnapura</option>
        <option value="Trincomalee">Trincomalee</option>
        <option value="Vavuniya">Vavuniya</option>
      </select><br>



      <label for="frontphoto">ID photo (front)<span class="required-star">*</span>:</label>
        <input type="file" id="frontphoto" name="frontphoto" required>

      <label for="backphoto">ID photo (back)<span class="required-star">*</span>:</label>
      <input type="file" id="backphoto" name="backphoto" required>




      <label for="email">Email<span class="required-star">*</span>:</label>
      <input type="email" id="email" name="email" required onchange="validateEmail()" />


      <label for="password">Password<span class="required-star">*</span>:</label>
      <input type="password" id="password" name="password" required onchange="validatePassword()">


      <label for="confirmPassword">Confirm Password<span class="required-star">*</span>:</label>
      <input type="password" id="confirmPassword" name="confirmPassword" required onchange="validateConfirmPassword()">

      <h2 style="font-size: 14px" class="center-elements">Step 1 out of 2</h2><br><br> <!-- Moved the step text below the form -->
      <button type="submit" id="proceed-btn">Proceed</button>
    </form>
  </div>
</div>
</body>
</html>
