<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-22
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

        /* Centering the container that holds the button */
        .container {
            display: flex;
            justify-content: center;  /* Centers horizontally */
            align-items: center;      /* Centers vertically if the container has a specified height */
            height: 100vh;            /* Takes full viewport height */
        }

        .profile-container {
            display: flex;
            flex-direction: column; /* Ensures all children (cards) are stacked vertically */
            align-items: center; /* Center-aligns the cards for a cleaner look */
            width: 100%; /* Uses full width of the container */
        }

        .profile-card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            width: 80%; /* Relative width to make them responsive */
            min-height: 300px; /* Optional: Ensures all cards have at least this height */
            border-radius: 5px;
            margin: 10px 0; /* Adds vertical spacing but no horizontal */
            padding: 15px; /* Good padding inside the card */
            text-align: center; /* Centers text */
            background-color: #fff; /* Sets background color, if needed */
        }

        .profiles-section {
            width: 100%; /* Ensures the section uses full width */
            display: flex;
            justify-content: center; /* Center the entire section horizontally */
            flex-wrap: wrap; /* Allows multiple rows as needed */
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
<h1>Matched Profiles</h1>
<div class="profiles-section">
    <c:if test="${not empty matchedUsers}">

            <c:forEach items="${matchedUsers}" var="user">

                <div class="profile-card">
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

        <button type="button" class="button" id="connectionForm"  onclick="confirmConnection()">View More Matches</button>

</c:if>

<c:if test="${empty matchedUsers}">
    <p>No profiles matched your criteria.</p>
</c:if>

</body>
</html>
