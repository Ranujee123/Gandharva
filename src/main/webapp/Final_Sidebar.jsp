<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-20
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <style>
    *{
      margin: 0;
      padding: 0;
      border: none;
      outline: none;
      box-sizing: border-box ;
      font-family: "Poppins", sans-serif;

    }


    body{
      display: flex;
    }

    .sidebar{
      position: sticky;
      top: 0;
      left: 0;
      bottom: 0;
      width: 110px;
      height: 100vh;
      padding: 0 1.7rem;
      color: whitesmoke;
      overflow: hidden;
      transition: width 0.5s linear;
      background: #24333E;

    }

    .sidebar:hover{
      width: 300px;
      transition: 0.5s;
    }

    .logo{
      display: flex;
      flex-direction: row;
      margin-top: 5px;
      margin-left: -8px;
      width: 10px; !important;/* Adjust width as needed */
      height: 80px; !important;/* Adjust height as needed */

    }


    .menu{
      height: 88%;
      position: relative;
      list-style: none;
      padding: 0;

    }
    .menu li{
      padding: 1rem;
      margin: 8px 0;
      border-radius: 8px;
      transition: all 0.3s ease-in-out;

    }

    .menu li:hover{
      background: lightblue;
      color: black;
    }

    .menu .active{
      color: #070707;

    }
    .menu a{
      color: white;
      text-decoration: none;
      font-size: 14px;
      display: flex;
      align-items: center;
      gap: 1.5rem;
    }

    .menu a:hover{
      color: black;
    }

    .menu a span{
      overflow: hidden;
    }
    .menu a i {
      font-size: 1.2rem;
    }
    .logout{
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100%;

    }
  </style>
</head>
<body>
<div class="sidebar">
  <div class="logo">
    <img src="images/logo.png">
  </div>
  <ul class="menu">
    <li class="active">
      <a href="u_myprofile.jsp" >
        <i class="menu-icon fas fa-tachometer-alt"></i>
        <span>Dashboard</span>
      </a>
    </li>
    <li>
      <a href="u_dashboard.jsp">
        <i class="fa-solid fa-magnifying-glass"></i>
        <span>Search</span>
      </a>
    </li>
    <li>
      <a href="findMatches">
        <i class="fa-solid fa-user-group"></i>
        <span>Matched Profiles</span>
      </a>
    </li>

    <li>
      <a href="userSelectEdit.jsp">
        <i class="menu-icon fas fa-user"></i>
        <span>Profile</span>
      </a>
    </li>

    <li>
      <a href="fetchConnection">
        <i class="fa-solid fa-hand"></i>
        <span>Pending Connections</span>
      </a>
    </li>
    <li>
      <a href="GetAcceptedRequests">
        <i class="fa-solid fa-handshake"></i>
        <span>Connected Profiles</span>
      </a>
    </li>

    <li>
      <a href="AstrologyService">
        <i class="menu-icon fas fa-bookmark"></i>
        <span>Astrology Service</span>
      </a>
    </li>
    <li>
      <a href="EventPlannerService">
        <i class="menu-icon fas fa-calendar"></i>
        <span>Event Planing Service</span>
      </a>
    </li>
<%--    <li>
      <a href="pricing.jsp">
        <i class="menu-icon fas fa-credit-card"></i>
        <span>Change Plane</span>
      </a>
    </li>--%>




    <li class="logout">
      <a href="login">
        <i class="menu-icon fas fa-sign-out-alt"></i>
        <span>logout</span>
      </a>
    </li>


  </ul>

</div>
</body>
</html>