<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-22
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="Final_Sidebar.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>Matched Profiles</title>
    <link rel="stylesheet" type="text/css" href="u_dashboard.css"> <!-- Ensure you link to your CSS for styling -->
    <!-- Include SweetAlert2 from CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


    <style>
        /* This is the existing button styling */
        .button {
            background-color: #4CAF50;  /* Green */
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        .profile-card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            width: 50%;  /* Adjust the width as needed */
            height: 30%; /* Same value as width to make it square */
            border-radius: 5px;
            display: inline-block;
            margin: 10px;
            padding: 2px 16px;
            text-align: center;
        }

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


    <script>
        function confirmConnection() {
            Swal.fire({
                title: 'To view All your Potential Matches You have to be a Premium User',
                text: "Do you want to become a premium User",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#4CAF50',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Okay!'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = 'pricing.jsp'; // Redirect to pricing.jsp when confirmed
                }
            });
        }

    </script>

</head>
<body>
<div class="main-content">
    <h1><b>Matched Profiles</b></h1>

    <c:if test="${not empty matchedUsers}">

            <c:forEach items="${matchedUsers}" var="user">
<%--        <div class="details-card">--%>
<%--            <div class="profiles-section">--%>
                <div class="profile-card">
            <img src="DP/defaultDP.jpeg" alt="Profile Image" class="profile-image">


                    <h2><c:out value="${user.firstName}"/> <span class="lastName" data-lastName="<c:out value='${user.lastName}'/>"></span></h2>
                    <div class="profile-details-grid">
                        <div class="profile-detail">
                            <p>Province: <c:out value="${user.province}"/></p>
                        </div>
                        <div class="profile-detail">
                            <p>Ethnicity: <c:out value="${user.ethnicity}"/></p>
                        </div>
                        <div class="profile-detail">
                            <p>Religion: <c:out value="${user.religion}"/></p>
                        </div>
                        <div class="profile-detail">
                            <p>Caste: <c:out value="${user.caste}"/></p>
                        </div>
                        <div class="profile-detail">
                            <p>Occupation: <c:out value="${user.occupation}"/></p>
                        </div>
                </div>

                    <input type="hidden" name="email" value="<c:out value='${user.email}'/>">
                    <div class="button-container">
                        <form action="moredetails" method="post">
                            <input type="hidden" name="email" value="${user.email}"/>
                            <button type="submit" class="connect-button">View More</button>
                        </form>
                    </div>
                </div> <!-- Closing profile-card -->

            </c:forEach>

    </c:if>
<!-- Closing profiles-section -->

<c:if test="${!isPremiumUser }">

        <button type="button" class="connect-button" id="connectionForm"  onclick="confirmConnection()">View More Potential Matches</button>

</c:if>

<c:if test="${empty matchedUsers}">
    <p>No profiles matched your criteria.</p>
</c:if>

</body>
</html>
