<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-11-01
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.user.model.User" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="logoutbutton.jsp"/>
<c:import url="sidebar.jsp"/>


<%

    String userEmail = (String) session.getAttribute("userEmail");
    User user = null;
    if (userEmail != null) {
        List<User> userDetails = UserDBUtil.getUserDetails(userEmail);
        if (userDetails != null && !userDetails.isEmpty()) {
            user = userDetails.get(0);
        }
    }
%>
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





<div class="sidebar">
    <div class="profile">
        <% if (user != null) { %>
        <img src="images/background.jpg" alt="Profile Image" class="profile-image">
        <p class="profile-name"><%= user.getFname() %> <%= user.getLname() %></p>
        <% } %>

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
        <% if (user != null) { %>
        <form action="updateu" method="post">
            <label>First Name:</label>
            <input type="text" name="fname" value="<%= user.getFname() %>" >
            <label>Last Name:</label>
            <input type="text" name="lname" value="<%= user.getLname() %>" >
            <label>Email:</label>
            <input type="email" name="email" value="<%= user.getEmail() %>" >
            <label>Date of Birth:</label>
            <input type="text" id="bday" name="bday" value="<%= user.getBday() %>">
            <label>Country of Residence:</label>
            <input type="text" id="country" name="country" value="<%= user.getCountry() %>">
            <label>About Me:</label>
            <textarea id="aboutMe" name="aboutMe"></textarea>


            <h2>Change Password</h2>
            <label>Current Password:</label>
            <input type="password" id="existingPassword" name="existingPassword" placeholder="Enter current password">
            <label>New Password:</label>
            <input type="password" id="newPassword" name="newPassword" placeholder="Enter new password">
            <label>Confirm New Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm new password">

            <button type="submit" onclick="saveProfile()">Save</button>
        </form>

        <% } %>
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
