<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserDBUtil" %><%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-11-02
  Time: 09:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  List<String> occupations = UserDBUtil.getAllOccupations();
%>

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

    .form-container input, .form-container textarea, .form-container select {
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
          <h1>Family Details</h1>
          <div class="form-container">
            <form action="fam" method="post">
              <label>Father's Name:</label>
              <input type="text" name="fatherName" required><br>

              <label>Father's Religion:</label>
              <select name="fatherReligion">
                <option value=""></option>
                <option value="Hindu">Hindu</option>
                <option value="Christian">Christian</option>
                <option value="Muslim">Muslim</option>
                <!-- Add more options as needed -->
              </select><br>

              <label>Mother's Name:</label>
              <input type="text" name="motherName" required><br>

              <label>Mother's Religion:</label>
              <select name="motherReligion">
                <option value=""></option>
                <option value="Hindu">Hindu</option>
                <option value="Christian">Christian</option>
                <option value="Muslim">Muslim</option>
                <!-- Add more options as needed -->
              </select><br>

              <label>Father's Occupation:</label>
              <select name="fatherOccupation" required>
                <option value=""></option>
                <% for (String occupation : occupations) { %>
                <option><%= occupation %></option>
                <% } %>
              </select>

              <label>Mother's Occupation:</label>
              <select name="motherOccupation" required>
                <option value=""></option>
                <% for (String occupation : occupations) { %>
                <option><%= occupation %></option>
                <% } %>
              </select>

              <label>Marital Status of Parents:</label>
              <select name="maritalStatus">
                <option value=""></option>
                <option value="Married">Married</option>
                <option value="Divorced">Divorced</option>
                <option value="Widowed">Widowed</option>
                <!-- Add more options as needed -->
              </select><br>

              <label>Number of Siblings:</label>
              <input type="number" name="numberOfSiblings" min="0" required><br>

              <div class="completion-bar">
                <div class="completion-fill" style="width: 42%;"></div> <!-- Adjust the width based on completion -->
              </div>
              <p class="completion-text">3 out of 7 is completed</p>


              <button type="submit" name="action" value="proceed">Proceed</button>

              <!-- Save Progress button -->
              <button type="submit" formaction="ProfileCompletionServlet" name="action" value="save">Save Progress</button>
            </form>
          </form>
          </div>



        </form>
    </div>
</div>
  </div>

</div>

</body>
</html>
