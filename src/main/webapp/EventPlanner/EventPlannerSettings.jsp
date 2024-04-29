<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/28/2024
  Time: 7:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Settings</title>
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
        padding: 10px;
    }

    .menuBox{
        background: #ECE8E1;
        padding: 40px;
        display: flex;
        flex-direction: column;
        gap: 20px;
        width: 750px;
        align-items: center;
    }

    .edit-btn{
        padding: 10px;
        background: #D9D9D9;
        font-size: 16px;
        font-weight: bold;
        width: 50%;
    }

    .delete-btn{
        padding: 10px;
        background: red;
        font-size: 16px;
        font-weight: bold;
        color: #fff;
        width: 50%;
    }

</style>
<body>
<jsp:include page="NavBarBack.jsp"/>
<div class="content">
    <jsp:include page="EventSideMenu.jsp"/>
    <div class="right-content">
        <div class="menuBox">
            <h2>Settings</h2>
            <button class="edit-btn" onclick="window.location.href='EventPlannerProfileEdit.jsp'">Edit Profile</button>
            <button class="delete-btn">Delete Profile</button>
        </div>
    </div>
</div>
</body>
</html>
