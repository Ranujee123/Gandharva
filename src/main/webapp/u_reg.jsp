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
  List<String> gender = UserDBUtil.getAllGender();
  List<String> country = UserDBUtil.getAllCountry();
%>


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
    <% if (request.getAttribute("errorMessage") != null) { %>
    <div style="color: red;"><%= request.getAttribute("errorMessage").toString() %></div>
    <% } %>
    <form id="registration-form" method="post" action="reg" enctype="multipart/form-data">

      <label for="firstName">First Name<span class="required-star">*</span>:</label>
      <input type="text" id="firstName" name="firstName" required value="<%= request.getParameter("firstName") != null ? request.getParameter("firstName") : "" %>" />

      <label for="lastName">Last Name<span class="required-star">*</span>:</label>
      <input type="text" id="lastName" name="lastName" required value="<%= request.getParameter("lastName") != null ? request.getParameter("lastName") : "" %>" />

      <label for="birthday">Birthday <span class="required-star">*</span>:</label>
      <input type="date" id="birthday" name="birthday" required value="<%= request.getParameter("birthday") != null ? request.getParameter("birthday") : "" %>" />



      <label>Gender <span class="required-star">*</span>:</label>
      <select name="gender" required>
        <option value=""></option>
        <% for (String gen : gender) { %>
        <option><%= gen %></option>
        <% } %>
      </select>


      <label>Country of Residence<span class="required-star">*</span>:</label>
      <select name="country" required>
        <option value=""></option>
        <% for (String con : country) { %>
        <option><%= con %></option>
        <% } %>
      </select>



        <label for="frontphoto">ID photo (front)<span class="required-star">*</span>:</label>
        <input type="file" id="frontphoto" name="frontphoto" required>

      <label for="backphoto">ID photo (back)<span class="required-star">*</span>:</label>
      <input type="file" id="backphoto" name="backphoto" required>




      <label for="email">Email<span class="required-star">*</span>:</label>
      <input type="email" id="email" name="email" required value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" />



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
