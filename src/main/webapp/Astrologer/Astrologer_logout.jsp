<%@ page import="com.user.model.astrologer.AllUser" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: Binali Ukwatte
  Date: 01-02-2024
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <link rel="stylesheet" href="Astrologer/styles.css">
    <title>Logout</title>
</head>
<body>
<div class="sidebar">
    <div class="logo">
        <img src="images/logo.png" alt="Logo">
    </div>
    <ul class="menu">
        <li>
            <a href="astrologer">
                <i class="menu-icon fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <li>
            <a href="astrologerProfile">
                <i class="menu-icon fas fa-user"></i>
                <span>Profile</span>
            </a>
        </li>
        <li>
            <a href="request">
                <i class="menu-icon fas fa-hourglass-half"></i>
                <span>User Requests</span>
            </a>
        </li>
        <li>
            <a href="astrologerSchedule">
                <i class="menu-icon fas fa-calendar"></i>
                <span>Schedule</span>
            </a>
        </li>
        <li>
            <a href="astrologerPayment">
                <i class="menu-icon fas fa-credit-card"></i>
                <span>Payment</span>
            </a>
        </li>
        <li>
            <a href="astrologerSettings">
                <i class="menu-icon fas fa-cog"></i>
                <span>Settings</span>
            </a>
        </li>
        <li class="logout active">
            <a href="astrologerLogout">
                <i class="menu-icon fas fa-sign-out-alt"></i>
                <span>logout</span>
            </a>
        </li>
    </ul>
</div>

<div class="main--content">
    <div class="header--wrapper">
        <div class="header--title">
            <span> Account </span>
            <h2>Logout</h2>

        </div>
        <div class="user--info">
            <div class="search--box">
                <i class="menu-icon fas fa-search"></i>

                <input type="text" placeholder="Search">
            </div>
            <%
                String base64Image = null;
                if (session.getAttribute("id") == null) {
                    response.sendRedirect("login");
                } else {
                    AllUser astrologer = (AllUser) session.getAttribute("astrologer");
                    byte[] blobData = astrologer.getUserImage();
                    base64Image = Base64.getEncoder().encodeToString(blobData);
                }
            %>
            <img src="data:image/png;base64, <%= base64Image %>" alt="User Image">
        </div>
    </div>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
<script src="Astrologer/js/astrologerLogout.js" defer></script>
</html>

