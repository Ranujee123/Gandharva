<%@ page import="event.model.EventUser" %>
<%@ page import="event.service.EventUserImpl" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/28/2024
  Time: 9:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<style>
    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: "Poppins", sans-serif;
    }

    body {
        background-color: #fff;
        min-height: 100vh;
    }

    .content {
        display: flex;
        justify-content: center;
        flex-direction: column;
        align-items: center;
        margin-top: 30px;
    }

    .registration-form-wrapper {
        margin-top: 20px;
        width: 600px;
        background: #ECE8E1;
        padding: 20px;
        height: 50vh;
    }

    .form-item {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        margin: 5px 0;
    }

    .form-item input {
        color: #000000;
        padding: 10px;
        width: 50%;
    }

    .form-item textarea {
        color: #000000;
        padding: 10px;
        width: 50%;
    }

    .reg-btn {
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

</style>
<%
    String userEmail = (String) session.getAttribute("email");
    EventUser user = null;
    EventUserImpl eventUserImpl = new EventUserImpl();
    if (userEmail != null) {
            user = eventUserImpl.getUserByEmail(userEmail);
    }
%>
<body>
<jsp:include page="NavBarBack.jsp"/>
<div class="content">
    <h2>Edit Profile</h2>
    <div class="registration-form-wrapper">
        <% if (user != null) { %>
        <form id="event-planner-registration-form"  action="editProfile" method="post" class="registration-form">
            <div class="form-item">
                <label for="firstname">First Name</label>
                <input required type="text" name="firstName" id="firstname" value="<%= user.getFirstName() %>"/>
            </div>

            <div class="form-item">
                <label for="lastname">Last Name</label>
                <input required type="text" name="lastName" id="lastname" value="<%= user.getLastName() %>"/>
            </div>

            <div class="form-item">
                <label for="about">About Me</label>
                <textarea required  name="about" id="about"><%= user.getAboutMe() %></textarea>
            </div>
            <input name="id" hidden value="<%= user.getId() %>" />

            <button class="reg-btn" type="submit">Submit</button>
        </form>
        <% } %>
    </div>
</div>
</body>
</html>
