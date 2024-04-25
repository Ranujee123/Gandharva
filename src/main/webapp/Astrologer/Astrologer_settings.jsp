<%@ page import="java.util.Base64" %>
<%@ page import="org.gandharva.gandharva.model.AllUser" %><%--
  Created by IntelliJ IDEA.
  User: Binali Ukwatte
  Date: 01-02-2024
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="css/astrologerSettings.css">
    <title>Settings </title>


</head>
<body>
<div class="sidebar">
    <div class="logo">
        <img src="images/logo.png" alt="Logo">
    </div>
    <ul class="menu">
        <li>
            <a href="astrologer">
                <i class="menu-icon fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <li>
            <a href="Astrologer_profile.jsp">
                <i class="menu-icon fas fa-user"></i>
                <span>Profile</span>
            </a>
        </li>
        <li>
            <a href="Astrologer_pending.jsp">
                <i class="menu-icon fas fa-hourglass-half"></i>
                <span>User Requests</span>
            </a>
        </li>
        <li>
            <a href="Astrologer_reservations.jsp">
                <i class="menu-icon fas fa-bookmark"></i>
                <span>Reservations</span>
            </a>
        </li>
        <li>
            <a href="Astrologer_schedule.jsp">
                <i class="menu-icon fas fa-calendar"></i>
                <span>Schedule</span>
            </a>
        </li>
        <li>
            <a href="Astrologer_payment.jsp">
                <i class="menu-icon fas fa-credit-card"></i>
                <span>Payment</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="menu-icon fas fa-bell"></i>
                <span>Notifications</span>
            </a>
        </li>
        <li class="active">
            <a href="Astrologer_settings.jsp">
                <i class="menu-icon fas fa-cog"></i>
                <span>Settings</span>
            </a>
        </li>
        <li class="logout">
            <a href="Astrologer_logout.jsp">
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
            <span> Account</span>
            <h2>Settings</h2>

        </div>
        <div class="user--info">
            <div class="search--box">
                <i class="menu-icon fas fa-search"></i>

                <label>
                    <input type="text" placeholder="Search">
                </label>
            </div>

            <a href="Astrologer_profile.jsp">
                <img src="data:image/png;base64, <%= base64Image %>" alt="User Image">
            </a>

        </div>

    </div>

    <div class="container">
        <h1>Settings</h1>
        <form id="change-password-form" onsubmit="updatePassword(event)">
            <h2>Change Password</h2>
            <div class="form-group">
                <label for="current-password">Current Password</label>
                <input type="password" id="current-password" name="current-password" required>
            </div>
            <div class="form-group">
                <label for="new-password">New Password</label>
                <input type="password" id="new-password" name="new-password" required>
            </div>
            <div class="form-group">
                <label for="confirm-password">Confirm Password</label>
                <input type="password" id="confirm-password" name="confirm-password" required>
            </div>
            <%
                AllUser astrologer = (AllUser) request.getSession().getAttribute("astrologer");
                String password = (astrologer != null) ? astrologer.getPassword() : "";
            %>
            <input type="hidden" id="astrologerPassword" value="<%= password %>">
            <button type="submit">Change Password</button>
        </form>
        <form id="deactivate-account-form" onsubmit="deactivateAccount(event)">
            <h2>Deactivate Account</h2>
            <p>Are you sure you want to deactivate your account? This action cannot be undone.</p>
            <button type="submit">Deactivate Account</button>
        </form>
        <div class="header--wrapper">
            <div class="settings--buttons">
                <div class="contact-info">
                    <i class="fas fa-phone-alt contact-icon"></i>
                    <div class="contact-text">
                        <span class="contact-title">Contact the administrator for inquiries:</span>
                        <a href="tel:+94123456789" class="contact-number">+94 123456789</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jsSHA/2.14.0/sha256.js" defer></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jsSHA/3.3.1/sha256.min.js"
        integrity="sha512-qw5xqZrce8QejL/YnoVvHaXggvfJK3bP2rczgxPSL+JhACfJhOU6gG+/c1LFyRxIpwaF8pZlfwUXLIK+5EEiKA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" defer></script>
<script src="js/astrologerSettings.js" defer></script>
</html>

