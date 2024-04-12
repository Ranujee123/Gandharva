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
  <link rel="stylesheet" type="text/css" href="styles.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>
<body>
<div class="sidebar">
  <div class="profile">
    <%
      String userEmail = (String) session.getAttribute("userEmail");
      User user = null;
      if (userEmail != null) {
        List<User> userDetails = UserDBUtil.getUserDetails(userEmail);
        if (userDetails != null && !userDetails.isEmpty()) {
          user = userDetails.get(0);
        }
      }
      String profileImagePath = UserDBUtil.getProfileImagePath(userEmail); // Fetch image path (default or user's)
    %>


    <% if (user != null) { %>
    <img src="<%= profileImagePath %>" alt="Profile Image" class="profile-image">
    <p class="profile-name"><span contenteditable="true" name="fname"><%= user.getFname() %></span>
      <span contenteditable="true" name="lname"><%= user.getLname() %></span></p>
    <% } %>
  </div>


  <ul class="sidebar-menu">

    <li><a href="u_myprofile.jsp"><button>My Profile</button></a></li>
    <li><button>Connections</button></li>
    <li><a href="view_profile.jsp"><button>Chat</button></a></li>
    <li><button>Notifications</button></li>
    <li><button>Settings</button></li>
    <li class="dropdown">
      <button>Request Service &#9662;</button>
      <ul class="dropdown-content">
        <li><a href="astrologerService.jsp"><button>Astrology Service</button></a></li>
        <li><a href="eventplannerService.jsp"><button>Event Planner Service</button></a></li>

      </ul>
    </li>

  </ul>
</div>

</body>
</html>
