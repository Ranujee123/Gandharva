<%@ page import="event.service.EventNotificationImpl" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/25/2024
  Time: 3:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int total = 0;
    EventNotificationImpl eventNotification = new EventNotificationImpl();
    String id = (String) session.getAttribute("userId");
    try {
        total = eventNotification.getTotalEvents(id);
    } catch (Exception e) {
        throw new RuntimeException(e);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="profile.css"/>
    <title>User Profile</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<nav>
    <img src="../images/logo.png" alt="company-logo"
    />

    <div class="buttons">
        <a href="#" onclick="confirmLogout()"
        ><img src="../images/sign-out-icon.png" alt="" id="sign-out-icon"/>Log
            out
        </a
        >
    </div>
    <script>
        function confirmLogout() {
            Swal.fire({
                title: "Are you sure?",
                text: "You would be signed out!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes!"
            }).then((result) => {
                if (result.isConfirmed) {
                    fetch('${pageContext.request.contextPath}/EventPlanner/logout', {
                        method: 'POST'
                    })
                        .then(response => {
                            if(response.ok){
                                window.location.href = '${pageContext.request.contextPath}/login';
                            }
                        })
                        .catch(error => console.error('Error in logout', error));
                }
            });
        }
    </script>
</nav>

<div class="content">
    <jsp:include page="EventSideMenu.jsp"/>
<%--    <div class="left-bar">--%>
<%--        <img src="../images/user.png" alt="user-logo"/>--%>
<%--        <h1>${sessionScope.firstName} ${sessionScope.lastName}</h1>--%>
<%--        <div class="user-links">--%>
<%--            <ul>--%>
<%--                <li>--%>
<%--                    <a href="EventPlannerDashboard.jsp"--%>
<%--                    ><img src="../images/user-pic.png" alt=""/>My Profile</a--%>
<%--                    >--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="EventPackages.jsp"--%>
<%--                    ><img src="../images/packages.png" alt=""/>Packages</a--%>
<%--                    >--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="EventReservations.jsp"--%>
<%--                    ><img src="../images/reservations.png" alt=""/>Reservations</a--%>
<%--                    >--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--        <div class="general-links">--%>
<%--            <ul>--%>
<%--                <li>--%>
<%--                    <a href="EventPlannerNotifications.jsp"--%>
<%--                    ><img src="../images/notifications.png" alt=""/>Notifications</a--%>
<%--                    >--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="EventPlannerSettings.jsp"><img src="../images/settings.png" alt=""/>Settings</a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href=""--%>
<%--                    ><img src="../images/sign-out-icon.png" alt=""/>Log out</a--%>
<%--                    >--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="right-content">
        <div class="top">
            <div class="calendar-container">
                <header class="calendar-header">
                    <p class="calendar-current-date"></p>
                    <div class="calendar-navigation">
                <span id="calendar-prev">
                  <h3><</h3>
                </span>
                        <span id="calendar-next">
                  <h3>></h3>
                </span>
                    </div>
                </header>

                <div class="calendar-body">
                    <ul class="calendar-weekdays">
                        <li>Sun</li>
                        <li>Mon</li>
                        <li>Tue</li>
                        <li>Wed</li>
                        <li>Thu</li>
                        <li>Fri</li>
                        <li>Sat</li>
                    </ul>
                    <ul class="calendar-dates"></ul>
                </div>
            </div>
            <div class="stats">
                <div class="events">
                    <h2><%=total%></h2>
                    <h1>Events</h1>
                    <p>in the next 365 days</p>
                </div>
            </div>
        </div>

        <div class="bottom">
            <button><a href="EventPlannerNotifications.jsp">New Event Requests</a></button>
            <button><a href="EventReservations.jsp">Next Event</a></button>
            <button><a href="Partners.jsp">View Partners</a></button>
        </div>
    </div>
</div>

<script>
    let date = new Date();
    let year = date.getFullYear();
    let month = date.getMonth();

    const day = document.querySelector(".calendar-dates");

    const currdate = document.querySelector(".calendar-current-date");

    const prenexIcons = document.querySelectorAll(
        ".calendar-navigation span"
    );

    // Array of month names
    const months = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
    ];

    // Function to generate the calendar
    const manipulate = () => {
        // Get the first day of the month
        let dayone = new Date(year, month, 1).getDay();

        // Get the last date of the month
        let lastdate = new Date(year, month + 1, 0).getDate();

        // Get the day of the last date of the month
        let dayend = new Date(year, month, lastdate).getDay();

        // Get the last date of the previous month
        let monthlastdate = new Date(year, month, 0).getDate();

        // Variable to store the generated calendar HTML
        let lit = "";

        // Loop to add the last dates of the previous month
        for (let i = dayone; i > 0; i--) {
            lit += `<li class="inactive">${monthlastdate - i + 1}</li>`;
        }

        // Loop to add the dates of the current month
        for (let i = 1; i <= lastdate; i++) {
            // Check if the current date is today
            let isToday =
                i === date.getDate() &&
                month === new Date().getMonth() &&
                year === new Date().getFullYear()
                    ? "active"
                    : "";
            lit += `<li class="${isToday}">${i}</li>`;
        }

        // Loop to add the first dates of the next month
        for (let i = dayend; i < 6; i++) {
            lit += `<li class="inactive">${i - dayend + 1}</li>`;
        }

        // Update the text of the current date element
        // with the formatted current month and year
        currdate.innerText = `${months[month]} ${year}`;

        // update the HTML of the dates element
        // with the generated calendar
        day.innerHTML = lit;
    };

    manipulate();

    // Attach a click event listener to each icon
    prenexIcons.forEach((icon) => {
        // When an icon is clicked
        icon.addEventListener("click", () => {
            // Check if the icon is "calendar-prev"
            // or "calendar-next"
            month = icon.id === "calendar-prev" ? month - 1 : month + 1;

            // Check if the month is out of range
            if (month < 0 || month > 11) {
                // Set the date to the first day of the
                // month with the new year
                date = new Date(year, month, new Date().getDate());

                // Set the year to the new year
                year = date.getFullYear();

                // Set the month to the new month
                month = date.getMonth();
            } else {
                // Set the date to the current date
                date = new Date();
            }

            // Call the manipulate function to
            // update the calendar display
            manipulate();
        });
    });
</script>
</body>
</html>

