<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-01-16
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="logoutbutton.jsp"/>
<c:import url="Final_Sidebar.jsp"/>



<%
    List<String>personalities = UserDBUtil.getAllpersonality();

%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="u_styles.css">
    <title>User Dashboard</title>
    <style>
        /* Inline CSS styling */
        body {
            margin: 0;
            display: flex;
            min-height: 100vh;
            background-color: #f0f0f0;
        }

        .container {
            display: flex;
            flex: 1;
        }



        .dropdown-content button {
            width: 100%;
            padding: 10px;
            text-align: left;
            background-color: transparent;
            border: none;
            color: #fff;
        }

        .main-content {
            flex: 1;
            padding: 20px;
            text-align: center;
            margin: auto;
            max-width: 600px;
        }

        .form-container input, .form-container textarea, .form-container select {
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
        .completion-bar {
            width: 100%;
            height: 20px;
            background-color: #ddd;
            margin-top: 20px;
        }

        .completion-fill {
            height: 100%;
            background-color: #4CAF50;
        }

        .completion-text {
            margin-top: 10px;
        }


        .error {
            color: red;
            margin-bottom: 10px;
        }
        .form-container .button {
            background-color: #4CAF50; /* Green background */
            color: white; /* White text */
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
            border: none;
        }

    </style>
</head>
<body>

<div class="container">



    <div class="main-content">
        <h1>Interest</h1>
        <div class="form-container">
            <form action="interest" method="post">
                <label>Enter your interests & hobbies:</label>
                <input type="text" name="interest" required><br>



                <label>Enter your personality type:</label>
                <select name="personalitytype" >
                    <option value=""></option>
                    <option value="ENTJ">ENTJ </option>
                    <option value="INFP">INFP</option>
                    <option value="ENFJ">ENFJ</option>
                    <option value="ESFP">ESFP</option>
                    <option value="ISFP">ISFP</option>
                    <option value="ENTP">ENTP</option>
                    <option value="INTJ">INTJ</option>
                    <option value="ENFP">ENFP</option>
                    <option value="ESTJ">ESTJ</option>
                    <option value="ISTJ">ISTJ</option>
                    <option value="INFJ">INFJ</option>
                    <option value="INTP">INTP </option>
                    <option value="ESFJ">ESFJ</option>
                    <option value="ESTP">ESTP</option>
                    <option value="ISTP">ISTP</option>
                    <option value="ISFJ">ISFJ</option>

                </select>


                <label>You want to find it out? : <a href="https://www.16personalities.com/free-personality-test" target="_blank">Click here</a></label>


                <div class="completion-bar">
                    <div class="completion-fill" style="width: 57%;"></div> <!-- Adjust the width based on completion -->
                </div>
                <p class="completion-text">4 out of 7 steps left to complete your profile</p>

                <!-- Proceed button -->
                <button type="submit" name="action" value="proceed" class="form-container button">Save & Next</button>

                <!-- Save Progress button -->
                <a href="u_myprofile.jsp" class="form-container button">Back to Profile</a>
            </form>

        </div>
    </div>
</div>

</div>

</body>
</html>