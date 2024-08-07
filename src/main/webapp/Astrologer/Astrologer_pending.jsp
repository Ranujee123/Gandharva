<%@ page import="com.user.model.astrologer.AllUser" %>
<%@ page import="java.util.Base64" %><%--
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
    <title>User Requests</title>
</head>
<body>
<div class="sidebar">
    <a href="astrologer">
        <div class="logo">
            <img src="images/logo.png">
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
                <span>Profile</span>
            </a>
        </li>
        <li class="active">
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
        <li>
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
                <span>Logout</span>
            </a>
        </li>
    </ul>
</div>

<div class="main--content">
    <%
        String base64Image = null;
        if (session.getAttribute("id") == null) {
            // If session does not exist, redirect to login page
            response.sendRedirect("login");
        } else {
            AllUser astrologer = (AllUser) session.getAttribute("astrologer");
            byte[] blobData = astrologer.getUserImage();

            // Encode byte array to Base64
            base64Image = Base64.getEncoder().encodeToString(blobData);
        }

    %>
    <div class="header--wrapper">
        <div class="header--title">
            <span>User</span>
            <h2>Requests</h2>
        </div>
        <div class="user--info">
            <div class="search--box">
                <i class="menu-icon fas fa-search"></i>
                <input type="text" placeholder="Search">
            </div>
            <a href="astrologerProfile">
                <img src="data:image/png;base64, <%= base64Image != null ? base64Image : "" %>" alt="User Image">
            </a>
        </div>
    </div>

    <div class="card--container">
        <div class="user-status-filter-container">
            <div class="user-status-filter-container-date">
                <span class="current--date" id="currentDate"></span>
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
            </div>
            <div class="user-status-filter-container-right">
                <label for="statusFilterPending" class="user-status-filter-label">Filter by Status:</label>
                <select id="statusFilterPending" class="user-status-filter">
                    <option value="">All</option>
                    <option value="NEW">New</option>
                    <option value="PAYMENT_PENDING">Payment Pending</option>
                    <option value="PENDING">Pending</option>
                    <option value="DONE">Done</option>
                </select>
            </div>
        </div>

        <div class="tabular--wrapper--user--request">
            <div class="pending--table">
                <div id="pagination" class="user-request-table-pagination"></div>
                <table class="user-request-table" id="user-request-table-pending-id">
                    <thead>
                    <tr>
                        <th style="text-align: center;">Start Date</th>
                        <th style="text-align: center;">Customer Name</th>
                        <th style="text-align: center;">User Type</th>
                        <th style="text-align: center;">Download Horoscope</th>
                        <th style="text-align: center;">Deadline</th>
                        <th style="text-align: center;">Status</th>
                        <th style="text-align: center;">Feedbacks for the users</th>
                        <th style="text-align: center;">Comments</th>
                    </tr>
                    </thead>
                    <tbody id="user-request-table-pending">

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
<script type="text/javascript" src="https://www.payhere.lk/lib/payhere.js" defer></script>
<script src="Astrologer/js/astrologerPending.js" defer></script>
</html>
