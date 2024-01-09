<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-11-01
  Time: 19:29
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
        <form action="updateu" method="post">
        <label>First Name:</label>
        <input type="text" name="fname" value="<%= fname%>" >
        <label>Last Name:</label>
        <input type="text" name="lname" value="<%= lname%>" >

        <label>Email:</label>
        <input type="email" name="email" value="<%= email%>" >
            <label>Date of Birth:</label>
            <input type="date" id="dob" name="dob" value="<%=bday%>">
        <label>Country of Residence:</label>
        <input type="text" id="country" name="country" value="<%= country%>">
      <label>About Me:</label>
        <textarea id="aboutMe" name="aboutMe"></textarea>

        <h2>Change Password</h2>
        <label>Existing Password:</label>
        <input type="password" id="existingPassword" name="existingPassword" value="<%=password%>">
        <label>New Password:</label>
        <input type="password" id="newPassword" name="newPassword">
        <label>Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword">

        <button type="submit" onclick="saveProfile()">Save</button>
    </div>
</div>

<script>
    function saveProfile() {
        var existingPassword = document.getElementById("existingPassword").value;
        var newPassword = document.getElementById("newPassword").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        var passwordError = document.getElementById("password-error");

        passwordError.innerHTML = ""; // Reset error message

        if (existingPassword === "" || newPassword === "" || confirmPassword === "") {
            passwordError.innerHTML = "All password fields are required.";
            return;
        }

        // Example: Check if new password and confirm password match
        if (newPassword !== confirmPassword) {
            passwordError.innerHTML = "New password and confirm password do not match.";
            return;
        }

        // Example: Check password length and uppercase requirement
        if (newPassword.length < 8 || !/[A-Z]/.test(newPassword)) {
            passwordError.innerHTML = "Password should be at least 8 characters long and contain at least one uppercase letter.";
            return;
        }

        // Example: Send form data to the server using AJAX or fetch API
        // For demonstration purposes, display a success message
        alert("Profile updated successfully!");
    }
</script>

</body>
</html>
