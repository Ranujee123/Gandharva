<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-11-02
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
  <title>Astrologers</title>
  <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    .sidebar {
      background-color: black;
      color: #fff;
      padding: 20px;
      position: fixed;
      height: 100%;
      width: 200px;
      top: 0;
      left: 0;
    }

    .profile {
      text-align: center;
      margin-bottom: 20px;
    }

    .profile-image {
      border-radius: 50%;
      width: 100px;
      height: 100px;
    }

    .sidebar-menu {
      list-style-type: none;
      padding: 0;
      margin-top: 20px;
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

    .main-content {
      margin-top: 50px;
      padding: 20px;
      text-align: center;
    }

    .user-container {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .card {
      width: 300px;
      padding: 20px;
      margin: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: white;
      text-align: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
      transform: scale(1.05);
      box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.1);
    }

    .card h2 {
      font-size: 24px;
      font-weight: bold;
    }

    .card-details {
      text-align: left;
      margin-top: 10px;
    }

    .card img {
      border-radius: 50%;
      width: 50px;
      height: 50px;
      margin-bottom: 10px;
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
    <li class="dropdown">
      <button>Request Service &#9662;</button>
      <ul class="dropdown-content">
        <li><a href="astrologerService.jsp"><button>Astrology Service</button></a></li>
        <li><a href="eventplannerService.jsp"><button>Event Planner Service</button></a></li>

</div>
<div class="main-content">
  <div class="user-container">
    <div class="card">
      <img src="images/user1.jpg" alt="Profile Image">
      <h2>Anjalee Weerasekara</h2>
      <div class="card-details">
        <p>Town:Colombo</p>
        <p>Age: 22</p>
      </div>
    </div>
    <div class="card">
      <img src="images/user1.jpg" alt="Profile Image">
      <h2>Maduri Nisakya</h2>
      <div class="card-details">
        <p>Town:Colombo</p>
        <p>Age: 30</p>
      </div>


    </div>
  </div>
</div>
</body>
</html>
