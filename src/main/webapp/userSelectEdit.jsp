<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-21
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="logoutbutton.jsp"/>
<c:import url="Final_Sidebar.jsp"/>

<html>
<head>
    <title>Select editing</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <style>
        body{
            display: flex;
        }
        .main-content {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-template-rows: repeat(2, 1fr);
            flex-grow: 1;
            gap: 20px; /* Adjusted to give more space between cards */
            padding: 20px;
            align-items: start; /* Aligns items at the start of each cell */
            justify-content: center; /* Centers the grid within the main content area */
        }

        .card {
            display: flex;
            justify-content: center; /* Center content horizontally */
            align-items: center; /* Center content vertically */
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 10px; /* Rounded corners */
            transition: box-shadow 0.3s; /* Smooth transition for shadow effects */
            width: 100%; /* Card takes up 100% of the grid cell's width */
            height: 50%; /* Card takes up 100% of the grid cell's height */
        }

        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }
        card-text{
            text-align: center; /* Ensures text is centered within the card-text element */
            font-size: 20px; /* Larger font size for visibility */

        }



    </style>
        </head>

<body>

<div class="main-content">
    <a href="Updateu_personaldetails.jsp" style="text-decoration: none; color: inherit;">
    <div class="card">
        <div class="card-text">Personal Information</div></div></a>
    <a href="UpdateAddDetails.jsp" style="text-decoration: none; color: inherit;">
    <div class="card">
        <div class="card-text">QualificationDetails</div></div></a>
    <a href="UpdateFamilyDeatils.jsp" style="text-decoration: none; color: inherit;">
    <div class="card">
        <div class="card-text">Family Details</div></div></a>
    <a href="Updateinterest.jsp" style="text-decoration: none; color: inherit;">
    <div class="card">
        <div class="card-text">Intereste Details</div></div></a>
    <a href="updateInterestedIN.jsp" style="text-decoration: none; color: inherit;">
        <div class="card">
            <div class="card-text">Interested In</div></div></a>

    <a href="UpdateInterestedINQual.jsp" style="text-decoration: none; color: inherit;">
        <div class="card">
            <div class="card-text">Interested In Qual</div></div></a>
    <a href="UpdateInterestedINFam.jsp" style="text-decoration: none; color: inherit;">
        <div class="card">
            <div class="card-text">Interested In Fam</div></div></a>


</div>

</body>
</html>
