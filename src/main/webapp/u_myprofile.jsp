<%@ page import="com.user.model.User" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="logoutbutton.jsp"/>
<c:import url="sidebar.jsp"/>

<%

    String userEmail = (String) session.getAttribute("userEmail");
    User user = null;
    if (userEmail != null) {
        List<User> userDetails = UserDBUtil.getUserDetails(userEmail);
        if (userDetails != null && !userDetails.isEmpty()) {
            user = userDetails.get(0);
        }
    }
%>


<!DOCTYPE html>
<html>

<head>
    <title>User profile </title>
    <link rel="stylesheet" type="text/css" href="styles.css">



    <style>
        body {
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f0f0f0;
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
    <script src="nic-utils.js"></script>

</head>



<body style="margin: 0;">







<div class="main-content">
    <form action="UpdateUserServlet" method="post">
        <div class="profile-details">
            <% if (user != null) { %>
            <img src="images/background.jpg" alt="Profile Image" class="profile-image-editable">
            <p>Name: <span><%= user.getFname() %></span> <span><%= user.getLname() %></span></p>
            <p>Email: <%= user.getEmail() %></p>

            <%= user.getProvinceName() != null ? user.getProvinceName() : "Not specified" %>

            <!-- Add other fields as needed -->
            <% } %>
        </div>



        <%
            Integer completedSteps = (Integer)session.getAttribute("completedSteps");
            Integer totalSteps = 6; // Assuming there are 7 steps in total for profile completion
            if (completedSteps == null) { completedSteps = 0; }
            int stepsLeft = totalSteps - completedSteps;

            if (stepsLeft > 0) {
        %>
        <div class="completion-bar">
            <div class="completion-fill" style="width: <%= ((double)completedSteps / totalSteps) * 100 %>%;"></div>
        </div>
        <p class="completion-text">You have <%= stepsLeft %> steps left to complete your profile.</p>
        <% } else { %>
        <p>Your profile is fully completed.</p>
        <% } %>


        <a href="ProfileCompletionServlet?action=addDetails">Add Profile Details</a>


        <div class="dashboard-options">
            <ul>
                <li><a href="editProfile.jsp"><button type="button">Update my data</button></a></li>
                <li><a href="cpassword.jsp"><button type="button">Change Password</button></a></li>
                <li><a href="pricing.jsp"><button>Change Plan</button></a></li>
                <li><a href="deleteuserprofile.jsp"><button type="button">Deactivate Account</button></a></li>
            </ul>
        </div>
    </form>
</div>

</body>
</html>
