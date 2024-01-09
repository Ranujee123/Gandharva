<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-11-02
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Chat List</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <style>
    /* Reset some default styles */


    .main-content {
      margin-left: 220px; /* Adjust margin to leave space for sidebar */
      padding: 20px;
      text-align: center;
    }

    .chat-list {
      padding: 20px;
      max-width: 300px;
      margin: auto;
    }

    .chat-item {
      display: flex;
      align-items: center;
      padding: 10px;
      border-bottom: 1px solid #ccc;
    }

    .avatar {
      border-radius: 50%;
      width: 50px;
      height: 50px;
      margin-right: 10px;
    }

    .username {
      font-weight: bold;
    }

    .last-message {
      color: #888;
      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
    }
  </style>
</head>
<body>
<div class="sidebar">
  <div class="profile">
    <img src="images/background.jpg" alt="Profile Image" class="profile-image">
    <p class="profile-name">Vidhara Ranujee</p>
  </div>
  <ul class="sidebar-menu">
    <li><a href="u_myprofile.jsp"><button>My Profile</button></a></li>
    <li><button>Connections</button></li>
    <li><a href="chat.jsp"><button>Chat</button></a></li>
    <li><button>Notifications</button></li>
    <li><button>Settings</button></li>
    <li><a href="u_logout.jsp"><button>Log out</button></a></li>
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
  <h1>Chat</h1>
  <div class="chat-list">
    <!-- Chat list items -->
    <div class="chat-item">
      <img src="images/user1.jpg" alt="User 1" class="avatar">
      <div>
        <div class="username">Marry</div>
        <div class="last-message">Hey, how are you doing?</div>
      </div>
    </div>
    <div class="chat-item">
      <img src="images/user1.jpg" alt="User 2" class="avatar">
      <div>
        <div class="username">Marry</div>
        <div class="last-message">Sure, I'll be there on time.</div>
      </div>
    </div>
    <!-- Add more chat list items as needed -->
  </div>
</div>

</body>
</html>
