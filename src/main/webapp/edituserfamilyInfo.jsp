<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-25
  Time: 10:22
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

    String userEmail = (String) session.getAttribute("userEmail");
    User user = null;
    if (userEmail != null) {
        List<User> getUserInfo = UserDBUtil.getUserfamInfo(UserDBUtil.getUserIdByEmail(userEmail));
        if (getUserInfo != null && !getUserInfo.isEmpty()) {
            user = getUserInfo.get(0);
        }
    }

%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" type="text/css" href="u_styles.css">
    <link rel="style" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


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

        .connect-button, .reject-button {
            flex: 1; /* Each button takes equal space */
            margin: 0 5px; /* Margin for spacing between the buttons */
            padding: 10px;
            border-radius: 30px;
            color: white;
            cursor: pointer;
            outline: none;
            font-weight: bold;
            background-color: #4CAF50; /* Green color for connect */
        }


    </style>

    <script src="js/nic-utils.js"></script>
    <script src="js/Status.js"></script>
</head>
<body>







<div class="main-content">
    <h1>Edit Profile</h1>
    <div class="form-container">
        <div class="error" id="password-error"></div>

        <% if (user != null) { %>
        <form action="updateuserfamInfo" method="post" enctype="multipart/form-data" id="save">

            <br>

            <!-- <label>Ethnicity:</label>
            <select name="ethnicity" required>
                <option value="">Select Ethnicity</option>
                <option value="sinhalese" <%= "sinhalese".equals(user.getEthnicity()) ? "selected" : "" %>>Sinhalese</option>
                <option value="tamil" <%= "tamil".equals(user.getEthnicity()) ? "selected" : "" %>>Tamil</option>
                <option value="muslim" <%= "muslim".equals(user.getEthnicity()) ? "selected" : "" %>>Muslim</option>
                <option value="burger" <%= "burger".equals(user.getEthnicity()) ? "selected" : "" %>>Burger</option>
                <option value="other" <%= "other".equals(user.getEthnicity()) ? "selected" : "" %>>Other</option>
            </select>-->
            <br>
            <label>Father's Religion:</label>
            <input type="text" name="freli" value="<%= user.getFreli() %>" >
            <label>Mother's Religion::</label>
            <input type="text" name="religion" value="<%= user.getMreli() %>" >
            <label>Father's Occupation:</label>
            <input type="text" name="fatherOccupation" value="<%= user.getFoccu() %>" >
            <label>Mother's Occupation:</label>
            <input type="text" name="motherOccupation" value="<%= user.getMoccup() %>" >
            <label>Marital Status of Parents:</label>
            <input type="text" name="maritalStatus" value="<%= user.getMaritalstatus() %>" >
            <label>Number of Siblings:</label>
            <input type="number" name="numberOfSiblings" value="<%= user.getSiblings() %>" >



            <button type="button" class="connect-button" onclick="Saveprofile()">Save</button>
        </form>

        <% } %>
    </div>
</div>


</body>
</html>
