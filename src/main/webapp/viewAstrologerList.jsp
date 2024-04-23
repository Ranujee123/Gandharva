<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-21
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="Final_Sidebar.jsp"/>
<html>
<head>
    <title>View AstrologerList</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">

    <style>

        * {
            font-family: "Poppins", sans-serif;

        }

        body {
            display: flex;
            min-height: 100vh;
            background-color: #f0f0f0;
            align-items: flex-start; /* Ensures items start from the top */
            justify-content: center;
 /* Adds space at the top for any header or spacing */
        }

        .main-content {
            display: flex;
            flex-direction: column; /* Organizes content in a vertical direction */
            align-items: center; /* Centers items horizontally in the container */
            width: calc(100% - 120px); /* Adjust width according to the sidebar */
            margin-left:100px; /* Space for the sidebar */

        }

        .details-card {

            margin: 15px;
            padding: 20px;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1); /* Adds a subtle shadow for depth */
            display: flex;
            align-items: center; /* Aligns items vertically center */
            justify-content: flex-start; /* Aligns content to the left */
            width: 60%; /* Full width of the container */
            text-decoration: none; /* Removes underline from links */
        }

        .profile-image {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            margin-right: 20px; /* Space between image and text */
        }

        a {
            text-decoration: none; /* Ensures no underline on the links */
            color: inherit; /* Inherits text color from parent elements */
            width: 100%; /* Full width links for easier clicking */

        }


    </style>


</head>
<body>
<div class="main-content">
    <h1>Astrologers List</h1>

    <a href="sendingReqAstorologer.jsp" style="text-decoration: none; color: inherit;">
        <div class="details-card">
            <img src="DP/defaultDP.jpeg" alt="Profile Image" class="profile-image">
            <div>
                <h2>Sri Jayathisse</h2>
                <p>The well known and experienced astrologer</p>
            </div>
        </div>
    </a>

    <a href="astrologerDetails2.jsp" style="text-decoration: none; color: inherit;">
        <div class="details-card">
            <img src="DP/defaultDP.jpeg" alt="Profile Image" class="profile-image">
            <div>
                <h2>Sumanadasa Abeygunawardena</h2>
                <p>The well known and experienced astrologer</p>
            </div>
        </div>
    </a>

    <a href="astrologerDetails3.jsp" style="text-decoration: none; color: inherit;">
        <div class="details-card">
            <img src="DP/defaultDP.jpeg" alt="Profile Image" class="profile-image">
            <div>
                <h2>Senarath Liyana Arachchi</h2>
                <p>The well known and experienced astrologer</p>
            </div>
        </div>
    </a>
</div>
</body>
</html>
