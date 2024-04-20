<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-11-01
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.user.model.User" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="logoutbutton.jsp"/>
<c:import url="Final_Sidebar.jsp"/>


<%

    List<String> province = UserDBUtil.getAllProvince();
%>
<%

    String userEmail = (String) session.getAttribute("userEmail");
    User user = null;
    String profileImagePath = UserDBUtil.getProfileImagePath(userEmail);
    if (userEmail != null) {
        List<User> userDetails = UserDBUtil.getUserDetails(userEmail);
        if (userDetails != null && !userDetails.isEmpty()) {
            user = userDetails.get(0);
        }
    }

%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" type="text/css" href="u_styles.css">
    <link rel="style" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        /* Inline CSS styling */
        .container {
            display: flex;
            flex: 1;
        }
        body {
            margin: 0;
            display: flex;
            min-height: 100vh;
            background-color: #f0f0f0;
        }


        .main-content {
            padding: 20px;
            max-width: 600px;
            text-align: center;
            margin: auto;
        }

        .form-container input, .form-container textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
        }

        .form-container button {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        .error {
            color: red;
            margin-bottom: 10px;
        }


        .dp .profile-img-container {
            position: relative;
            display: inline-block; /* Center the image container if needed */
        }

        .dp img.profile-image {
            width: 150px; /* Adjust size as needed */
            height: auto;
        }

        .dp .edit-icon {
            position: absolute;
            bottom: 10px;
            right: 10px;
            background: rgba(255, 255, 255, 0.8); /*White background with opacity for visibility */
            padding: 5px;
            border-radius: 50%;
            cursor: pointer;
        }

    </style>

    <script src="js/nic-utils.js"></script>
    <script src="js/saveProfile.js"></script>
</head>
<body>







<div class="main-content">
    <h1>Edit Profile</h1>
    <div class="form-container">
        <div class="error" id="password-error"></div>

        <% if (user != null) { %>
        <form action="updateu" method="post" enctype="multipart/form-data">
            <div class="dp">
                <div class="profile-img-container">
                    <img src="<%= profileImagePath %>" alt="Profile Image" class="profile-image">
                    <i class="fas fa-pencil-alt edit-icon" onclick="document.getElementById('dpphoto').click();"></i>


                </div>
                <input type="file" id="dpphoto" name="dpphoto" style="display: none;">

            </div>
            <label>Choose a file :</label>
            <br>

            <br>
            <label>First Name:</label>
            <input type="text" name="fname" value="<%= user.getFname() %>" >
            <label>Last Name:</label>
            <input type="text" name="lname" value="<%= user.getLname() %>" >
            <label>Email:</label>
            <input type="email" name="email" value="<%= user.getEmail() %>" >
            <label>NIC:</label>
            <input type="text" id="idNumber" name="idNumber" value="<%= user.getIdNumber() %>">


            <label>Province:</label>
            <select name="province" required>
                <option value=""></option>
                <% for (String pro : province) { %>
                <option value="<%= pro %>"
                        <%= (user.getProvinceName() != null && user.getProvinceName().equals(pro)) ? "selected" : "" %>>
                    <%= pro %>
                </option>
                <% } %>
            </select>

            <br>
            <label>About Me:</label>
            <textarea id="aboutMe" name="aboutMe"></textarea>




            <button type="submit" onclick="saveProfile()">Save</button>
        </form>

        <% } %>
    </div>
</div>


</body>
</html>
