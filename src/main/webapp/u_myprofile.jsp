<%@ page import="com.user.model.User" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    <title>User Dashboard</title>
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
</head>



<body style="margin: 0;">





<div class="sidebar">
    <div class="profile">
        <img src="images/background.jpg" alt="Profile Image" class="profile-image">
        <% if (user != null) { %>
        <p class="profile-name"><span contenteditable="true" name="fname"><%= user.getFname() %></span>
            <span contenteditable="true" name="lname"><%= user.getLname() %></span></p>
        <% } %>
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

            </ul>
        </li>
    </ul>
</div>



<div class="main-content">
    <form action="UpdateUserServlet" method="post">
        <div class="profile-details">
            <% if (user != null) { %>
            <img src="images/background.jpg" alt="Profile Image" class="profile-image-editable">
            <p>Name: <span><%= user.getFname() %></span> <span><%= user.getLname() %></span></p>
            <p>Email: <%= user.getEmail() %></p>
            <p>Birthday: <%= user.getBday() %></p>
            <p>Country: <%= user.getCountry() %></p>
            <!-- Add other fields as needed -->
            <% } %>
        </div>



            <div class="completion-bar">
                <div class="completion-fill" style="width: 14%;"></div>
            </div>

            <p class="completion-text">1 out of 7 is completed</p>
            <a href="ProfileCompletionServlet">Add Profile Details</a>

           <!-- <p class="completion-link"><a href="addDetails.jsp">Add Profile Details</a></p>-->

        <div class="dashboard-options">
            <ul>
                <li><a href="editProfile.jsp"><button type="button">Update my data</button></a></li>
                <li><a href="pricing.jsp"><button>Change Plan</button></a></li>
                <li><a href="deleteuserprofile.jsp"><button type="button">Deactivate Account</button></a></li>
            </ul>
        </div>
    </form>
</div>

</body>
</html>
