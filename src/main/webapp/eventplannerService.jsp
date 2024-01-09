<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-11-02
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Event Planners</title>
  <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
  <style>
    .main-content {
      margin-top: 50px; /* Adjust margin as needed */
      padding: 20px;
      text-align: center;
    }

    .astrologer-heading {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 20px;
    }

    .astrologer-card {
      border: 1px solid #ccc;
      border-radius: 10px;
      padding: 10px;
      margin-bottom: 20px;
      cursor: pointer;
      transition: transform 0.3s ease;
      background-color: #fff; /* Set card background to white */
      width: 150px; /* Adjust card width */
      margin-right: 10px; /* Add margin between cards */
    }

    .astrologer-card:hover {
      transform: scale(1.05);
    }

    .sidebar {
      background-color: black;
      color: #fff;
      padding: 20px;
      position: fixed;
      height: 100%; /* Make sidebar cover the whole left side */
      width: 200px; /* Set sidebar width */
      top: 0; /* Align sidebar to the top */
      left: 0; /* Align sidebar to the left */
    }

    .sidebar .profile {
      text-align: center;
      margin-bottom: 20px;
    }

    .sidebar .profile-image {
      border-radius: 50%;
      width: 100px;
      height: 100px;
    }

    .sidebar-menu {
      list-style-type: none;
      padding: 0;
      margin-top: 20px; /* Add margin between profile and menu items */
    }

    .sidebar-menu li {
      margin-bottom: 10px;
    }

    .sidebar-menu button {
      background-color: transparent;
      color: #fff;
      border: none;
      cursor: pointer;
      padding: 10px 20px;
      width: 100%;
      text-align: left;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .dropdown-content {
      display: none;
      background-color: #333;
      position: absolute;
      min-width: 200px;
      z-index: 1;
    }

    .sidebar:hover .dropdown-content {
      display: block;
    }

    .dropdown-content button {
      width: 100%;
      padding: 10px;
      text-align: left;
      background-color: transparent;
      border: none;
      color: #fff;
    }
    .astrologer-container {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .astrologer-heading {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 20px;
    }

    .card {
      width: 200px;
      padding: 20px;
      margin: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: white;
      text-align: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease; /* Add transition effect for hover */
    }

    .card:hover {
      transform: scale(1.05); /* Enlarge the card on hover */
      box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.1); /* Add shadow effect on hover */
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
    <li><a href="Astrologer_logout.jsp"><button>Log out</button></a></li>
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
  <div class="astrologer-container">
    <h2 class="astrologer-heading">Select an Event Planner</h2>

    <div class="card">
      <h2>Event Planner 1</h2>
      <p>Package: Basic Event Planning</p>
    </div>

    <div class="card">
      <h2>Event Planner 2</h2>
      <p>Package: Premium Event Planning</p>
    </div>

    <div class="card">
      <h2>Event Planner 3</h2>
      <p>Package: Luxury Event Planning</p>
    </div>

    <!-- Add more event planner cards as needed -->
  </div>
</div>

</body>
</html>

