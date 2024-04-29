<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-28
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="logoutbutton.jsp"/>
<c:import url="Final_Sidebar.jsp"/>
<%@ page import="com.user.model.User" %>


<%
  List<String> qualifications = UserDBUtil.getAllQualifications();
  List<String> occupations = UserDBUtil.getAllOccupations();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

  String userEmail = (String) session.getAttribute("userEmail");
  User user = null;

  if (userEmail != null) {
    String id=UserDBUtil.getUserIdByEmail(userEmail);
    List<User> qualificationDetails = UserDBUtil.getQualificationDetails(id);
    if (qualificationDetails != null && !qualificationDetails.isEmpty()) {
      user = qualificationDetails.get(0);
    }
  }

%>


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


  <script>
    function showOtherInput() {
      console.log("Dropdown changed"); // Check if function is called
      var select = document.getElementById('occupation');
      var otherInput = document.getElementById('other_occupation');
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
    <h1>Qualifications</h1>
    <div class="form-container">
      <form action="upadtequal" method="post">
        <label>School / College:</label>
        <input type="text" name="school" value="<%= user != null ? user.getSchool() : "" %>" ><br>



        <label> Heighest Education Qualification:</label>
        <select name="qualification" required>
          <option value=""></option>
          <option value="Phd or Post Doctoral" <%= "Phd or Post Doctoral".equals(user.getQualification()) ? "selected" : "" %>>Phd or Post Doctoral </option>
          <option value="Master's Degree or Equivalent" <%= "Master's Degree or Equivalent".equals(user.getQualification()) ? "selected" : "" %>>Master's Degree or Equivalent</option>
          <option value="Post Graduate Diploma" <%= "Post Graduate Diploma".equals(user.getQualification()) ? "selected" : "" %>>Post Graduate Diploma</option>
          <option value="Bachelor's Degree or Equivalent" <%= "Bachelor's Degree or Equivalent".equals(user.getQualification()) ? "selected" : "" %>>Bachelor's Degree or Equivalent</option>
          <option value="Undergraduate" <%= "Undergraduate".equals(user.getQualification()) ? "selected" : "" %>>Undergraduate</option>
          <option value="Professional Qualification" <%= "Professional Qualification".equals(user.getQualification()) ? "selected" : "" %>>Professional Qualification</option>
          <option value="Diploma" <%= "Diploma".equals(user.getQualification()) ? "selected" : "" %>>Diploma</option>
          <option value="Up to GCE A/L" <%= "Up to GCE A/L".equals(user.getQualification()) ? "selected" : "" %>>Up to GCE A/L</option>
          <option value="Up to GCE O/L" <%= "Up to GCE O/L".equals(user.getQualification()) ? "selected" : "" %>>Up to GCE O/L</option>
          <option value="Other" <%= "Other".equals(user.getQualification()) ? "selected" : "" %>>Other</option>

        </select><br>

        <label> Occupation :</label>
        <select name="occupation" id="occupation" onchange="showOtherInput()" required>
          <option value=""></option>
          <option value="Accountant" <%= "Accountant".equals(user.getOccupation()) ? "selected" : "" %>>Accountant </option>
          <option value="Architect" <%= "Architect".equals(user.getOccupation()) ? "selected" : "" %>>Architect</option>
          <option value="Banker" <%= "Banker".equals(user.getOccupation()) ? "selected" : "" %>>Banker</option>
          <option value="Business Owner" <%= "Business Owner".equals(user.getOccupation()) ? "selected" : "" %>>Business Owner</option>
          <option value="Chef" <%= "Chef".equals(user.getOccupation()) ? "selected" : "" %>>Chef</option>
          <option value="Doctor" <%= "Doctor".equals(user.getOccupation()) ? "selected" : "" %>>Doctor</option>
          <option value="Driver" <%= "Driver".equals(user.getOccupation()) ? "selected" : "" %>>Driver</option>
          <option value="Engineer" <%= "Engineer".equals(user.getOccupation()) ? "selected" : "" %>>Engineer</option>
          <option value="Farmer" <%= "Farmer".equals(user.getOccupation()) ? "selected" : "" %>>Farmer</option>
          <option value="Governmet Service" <%= "Governmet Service".equals(user.getOccupation()) ? "selected" : "" %>>Governmet Service</option>
          <option value="Graphic Designer" <%= "Graphic Designer".equals(user.getOccupation()) ? "selected" : "" %>>Graphic Designer</option>
          <option value="Hotelier" <%= "Hotelier".equals(user.getOccupation()) ? "selected" : "" %>>Hotelier </option>
          <option value="House Wife" <%= "House Wife".equals(user.getOccupation()) ? "selected" : "" %>>House Wife</option>
          <option value="IT Professional" <%= "IT Professional".equals(user.getOccupation()) ? "selected" : "" %>>IT Professional</option>
          <option value="Lawyer" <%= "Lawyer".equals(user.getOccupation()) ? "selected" : "" %>>Lawyer </option>
          <option value="Lecturer" <%= "Lecturer".equals(user.getOccupation()) ? "selected" : "" %>>Lecturer</option>
          <option value="Manager" <%= "Manager".equals(user.getOccupation()) ? "selected" : "" %>>Manager</option>
          <option value="Medical Professional" <%= "Medical Professional".equals(user.getOccupation()) ? "selected" : "" %>>Medical Professional</option>
          <option value="Military" <%= "Military".equals(user.getOccupation()) ? "selected" : "" %>>Military</option>
          <option value="Not Employed" <%= "Not Employed".equals(user.getOccupation()) ? "selected" : "" %>>Not Employed</option>
          <option value="Nurse" <%= "Nurse".equals(user.getOccupation()) ? "selected" : "" %>> Nurse</option>
          <option value="Police Officer" <%= "Police Officer".equals(user.getOccupation()) ? "selected" : "" %>>Police Officer</option>
          <option value="Quantity Surveyor" <%= "Quantity Surveyor".equals(user.getOccupation()) ? "selected" : "" %>>Quantity Surveyor</option>
          <option value="Researcher" <%= "Researcher".equals(user.getOccupation()) ? "selected" : "" %>>Researcher</option>
          <option value="Sales Executive" <%= "Sales Executive".equals(user.getOccupation()) ? "selected" : "" %>>Sales Executive</option>
          <option value="Self Employed" <%= "Self Employed".equals(user.getOccupation()) ? "selected" : "" %>>Self Employed</option>
          <option value="Surveyor" <%= "Surveyor".equals(user.getOccupation()) ? "selected" : "" %>>Surveyor</option>
          <option value="Teacher" <%= "Teacher".equals(user.getOccupation()) ? "selected" : "" %>>Teacher </option>
          <option value="Technician" <%= "Technician".equals(user.getOccupation()) ? "selected" : "" %>>Technician</option>
          <option value="Other" <%= "Other".equals(user.getOccupation()) ? "selected" : "" %>>Other</option>

        </select>
        <input type="text" name="other_occupation" id="other_occupation" style="display:none;" placeholder="Specify your occupation">
        <br>

        <!--<label>Occupation :</label>
                <select name="occupation" >
                    <option value=""></option>
                    <% for (String occupation : occupations) { %>
                    <option><%= occupation %></option>
                    <% } %>
                </select>-->





        <!-- Proceed button -->
        <button type="submit" name="action" value="proceed" class="form-container button">Save & Next</button>


      </form>

    </div>
  </div>
</div>

</body>
</html>

