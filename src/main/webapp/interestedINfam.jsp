<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-01-22
  Time: 14:12
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


  <script>
    function showOtherInputFoccu() {
      console.log("Dropdown changed"); // Check if function is called
      var select = document.getElementById('foccu');
      var otherInput = document.getElementById('other_foccu');
      if (select.value === "Other") { // Ensure the comparison is correct
        otherInput.style.display = 'block';
      } else {
        otherInput.style.display = 'none';
      }
    }

    function showOtherInputMoccup() {
      console.log("Dropdown changed"); // Check if function is called
      var select = document.getElementById('moccup');
      var otherInput = document.getElementById('other_moccup');
      if (select.value === "Other") { // Ensure the comparison is correct
        otherInput.style.display = 'block';
      } else {
        otherInput.style.display = 'none';
      }
    }

  </script>

</head>
<body>

<div class="container">


  <div class="main-content">
    <h1>Who are you interested in ?</h1>
    <div class="form-container">
      <form action="interestinfam" method="post">

        <label>Father's Religion:</label>
        <select name="freli">
          <option value=""> </option>
          <option value="Atheists">Atheists</option>
          <option value="Buddhist">Buddhist</option>
          <option value="Catholic">Catholic</option>
          <option value="Christian">Christian</option>
          <option value="Hindu">Hindu</option>
          <option value="Islam">Islam</option>
          <option value="Other">Other</option>
        </select>



        <label>Mother's Religion:</label>
        <select name="mreli">
          <option value=""> </option>
          <option value="Atheists">Atheists</option>
          <option value="Buddhist">Buddhist</option>
          <option value="Catholic">Catholic</option>
          <option value="Christian">Christian</option>
          <option value="Hindu">Hindu</option>
          <option value="Islam">Islam</option>
          <option value="Other">Other</option>
        </select>

        <label>Father's Occupation:</label>
        <select name="foccu" id="foccu" onchange="showOtherInputFoccu()" required>
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
        <input type="text" name="other_foccu" id="other_foccu" style="display:none;" placeholder="Specify your father's occupation">
        <br>

        <label>Mother's Occupation:</label>
        <select name="moccup" id="moccup" onchange="showOtherInputMoccup()">
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
        <input type="text" name="other_moccup" id="other_moccup" style="display:none;" placeholder="Specify your mother's occupation">
        <br>


        <label>Marital Status of Parents:</label>
        <select name="maritalstatus">
          <option value=""></option>
          <option value="Married">Married</option>
          <option value="Widowed">Widowed</option>
          <option value="Divorced">Divorced</option>
          <option value="Seperated">Seperated</option>
          <option value="Other">Other</option>
        </select>

        <label>Number of Siblings:</label>
        <input type="number" name="siblings" min="0" required><br>




        <div class="completion-bar">
          <div class="completion-fill" style="width: 100%;"></div> <!-- Adjust the width based on completion -->
        </div>
        <p class="completion-text">1 out of 7 is completed</p>

        <button type="submit" name="action" value="proceed" class="form-container button">Submit</button>
      </form>
    </div>



    </form>
  </div>
</div>
</div>

</div>

</body>
</html>