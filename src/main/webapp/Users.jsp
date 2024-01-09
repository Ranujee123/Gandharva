<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Users</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: black;
            height: 120px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
            margin-left: 20px;
        }

        .logo img {
            height: 120px;
            width: 100px;
        }

        .logout {
            margin-right: 20px;
            color: gold;
        }

        .profile {
            background-color: black;
            width: 150px;
            padding: 20px;
            color: white;
            text-align: center;
        }

        .profile img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .menu {
            background-color: black;
            color: white;
            display: flex;
            flex-direction: column;
            padding: 20px;
            width: 150px;
            height:1400px;

        }

        .menu a {
            text-decoration: none;
            color: white;
            padding: 10px 0;
        }
        .menu-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px; /* Add margin between menu items */
        }

        .menu a:hover {
            text-decoration: underline;
        }
        .menu-icon {
            font-size: 20px;
            margin-right: 10px;
        }
        .selected {

            width:250px;
            background-color: rgba(255, 255, 255, 0.2);
        }


        .cards {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-left: 650px;
            margin-top: -700px;
        }

        .center-card {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Vertical centering */
        }
        .card {
            width: calc(34% - 20px); /* Adjust width as needed with margin for spacing */
            background-color: #24333E;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            color: white;
            margin-bottom: 20px;
        }

        .card-content {
            text-align: center;
        }

        .card-button {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #24333E;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
        }

        .card-button i {
            margin-right: 5px;
        }
        a{
            text-decoration: none;
            color: white;
        }
        a:hover{
            text-decoration: underline;
        }

    </style>
</head>
<body>
<div class="navbar">
    <div class="logo">
        <img src="images/logomain.png" alt="Logo">
    </div>
    <div class="logout">

        <a href="Admin_logout.jsp">
            <i class="menu-icon fas fa-sign-out-alt"></i>
            Logout</a>
    </div>
</div>
<div><div>
<div class="profile">
    <img src="images/pp.png" alt="Profile Picture">
    <div>Admin</div>
</div>

<div class="menu">
    <div class="menu-item">
        <i class="menu-icon fas fa-user"></i>
        <a href="Admin_dashboard1.jsp">Dashboard</a>
    </div>
    <div class="menu-item selected">
        <i class="menu-icon fas fa-clock"></i>
        <a href="Users.jsp">Users</a>
        </div>

    <div class="menu-item">
        <i class="menu-icon fas fa-bookmark"></i>
        <a href="serviceproviders.jsp">Service Providers</a>
    </div>
    <div class="menu-item">
        <i class="fa-regular fa-file"></i>
        <a href="reports.jsp">Reports</a>
    </div>
    <div class="menu-item">
        <i class="menu-icon fas fa-bell"></i>
        <a href="#">Notifications</a>
    </div>
    <div class="menu-item">
        <i class="menu-icon fas fa-cog"></i>
        <a href="#">Settings</a>
    </div>
</div></div> <div>
<div class="center-card">

    <div class="content">
        <h2>Admin Dashboard</h2>
       
        <img src="images/userssample.png" alt="dashboardsample" width="100%" height="auto">
     </div>
</div>
</div>
</div>

</body>
</html>
