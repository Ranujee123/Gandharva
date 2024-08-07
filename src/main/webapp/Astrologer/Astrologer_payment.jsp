<%@ page import="com.user.model.astrologer.AllUser" %>
<%@ page import="java.util.Base64" %>
<%--
  Created by IntelliJ IDEA.
  User: Binali Ukwatte
  Date: 31-01-2024
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <link rel="stylesheet" href="Astrologer/styles.css">
    <title>Payment</title>

</head>
<body>
<div class="sidebar">
    <a href="astrologer">
        <div class="logo">
            <img src="images/logo.png" alt="Logo">
        </div>
    </a>
    <ul class="menu">
        <li>
            <a href="astrologer">
                <i class="menu-icon fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <li>
            <a href="astrologerProfile">
                <i class="menu-icon fas fa-user"></i>
                <span>Profile </span>
            </a>
        </li>
        <li>
            <a href="request">
                <i class="menu-icon fas fa-hourglass-half"></i>
                <span>User Requests</span>
            </a>
        </li>
        <li>
            <a href="astrologerSchedule">
                <i class="menu-icon fas fa-calendar"></i>
                <span>Schedule</span>
            </a>
        </li>
        <li class="active">
            <a href="astrologerPayment">
                <i class="menu-icon fas fa-credit-card"></i>
                <span>Payment</span>
            </a>
        </li>
        <li>
            <a href="astrologerSettings">
                <i class="menu-icon fas fa-cog"></i>
                <span>Settings</span>
            </a>
        </li>
        <li class="logout">
            <a href="astrologerLogout">
                <i class="menu-icon fas fa-sign-out-alt"></i>
                <span>logout</span>
            </a>
        </li>


    </ul>

</div>

<div class="main--content">
        <%
        String base64Image = null;
        if (session.getAttribute("id") == null) {
            response.sendRedirect("login");
        } else {
            AllUser astrologer = (AllUser) session.getAttribute("astrologer");
            byte[] blobData = astrologer.getUserImage();
            base64Image = Base64.getEncoder().encodeToString(blobData);
        }
    %>
    <div class="header--wrapper">
        <div class="header--title">
            <span> Payment</span>
            <h2>History</h2>

        </div>
        <div class="user--info">
            <%--            <div class="search--box">--%>
            <%--                <i class="menu-icon fas fa-search"></i>--%>

            <%--                <input type="text" placeholder="Search">--%>
            <%--            </div>--%>
            <a href="astrologerProfile">
                <img src="data:image/png;base64, <%= base64Image %>" alt="User Image">
            </a>
        </div>

    </div>


    <div class="card--container">
        <%--        <h3 class="main--title">Today's Data</h3>--%>
        <span class="current--date" id="currentDate"> </span>

        <!-- JavaScript to get and display the current date -->
        <script>
            // Get the current date
            var currentDate = new Date();

            // Format the date as desired (e.g., "January 31, 2024")
            var options = { year: 'numeric', month: 'long', day: 'numeric' };
            var formattedDate = currentDate.toLocaleDateString('en-US', options);

            // Display the current date in the HTML element with id="currentDate"
            document.getElementById("currentDate").innerHTML = "As at " + formattedDate;
        </script>

        <br>
        <div class="card--wrapper">
            <div class="payment--request--card light-purple">
                <div class="card--header" id="card-header-value-status-total">
                    <i class="icon fas fa-credit-card dark-purple"></i>
                    <div class="payment--card--text" id="payment--card--text">

                    </div>

                </div>
            </div>


            <br>
            <div class="card--wrapper">
                <div class="payment--request--card light-green">
                    <div class="card--header" id="card-header-value-status-last-payment">
                        <i class="icon fas fa-calendar-check dark-green"></i>
                        <div class="text">
                            <div class="payment--card--text" id="payment--card--text-last">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="card--container">
        <div class="tabular--wrapper">
            <%--        <h3 class="main--title"> History for past 3 days </h3>--%>
            <div class="table--container">
                <table>
                    <thead>
                    <tr>
                        <th> Date</th>
                        <th> Time</th>
                        <th> Name of the customer</th>
                        <th> Amount</th>
                        <th> Statement</th>
                    </tr>
                    </thead>
                    <tbody id="payment-details-table">

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
<script src="Astrologer/js/astrologerPayment.js" defer></script>
</html>