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




            <button type="submit" onclick="saveProfile()">Save</button>
        </form>

        <% } %>
    </div>
</div>


</body>
</html>
