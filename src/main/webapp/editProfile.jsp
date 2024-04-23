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
        <form action="updateu" method="post" enctype="multipart/form-data" id="save">
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
                <option value="">Select Province</option>
                <option value="Ampara" <%= "Ampara".equals(user.getProvince()) ? "selected" : "" %>>Ampara</option>
                <option value="Anuradhapura" <%= "Anuradhapura".equals(user.getProvince()) ? "selected" : "" %>>Anuradhapura</option>
                <option value="Badulla" <%= "Badulla".equals(user.getProvince()) ? "selected" : "" %>>Badulla</option>
                <option value="Batticaloa" <%= "Batticaloa".equals(user.getProvince()) ? "selected" : "" %>>Batticaloa</option>
                <option value="Colombo" <%= "Colombo".equals(user.getProvince()) ? "selected" : "" %>>Colombo</option>
                <option value="Galle" <%= "Galle".equals(user.getProvince()) ? "selected" : "" %>>Galle</option>
                <option value="Gampaha" <%= "Gampaha".equals(user.getProvince()) ? "selected" : "" %>>Gampaha</option>
                <option value="Hambantota" <%= "Hambantota".equals(user.getProvince()) ? "selected" : "" %>>Hambantota</option>
                <option value="Jaffna" <%= "Jaffna".equals(user.getProvince()) ? "selected" : "" %>>Jaffna</option>
                <option value="Kalutara" <%= "Kalutara".equals(user.getProvince()) ? "selected" : "" %>>Kalutara</option>
                <option value="Kandy" <%= "Kandy".equals(user.getProvince()) ? "selected" : "" %>>Kandy</option>
                <option value="Kegalle" <%= "Kegalle".equals(user.getProvince()) ? "selected" : "" %>>Kegalle</option>
                <option value="Kilinochchi" <%= "Kilinochchi".equals(user.getProvince()) ? "selected" : "" %>>Kilinochchi</option>
                <option value="Kurunegala" <%= "Kurunegala".equals(user.getProvince()) ? "selected" : "" %>>Kurunegala</option>
                <option value="Mannar" <%= "Mannar".equals(user.getProvince()) ? "selected" : "" %>>Mannar</option>
                <option value="Matale" <%= "Matale".equals(user.getProvince()) ? "selected" : "" %>>Matale</option>
                <option value="Matara" <%= "Matara".equals(user.getProvince()) ? "selected" : "" %>>Matara</option>
                <option value="Monaragala" <%= "Monaragala".equals(user.getProvince()) ? "selected" : "" %>>Monaragala</option>
                <option value="Mullaitivu" <%= "Mullaitivu".equals(user.getProvince()) ? "selected" : "" %>>Mullaitivu</option>
                <option value="Nuwara Eliya" <%= "Nuwara Eliya".equals(user.getProvince()) ? "selected" : "" %>>Nuwara Eliya</option>
                <option value="Polonnaruwa" <%= "Polonnaruwa".equals(user.getProvince()) ? "selected" : "" %>>Polonnaruwa</option>
                <option value="Puttalam" <%= "Puttalam".equals(user.getProvince()) ? "selected" : "" %>>Puttalam</option>
                <option value="Ratnapura" <%= "Ratnapura".equals(user.getProvince()) ? "selected" : "" %>>Ratnapura</option>
                <option value="Trincomalee" <%= "Trincomalee".equals(user.getProvince()) ? "selected" : "" %>>Trincomalee</option>
                <option value="Vavuniya" <%= "Vavuniya".equals(user.getProvince()) ? "selected" : "" %>>Vavuniya</option>
            </select><br>
            <br>

            <br>
            <label>About Me:</label>
            <textarea id="aboutMe" name="aboutMe"></textarea>




            <button type="button" class="connect-button" onclick="Saveprofile()">Save</button>
        </form>

        <% } %>
    </div>
</div>


</body>
</html>
