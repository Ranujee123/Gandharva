<style>
    .left-bar {
        width: 20%;
        display: flex;
        flex-direction: column;
        gap: 50px;
        justify-content: center;
        align-items: center;
        background-color: #000000;
        color: #ffffff;
    }

    .left-bar img {
        width: 150px;
        height: auto;
    }

    .left-bar .user-links ul li,
    .left-bar .general-links ul li {
        display: flex;
        align-items: center;
        gap: 20px;
    }

    .left-bar .user-links ul li img,
    .left-bar .general-links ul li img {
        width: 30px;
    }

    .left-bar .user-links ul,
    .left-bar .general-links ul {
        display: flex;
        flex-direction: column;
        gap: 25px;
    }

    .left-bar ul li a {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 15px;
        color: #ffffff;
        text-decoration: none;
    }
</style>
<div class="left-bar">
    <img src="../images/user.png" alt="user-logo"/>
    <h1>${sessionScope.firstName} ${sessionScope.lastName}</h1>
    <div class="user-links">
        <ul>
            <li>
                <a href="EventPlannerDashboard.jsp"
                ><img src="../images/user-pic.png" alt=""/>My Profile</a
                >
            </li>
            <li>
                <a href="EventPackages.jsp"
                ><img src="../images/packages.png" alt=""/>Packages</a
                >
            </li>
            <li>
                <a href="EventReservations.jsp"
                ><img src="../images/reservations.png" alt=""/>Reservations</a
                >
            </li>
        </ul>
    </div>
    <div class="general-links">
        <ul>
            <li>
                <a href="EventPlannerNotifications.jsp"
                ><img src="../images/notifications.png" alt=""/>Notifications</a
                >
            </li>
            <li>
                <a href="EventPlannerSettings.jsp"><img src="../images/settings.png" alt=""/>Settings</a>
            </li>
<%--            <li>--%>
<%--                <a href=""--%>
<%--                ><img src="../images/sign-out-icon.png" alt=""/>Log out</a--%>
<%--                >--%>
<%--            </li>--%>
        </ul>
    </div>
</div>
