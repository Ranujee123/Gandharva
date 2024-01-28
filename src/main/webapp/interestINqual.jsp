<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-01-22
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.user.model.DBConnect" %>
<%@ page import="com.user.model.User" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  List<String> qualifications = UserDBUtil.getAllQualifications();
  List<String> occupations = UserDBUtil.getAllOccupations();
%>

<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <title>User Dashboard</title>
  <style>
    /* Inline CSS styling */
    body {
      margin: 0;
      display: flex;
      flex-direction: column;
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
  </style>
</head>
<body>

<div class="container">

  <div class="sidebar">
    <div class="profile">
      <img src="images/background.jpg" alt="Profile Image" class="profile-image">
      <p class="profile-name">Vidhara Ranujee</p>
    </div>
    <ul class="sidebar-menu">
      <li><a href="u_myprofile.jsp"><button>My Profile</button></a></li>
      <li><button>Connections</button></li>
      <li><button>Chat</button></li>
      <li><button>Notifications</button></li>
      <li class="dropdown">
        <button>Request Service &#9662;</button>
        <div class="dropdown-content">
          <button>Astrology Service</button>
          <button>Event Planner Service</button>
        </div>
      </li>
    </ul>
  </div>


  <div class="main-content">
    <h1>Who are you interested in ?</h1>
    <div class="form-container">
      <form action="interestinqual" method="post">
        <label>School / College:</label>
        <input type="text" name="school" required><br>



        <label>Heighest Education Qualification:</label>
        <select name="eduquali" required>
          <option value=""></option>
          <% for (String qualification : qualifications) { %>
          <option><%= qualification %></option>
          <% } %>
        </select>

        <label>Occupation :</label>
        <select name="occupation" required>
          <option value=""></option>
          <% for (String occupation : occupations) { %>
          <option><%= occupation %></option>
          <% } %>
        </select>






        <div class="completion-bar">
          <div class="completion-fill" style="width: 85%;"></div> <!-- Adjust the width based on completion -->
        </div>
        <p class="completion-text">6 out of 7 is completed</p>

        <!-- Proceed button -->
        <button type="submit" name="action" value="proceed">Proceed</button>

        <!-- Save Progress button -->
        <button type="submit" formaction="ProfileCompletionServlet" name="action" value="save">Save Progress</button>
      </form>
    </div>



    </form>
  </div>
</div>
</div>

</div>

</body>
</html>
