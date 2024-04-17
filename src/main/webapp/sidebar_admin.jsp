<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-02-07
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.user.model.User" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>
<html>
<head>
  <title>Title</title>

  <link rel ="stylesheet" type="text/css" href="admin.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">




</head>
<body>
<div class="sidebar-admin">
  <h5>Admin Dashboard</h5>
  <div class="profile">
    <img src="images/admin.png" alt="Profile Image" class="profile-image">
  </div>
  <ul class="sidebar-menu-admin">

    <li><a href="activateuser" >Activate Accounts</a></li>
    <li><a href="verifyuser">Verify Accounts</a></li>
    <li><a href="userlist">View profiles</a></li>
    <li><a href="complaints">Handling Complaints</a></li>
  </ul>

  <a class="logout">Logout</a>

</div>

</body>
</html>
