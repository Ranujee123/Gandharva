<%@ page import="com.user.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserDBUtil" %><%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-02-07
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>

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


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Change Password </title>
    <link rel="stylesheet" type="text/css" href="styles.css">

    <style>
    body {
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-color: #f0f0f0;
    }
    .main-content {
    margin-left: 220px;
    padding: 20px;
    }
</style>
</head>
<body>

<div class="main-content">
    <form action="UpdateUserPassword" method="post">
<h2>Change Password</h2>
<label>Current Password:</label>
<input type="password" id="existingPassword" name="existingPassword" placeholder="Enter current password">
<label>New Password:</label>
<input type="password" id="newPassword" name="newPassword" placeholder="Enter new password">
<label>Confirm New Password:</label>
<input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm new password">



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
</div>
    </form>
</body>
</html>
