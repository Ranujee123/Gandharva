<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-01-09
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <title>User Dashboard</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <style>
    /* Inline CSS styling */
    .container {
      display: flex;
      flex: 1;
    }
    body {
      margin: 0;
      display: flex;
      min-height: 100vh;
      background-color: #f0f0f0;
    }


    .main-content {
      padding: 20px;
      max-width: 600px;
      text-align: center;
      margin: auto;
    }

    .form-container input, .form-container textarea {
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

    .error {
      color: red;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>


<%

  String fname= request.getParameter("fname");
  String lname= request.getParameter("lname");
  String bday= request.getParameter("bday");
  String country= request.getParameter("country");
  String email= request.getParameter("email");
  String password= request.getParameter("password");
  String cpassword= request.getParameter("cpassword");


%>



<div class="sidebar">
  <div class="profile">
    <img src="images/background.jpg" alt="Profile Image" class="profile-image">

    <p class="profile-name"><%= fname %> <%= lname %></p>
  </div>
  <ul class="sidebar-menu">
    <li><a href="u_myprofile.jsp"><button>My Profile</button></a></li>
    <li><button>Connections</button></li>
    <li><a href="chat.jsp"><button>Chat</button></a></li>
    <li><button>Notifications</button></li>
    <li><button>Settings</button></li>
    <li class="dropdown">
      <button>Request Service &#9662;</button>
      <ul class="dropdown-content">
        <li><a href="astrologerService.jsp"><button>Astrology Service</button></a></li>
        <li><a href="eventplannerService.jsp"><button>Event Planner Service</button></a></li>
</div>
</li>
</ul>
</div>


<div class="main-content">
  <h1>Edit Profile</h1>
  <div class="form-container">
    <div class="error" id="password-error"></div>
    <form action="delete" method="post">
      <label>First Name:</label>
      <input type="text" name="fname" value="<%= fname%>" readonly>
      <label>Last Name:</label>
      <input type="text" name="lname" value="<%= lname%>" readonly>

      <label>Email:</label>
      <input type="email" name="email" value="<%= email%>" readonly>
      <label>Date of Birth:</label>
      <input type="date" id="dob" name="dob" value="<%=bday%>" readonly>
      <label>Country of Residence:</label>
      <input type="text" id="country" name="country" value="<%= country%>" readonly>
      <label>About Me:</label>
      <textarea id="aboutMe" name="aboutMe"></textarea>


      <button type="submit" onclick="saveProfile()">Deactivate Account</button>
  </div>
</div>

</body>
</html>

