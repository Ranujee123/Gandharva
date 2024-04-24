<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-01-22
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%--
Created by IntelliJ IDEA.
User: ranu
Date: 2023-11-02
Time: 09:20
To change this template use File | Settings | File Templates.
--%>

<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%
  List<String> occupations = UserDBUtil.getAllOccupations();
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="logoutbutton.jsp"/>
<c:import url="Final_Sidebar.jsp"/>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <title>User Dashboard</title>
  <link rel="stylesheet" href="u_styles.css">
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
    <h1>Who are you interested in ?</h1>
    <div class="form-container">
      <form action="interestinfam" method="post">

        <label>Father's Religion:</label>
        <select name="fatherReligion">
          <option value=""> </option>
          <option value="buddhist">Buddhist</option>
          <option value="christain">Christian</option>
          <option value="hindu">Hindu</option>
          <option value="islam">Islam</option>
          <option value="agonistics">Agonistic</option>
          <option value="catholic">Catholic</option>
          <option value="none">None</option>
          <option value="other">Other</option>
        </select>



        <label>Mother's Religion:</label>
        <select name="motherReligion">
          <option value=""> </option>
          <option value="buddhist">Buddhist</option>
          <option value="christain">Christian</option>
          <option value="hindu">Hindu</option>
          <option value="islam">Islam</option>
          <option value="agonistics">Agonistic</option>
          <option value="catholic">Catholic</option>
          <option value="none">None</option>
          <option value="other">Other</option>
        </select>

        <label>Father's Occupation:</label>
        <select name="fatherOccupation" required>
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
        </select>

        <label>Mother's Occupation:</label>
        <select name="motherOccupation" >
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
        </select>


        <label>Marital Status of Parents:</label>
        <select name="maritalStatus">
          <option value=""></option>
          <option value="widowed">Widowed</option>
          <option value="divorced">Divorced</option>
          <option value="seperated">Seperated</option>
          <option value="other">Other</option>
        </select>

        <label>Number of Siblings:</label>
        <input type="number" name="numberOfSiblings" min="0" required><br>




        <div class="completion-bar">
          <div class="completion-fill" style="width: 100%;"></div> <!-- Adjust the width based on completion -->
        </div>
        <p class="completion-text">1 out of 7 is completed</p>

        <button type="submit" name="action" value="proceed">Submit</button>
      </form>
    </div>



    </form>
  </div>
</div>
</div>

</div>

</body>
</html>
