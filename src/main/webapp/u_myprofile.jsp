<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-09-26
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

<c:forEach var="user" items="${userDetails}">
    <c:set var="fname" value="${user.fname}"/>
    <c:set var="lname" value="${user.lname}"/>
    <c:set var="bday" value="${user.bday}"/>
    <c:set var="country" value="${user.country}"/>
    <c:set var="email" value="${user.email}"/>
    <c:set var="password" value="${user.password}"/>
    <c:set var="cpassword" value="${user.cpassword}"/>




<div class="sidebar">
    <div class="profile">
        <img src="images/background.jpg" alt="Profile Image" class="profile-image">
        <p class="profile-name"> <span contenteditable="true" name="fname">${user.getFname()}</span> <span
                contenteditable="true" name="lname">${user.getLname()}</span>
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
                <img src="images/background.jpg" alt="Profile Image" class="profile-image-editable">
                <p>Name: <span contenteditable="true" name="fname">${user.getFname()}</span> <span
                        contenteditable="true" name="lname">${user.getLname()}</span></p>
                <p>Email: ${user.getEmail()}</p>
                <p>Birthday: ${user.getBday()}</p>
                <p>Country: ${user.getCountry()}</p>
                <!-- Add other editable fields as needed -->
            </div>
                </c:forEach>


            <div class="completion-bar">
                <div class="completion-fill" style="width: 14%;"></div>
            </div>

            <p class="completion-text">1 out of 7 is completed</p>
            <a href="ProfileCompletionServlet">Add Profile Details</a>

           <!-- <p class="completion-link"><a href="addDetails.jsp">Add Profile Details</a></p>-->

            <div class="dashboard-options">
                <ul>
<li>

                    <c:url value="editProfile.jsp" var="userupdate">
                        <c:param name="fname" value="${fname}"/>
                        <c:param name="lname" value="${lname}"/>
                        <c:param name="bday" value="${bday}"/>
                        <c:param name="country" value="${country}"/>
                        <c:param name="email" value="${email}"/>
                        <c:param name="password" value="${password}"/>
                        <c:param name="cpassword" value="${cpassword}"/>

                    </c:url>

                    <a href="${userupdate}">
                        <input type="button" name="update" value="Update my data">
                    </a></li>

                    <li><a href="updateuser.jsp"><button>Edit Account</button></a></li>
                    <li><a href="pricing.jsp"><button>Change Plan</button></a></li>
                    <li>

                        <c:url value="deleteuserprofile.jsp" var="userdelete">
                            <c:param name="fname" value="${fname}"/>
                            <c:param name="lname" value="${lname}"/>
                            <c:param name="bday" value="${bday}"/>
                            <c:param name="country" value="${country}"/>
                            <c:param name="email" value="${email}"/>
                            <c:param name="password" value="${password}"/>
                            <c:param name="cpassword" value="${cpassword}"/>

                        </c:url>



                        <a href="${userdelete}">
                        <input type="button" name="delete" value="Deactivate Account"></a></li>

                </ul>
            </div>
        </form>
    </div>

</body>

</html>
