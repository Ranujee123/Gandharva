<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/28/2024
  Time: 7:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Notification</title>
</head>
<style>
    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }

    body {
        background-color: #000;
        min-height: 100vh;
    }

    .content {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 30px;
    }

    .right-content {
        width: 80%;
        min-height: 100vh;
        background-color: #fff;
    }

    .notification {
        padding: 12px;
        background-color: #cccccc;
        margin: 10px 20px;
    }

    .notificationData{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }
</style>
<body>
<jsp:include page="NavBarBack.jsp"/>
<div class="content">
    <jsp:include page="EventSideMenu.jsp"/>
    <div class="right-content">
        <div class="notification">
            <div class="notificationData">
                <h3>Testy Notification</h3>
                <a>View</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
