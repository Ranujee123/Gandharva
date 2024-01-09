<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-11-29
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>User Dashboard</title>
  <link rel="stylesheet" href="styles.css">
  <style>
    /* Inline CSS styling */
    body {
      margin: 0;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
      background-color: #f0f0f0;
    }

    .container {
      display: flex;
      flex: 1;
    }

    .main-content {
      flex: 1;
      padding: 20px;
      text-align: center;
      margin: auto;
      max-width: 600px;
    }

    .form-container input,
    .form-container textarea,
    .form-container select {
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

    .error {
      color: red;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>

<div class="container">

  <div class="sidebar">
    <div class="profile">
      <img src="images/background.jpg" alt="Profile Image" class="profile-image">
      <p class="profile-name">John Doe</p>
    </div>
    <ul class="sidebar-menu">
      <li><a href="u_myprofile.jsp"><button>My Profile</button></a></li>
      <li><button>Connections</button></li>
      <li><button>Chat</button></li>
      <li><button>Notifications</button></li>
      <li class="dropdown">
        <button>Request Service &#9662;</button>
        <div class="dropdown-content">
          <button>Astrology Service</button>
          <button>Event Planner Service</button>
        </div>
      </li>
    </ul>
  </div>

  <div class="main-content">
    <h1>Interests</h1>
    <div class="form-container">
      <form action="interest" method="post">
        <label>Enter your interests and hobbies (max 250 characters):</label>
        <textarea name="interestsAndHobby" maxlength="250" required></textarea><br>

        <label>Select your personality type:</label>
        <select name="personality" required>
          <option value=""></option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <!-- Add more options up to 16 as needed -->
        </select><br>

        <div class="completion-bar">
          <div class="completion-fill" style="width: 57%;"></div> <!-- Adjust the width based on completion -->
        </div>
        <p class="completion-text">4 out of 7 is completed</p>

        <a href="CheckPersonality.jsp">Check Your Personality</a><br>
        <br>
        <button type="submit">Save Progress</button>
        <a href="NextPageServlet"><button type="button">Proceed</button></a>
      </form>
    </div>
  </div>
</div>
</body>
</html>
