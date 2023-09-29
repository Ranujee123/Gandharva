<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-09-26
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
</head>
<body style="margin: 0;">

<style>
    /* Inline CSS styling */
    body {
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background-color: #f0f0f0;
    }

    .sidebar {
        background-color: black;
        color: #fff;
        width: 200px;
        height: 100vh;
        padding: 20px;
        position: fixed;
        top: 0;
        left: 0;
    }

    .profile {
        text-align: center;
    }

    .profile-image {
        border-radius: 50%;
        width: 100px;
        height: 100px;
    }

    .profile-name {
        margin-top: 10px;
    }

    .sidebar-menu {
        list-style-type: none;
        padding: 0;
    }

    .sidebar-menu li {
        margin-bottom: 10px;
    }

    .sidebar-menu button {
        background-color: transparent;
        color: #fff;
        border: none;
        cursor: pointer;
    }

    .dropdown-content {
        display: none;
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }

    .main-content {
        margin-left: 220px;
        padding: 20px;
    }

    .profile-image-editable {
        border-radius: 50%;
        width: 100px;
        height: 100px;
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

    .completion-link a {
        color: #007bff;
        text-decoration: underline;
    }

    .dashboard-options ul {
        list-style-type: none;
        padding: 0;
    }

    .dashboard-options ul li {
        margin-bottom: 10px;
    }
</style>

<div class="sidebar">
    <div class="profile">
        <img src="images/background.jpg" alt="Profile Image" class="profile-image">
        <p class="profile-name">John Doe</p>
    </div>
    <ul class="sidebar-menu">
        <li><button>My Profile</button></li>
        <li><button>Connections</button></li>
        <li><button>Chat</button></li>
        <li><button>Notifications</button></li>
        <li><button>Settings</button></li>
        <li class="dropdown">
            <button>Request Service &#9662;</button>
            <ul class="dropdown-content">
                <li><button>Astrology Service</button></li>
                <li><button>Event Planner Service</button></li>
            </ul>
        </li>
    </ul>
</div>

<div class="main-content">
    <div class="profile-details">
        <img src="images/background.jpg" alt="Profile Image" class="profile-image-editable">
        <p>Name: <span contenteditable="true">John Doe</span></p>
        <p>Email: <span contenteditable="true">johndoe@example.com</span></p>
        <p>Date of Birth: <span contenteditable="true">01/01/1990</span></p>
        <p>About Me: <span contenteditable="true">I love to connect with new people!</span></p>
    </div>

    <div class="completion-bar">
        <div class="completion-fill" style="width: 14%;"></div> <!-- Adjust the width based on completion -->
    </div>

    <p class="completion-text">1 out of 7 is completed</p>
    <p class="completion-link"><a href="#">Click here to complete the profile</a></p>

    <div class="dashboard-options">
        <ul>
            <li><button>Edit Account</button></li>
            <li><a href="pricing.jsp"><button>Change Plan</button></a></li> <!-- Link to pricing.jsp -->
            <li><button>Deactivate Account</button></li>
        </ul>
    </div>
</div>
</body>
</html>
