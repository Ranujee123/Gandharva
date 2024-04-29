<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-28
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="logoutbutton.jsp"/>
<c:import url="Final_Sidebar.jsp"/>



<%
  List<String>personalities = UserDBUtil.getAllpersonality();

%>


<%

  String userEmail = (String) session.getAttribute("userEmail");
  User user = null;

  if (userEmail != null) {
    String id=UserDBUtil.getUserIdByEmail(userEmail);
    List<User> interestDetails = UserDBUtil.getInterestDetails(id);
    if (interestDetails != null && !interestDetails.isEmpty()) {
      user = interestDetails.get(0);
    }
  }

%>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="u_styles.css">
  <title>User Dashboard</title>
  <style>
    /* Inline CSS styling */
    body {
      margin: 0;
      display: flex;
      min-height: 100vh;
      background-color: #f0f0f0;
    }

    .container {
      display: flex;
      flex: 1;
    }



    .dropdown-content button {
      width: 100%;
      padding: 10px;
      text-align: left;
      background-color: transparent;
      border: none;
      color: #fff;
    }

    .main-content {
      flex: 1;
      padding: 20px;
      text-align: center;
      margin: auto;
      max-width: 600px;
    }

    .form-container input, .form-container textarea, .form-container select {
      width: calc(100% - 20px);
      padding: 10px;
      margin-bottom: 10px;
    }

    .form-container button {
      background-color: #4CAF50;
      color: #fff;
      border: none;
      padding: 10px 20px;
      cursor: pointer;
    }
    .completion-bar {
      width: 100%;
      height: 20px;
      background-color: #ddd;
      margin-top: 20px;
    }

    .completion-fill {
      height: 100%;
      background-color: #4CAF50;
    }

    .completion-text {
      margin-top: 10px;
    }


    .error {
      color: red;
      margin-bottom: 10px;
    }
    .form-container .button {
      background-color: #4CAF50; /* Green background */
      color: white; /* White text */
      padding: 10px 20px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin: 4px 2px;
      cursor: pointer;
      border-radius: 5px;
      border: none;
    }

  </style>
</head>
<body>

<div class="container">



  <div class="main-content">
    <h1>Interest</h1>
    <div class="form-container">
      <form action="upadteinterest" method="post">
        <label>Enter your interests & hobbies:</label>
        <input type="text" name="interest"  value="<%= user != null ? user.getInterests() : "" %>" required><br>



        <label>Enter your personality type:</label>
        <select name="personalitytype" >
          <option value=""></option>
          <option value="ENTJ" <%= "ENTJ".equals(user.getPersonalitytype()) ? "selected" : "" %>>ENTJ </option>
          <option value="INFP" <%= "INFP".equals(user.getPersonalitytype()) ? "selected" : "" %>>INFP</option>
          <option value="ENFJ" <%= "ENFJ".equals(user.getPersonalitytype()) ? "selected" : "" %>>ENFJ</option>
          <option value="ESFP" <%= "ESFP".equals(user.getPersonalitytype()) ? "selected" : "" %>>ESFP</option>
          <option value="ISFP" <%= "ISFP".equals(user.getPersonalitytype()) ? "selected" : "" %>>ISFP</option>
          <option value="ENTP" <%= "ENTP".equals(user.getPersonalitytype()) ? "selected" : "" %>>ENTP</option>
          <option value="INTJ" <%= "INTJ".equals(user.getPersonalitytype()) ? "selected" : "" %>>INTJ</option>
          <option value="ENFP" <%= "ENFP".equals(user.getPersonalitytype()) ? "selected" : "" %>>ENFP</option>
          <option value="ESTJ" <%= "ESTJ".equals(user.getPersonalitytype()) ? "selected" : "" %>>ESTJ</option>
          <option value="ISTJ" <%= "ISTJ".equals(user.getPersonalitytype()) ? "selected" : "" %>>ISTJ</option>
          <option value="INFJ" <%= "INFJ".equals(user.getPersonalitytype()) ? "selected" : "" %>>INFJ</option>
          <option value="INTP" <%= "INTP".equals(user.getPersonalitytype()) ? "selected" : "" %>>INTP </option>
          <option value="ESFJ" <%= "ESFJ".equals(user.getPersonalitytype()) ? "selected" : "" %>>ESFJ</option>
          <option value="ESTP" <%= "ESTP".equals(user.getPersonalitytype()) ? "selected" : "" %>>ESTP</option>
          <option value="ISTP" <%= "ISTP".equals(user.getPersonalitytype()) ? "selected" : "" %>>ISTP</option>
          <option value="ISFJ" <%= "ISFJ".equals(user.getPersonalitytype()) ? "selected" : "" %>>ISFJ</option>

        </select>


        <label>You want to find it out? : <a href="https://www.16personalities.com/free-personality-test" target="_blank">Click here</a></label>



        <!-- Proceed button -->
        <button type="submit" name="action" value="proceed" class="form-container button">Save & Next</button>


      </form>

    </div>
  </div>
</div>

</div>

</body>
</html>