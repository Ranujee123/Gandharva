<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-24
  Time: 01:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="Final_Sidebar.jsp"/>
<%@ page import="com.user.model.ConnectionRequest" %>
<html>
<head>
    <title>View Accepted List</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <style>
        * { font-family: "Poppins", sans-serif; }
        body {
            display: flex;
            min-height: 100vh;
            background-color: #f0f0f0;
            align-items: flex-start;
            justify-content: center;
        }
        .main-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: calc(100% - 120px);
            margin-left: 100px;
        }
        .details-card {
            margin: 15px;
            padding: 20px;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            display: flex;
            align-items: center;
            justify-content: flex-start;
            width: 60%;
            text-decoration: none;
        }
        .profile-image {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            margin-right: 20px;
        }
        a {
            text-decoration: none;
            color: inherit;
            width: 100%;
        }
    </style>
</head>
<body>
<%
    ConnectionRequest connectionRequest = (ConnectionRequest) request.getAttribute("connectionRequest");
    Boolean isReported = (Boolean) request.getAttribute("isUserReported");
    Boolean isConnected=(Boolean)request.getAttribute("isConnectedUser") ;


%>

<div class="main-content">
    <h1>Your Connected Profiles</h1>
    <c:if test="${not empty acceptedRequests}">
        <!-- viewAcceptedReqU.jsp -->
        <!-- In your JSP file: ViewAcceptedReqU.jsp -->
        <c:forEach var="request" items="${acceptedRequests}">
            <div class="details-card">
                <img src="DP/defaultDP.jpeg" alt="Profile Image" class="profile-image">
                <div>
                    <h2><c:out value="${request.firstName}"/> <c:out value="${request.lastName}"/></h2>
<%--                    <p>Status: ${request.status}</p>--%>
                    <!-- Form to submit to ViewDetailsofConnectedProfiles servlet -->
                    <form action="moredetails" method="post">
                        <input type="hidden" name="email" value="${request.email}"/>
                        <p>Email: ${request.email}</p>
                        <button type="submit" class="connect-button">View More</button>
                    </form>

                </div>
            </div>
        </c:forEach>



    </c:if>

    <c:if test="${empty acceptedRequests}">
        <p>No accepted requests found.</p>
    </c:if>
</div>
</body>
</html>
