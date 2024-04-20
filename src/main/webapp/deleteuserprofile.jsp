<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-01-09
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.user.model.User" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="Final_Sidebar.jsp"/>



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
  <link rel="stylesheet" type="text/css" href="u_styles.css">
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

  <h1>Deactivate Account</h1>
  <div class="form-container">
    <% if (user != null) { %>


    <form action="delete" method="post">
      <input type="hidden" name="email" value="<%= user.getEmail() %>">
      <p>Are you sure you want to deactivate your account?</p>
      <button type="submit">Deactivate Account</button>
    </form>
    <% } else { %>
    <p>User details not found.</p>
    <% } %>
  </div>
</div>

</body>
</html>

