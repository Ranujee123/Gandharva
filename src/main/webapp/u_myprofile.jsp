<%@ page import="com.user.model.User" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="logoutbutton.jsp"/>
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
    String profileImagePath = UserDBUtil.getProfileImagePath(userEmail); // Fetch image path (default or user's)
%>



<!DOCTYPE html>
<html>

<head>
    <title>User profile </title>
    <link rel="stylesheet" type="text/css" href="u_myprofile.css">
<style>

</style>


    <script src="js/nic-utils.js"></script>

</head>



<body style="margin: 0;">




<div class="main-content">
    <form action="UpdateUserServlet" method="post">
        <div class="profile-details">
            <% if (user != null) { %>
            <img src="<%= profileImagePath %>" alt="Profile Image" class="profile-image-editable">
<div class="profile-info">
            <p>Name: <span><%= user.getFname() %></span> <span><%= user.getLname() %></span></p>

            <p>Email: <%= user.getEmail() %></p>

         <p> Province:  <%= user.getProvinceName() != null ? user.getProvinceName() : "Not specified" %></p>

            <!-- Add other fields as needed -->
            <% } %>
        </div>

        </div>
        <div class="cards-container">
            <div class="card">New Connections</div>
            <div class="card">Pending Requests</div>
            <div class="card">Accepted</div>
        </div>



        <%
            Integer completedSteps = (Integer)session.getAttribute("completedSteps");
            Integer totalSteps = 7; // Assuming there are 7 steps in total for profile completion
            if (completedSteps == null) { completedSteps = 0; }
            int stepsLeft = totalSteps - completedSteps;

            if (stepsLeft > 0) {
        %>
        <div class="completion-bar">
            <div class="completion-fill" style="width: <%= ((double)completedSteps / totalSteps) * 100 %>%;"></div>
        </div>
        <p class="completion-text">You have <%= stepsLeft %> steps left to complete your profile.</p>
        <% } else { %>
        <p class="completion-text">Your profile is fully completed.</p>
        <% } %>

        <div class="button">
            <a href="ProfileCompletionServlet">Add Profile Details</a>
        </div>

<div class="button">
        <div class="dashboard-options">
            <ul>
                <li><a href="editProfile.jsp">Update my data</a></li>
                <li><a href="cpassword.jsp">Change Password</a></li>
                <li><a href="pricing.jsp">Change Plan</a></li>
                <li><a href="deleteuserprofile.jsp">Deactivate Account</a></li>
            </ul>
        </div>
</div>
    </form>
</div>

</body>
</html>
