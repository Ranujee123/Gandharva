<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="logoutbutton.jsp"/>
<c:import url="Final_Sidebar.jsp"/>


<%
    List<String> qualifications = UserDBUtil.getAllQualifications();
    List<String> occupations = UserDBUtil.getAllOccupations();
%>



<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-11-03
  Time: 01:58
  To change this template use File | Settings | File Templates.
--%>
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
    </style>



</head>
<body>

<div class="container">




    <div class="main-content">
        <h1>Qualifications</h1>
        <div class="form-container">
            <form action="qul" method="post">
                <label>School / College:</label>
                <input type="text" name="school" ><br>


                <label> Heighest Education Qualification:</label>
                <select name="qualification" required>
                    <option value=""></option>
                    <option value="phd">Phd or Post Doctoral </option>
                    <option value="msc">Master's Degree or Equivalent</option>
                    <option value="diploma">Post Graduate Diploma</option>
                    <option value="bachelor">Bachelor's Degree or Equivalent</option>
                    <option value="undergrad">Undergraduate</option>
                    <option value="proffqual">Professional Qualification</option>
                    <option value="diploma">Diploma</option>
                    <option value="al">Up to GCE A/L</option>
                    <option value="ol">Up to GCE O/L</option>
                    <option value="other">Other</option>

                </select><br>

                <label> Occupation :</label>
                <select name="occupation" required>
                    <option value=""></option>
                    <option value="Accountant">Accountant </option>
                    <option value="Architect">Architect</option>
                    <option value="Banker">Banker</option>
                    <option value="Business Owner">Business Owner</option>
                    <option value="Chef">Chef</option>
                    <option value="Doctor">Doctor</option>
                    <option value="Driver">Driver</option>
                    <option value="Engineer">Engineer</option>
                    <option value="Farmer">Farmer</option>
                    <option value="Governmet Service">Governmet Service</option>
                    <option value="Graphic Designer">Graphic Designer</option>
                    <option value="Hotelier">Hotelier </option>
                    <option value="House Wife">House Wife</option>
                    <option value="IT Professional">IT Professional</option>
                    <option value="Lawyer">Lawyer </option>
                    <option value="Lecturer">Lecturer</option>
                    <option value="Manager">Manager</option>
                    <option value="Medical Professional">Medical Professional</option>
                    <option value="Military">Military</option>
                    <option value="Not Employed">Not Employed</option>
                    <option value="Nurse"> Nurse</option>
                    <option value="Police Officer">Police Officer</option>
                    <option value="Quantity Surveyor">Quantity Surveyor</option>
                    <option value="Researcher">Researcher</option>
                    <option value="Sales Executive">Sales Executive</option>
                    <option value="Self Employed">Self Employed</option>
                    <option value="Surveyor">Surveyor</option>
                    <option value="Teacher">Teacher </option>
                    <option value="Technician">Technician</option>
                    <option value="Other">Other</option>

                </select><br>

                <!--<label>Occupation :</label>
                <select name="occupation" >
                    <option value=""></option>
                    <% for (String occupation : occupations) { %>
                    <option><%= occupation %></option>
                    <% } %>
                </select>-->

                <div class="completion-bar">
                    <div class="completion-fill" style="width: 28%;"></div> <!-- Adjust the width based on completion -->
                </div>
                <p class="completion-text">6 out of 7 steps left to complete your profile</p>




                <!-- Proceed button -->
                <button type="submit" name="action" value="proceed">Proceed</button>

                <!-- Save Progress button -->
                <button type="submit" formaction="ProfileCompletionServlet" name="action" value="save">Save Progress</button>
            </form>

        </div>
    </div>
</div>

</body>
</html>

