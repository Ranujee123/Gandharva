<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-28
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="com.user.model.User" %>
<%
  List<String> occupations = UserDBUtil.getAllOccupations();
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="logoutbutton.jsp"/>
<c:import url="Final_Sidebar.jsp"/>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

  String userEmail = (String) session.getAttribute("userEmail");
  User user = null;

  if (userEmail != null) {
    String id=UserDBUtil.getUserIdByEmail(userEmail);
    List<User> updateinterestedinFam = UserDBUtil.getInterestedInFamDetails(id);
    if (updateinterestedinFam != null && !updateinterestedinFam.isEmpty()) {
      user = updateinterestedinFam.get(0);
    }
  }

%>



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
      <form action="updateinterestedINFam" method="post">

        <label>Father's Religion:</label>
        <select name="freli">
          <option value=""></option>
          <option value="Atheists" <%= "Atheists".equalsIgnoreCase(user.getFreli()) ? "selected" : "" %>>Atheists</option>
          <option value="Buddhist" <%= "Buddhist".equalsIgnoreCase(user.getFreli()) ? "selected" : "" %>>Buddhist</option>
          <option value="Catholic" <%= "Catholic".equalsIgnoreCase(user.getFreli()) ? "selected" : "" %>>Catholic</option>
          <option value="Christian" <%= "Christian".equalsIgnoreCase(user.getFreli()) ? "selected" : "" %>>Christian</option>
          <option value="Hindu" <%= "Hindu".equalsIgnoreCase(user.getFreli()) ? "selected" : "" %>>Hindu</option>
          <option value="Islam" <%= "Islam".equalsIgnoreCase(user.getFreli()) ? "selected" : "" %>>Islam</option>
          <option value="Other" <%= "Other".equalsIgnoreCase(user.getFreli()) ? "selected" : "" %>>Other</option>
        </select>


        <label>Mother's Religion:</label>
        <select name="mreli">
          <option value=""></option>
          <option value="Atheists" <%= "Atheists".equalsIgnoreCase(user.getMreli()) ? "selected" : "" %>>Atheists</option>
          <option value="Buddhist" <%= "Buddhist".equalsIgnoreCase(user.getMreli()) ? "selected" : "" %>>Buddhist</option>
          <option value="Catholic" <%= "Catholic".equalsIgnoreCase(user.getMreli()) ? "selected" : "" %>>Catholic</option>
          <option value="Christian" <%= "Christian".equalsIgnoreCase(user.getMreli()) ? "selected" : "" %>>Christian</option>
          <option value="Hindu" <%= "Hindu".equalsIgnoreCase(user.getMreli()) ? "selected" : "" %>>Hindu</option>
          <option value="Islam" <%= "Islam".equalsIgnoreCase(user.getMreli()) ? "selected" : "" %>>Islam</option>
          <option value="Other" <%= "Other".equalsIgnoreCase(user.getMreli()) ? "selected" : "" %>>Other</option>
        </select>

        <label>Father's Occupation:</label>
        <select name="foccu" id="foccu" onchange="showOtherInputFoccu()" required>
          <option value=""></option>
          <option value="Accountant" <%= "Accountant".equals(user.getFoccu()) ? "selected" : "" %>>Accountant </option>
          <option value="Architect" <%= "Architect".equals(user.getFoccu()) ? "selected" : "" %>>Architect</option>
          <option value="Banker" <%= "Banker".equals(user.getFoccu()) ? "selected" : "" %>>Banker</option>
          <option value="Business Owner" <%= "Business Owner".equals(user.getFoccu()) ? "selected" : "" %>>Business Owner</option>
          <option value="Chef" <%= "Chef".equals(user.getFoccu()) ? "selected" : "" %>>Chef</option>
          <option value="Doctor" <%= "Doctor".equals(user.getFoccu()) ? "selected" : "" %>>Doctor</option>
          <option value="Driver" <%= "Driver".equals(user.getFoccu()) ? "selected" : "" %>>Driver</option>
          <option value="Engineer" <%= "Engineer".equals(user.getFoccu()) ? "selected" : "" %>>Engineer</option>
          <option value="Farmer" <%= "Farmer".equals(user.getFoccu()) ? "selected" : "" %>>Farmer</option>
          <option value="Governmet Service" <%= "Governmet Service".equals(user.getFoccu()) ? "selected" : "" %>>Governmet Service</option>
          <option value="Graphic Designer" <%= "Graphic Designer".equals(user.getFoccu()) ? "selected" : "" %>>Graphic Designer</option>
          <option value="Hotelier" <%= "Hotelier".equals(user.getFoccu()) ? "selected" : "" %>>Hotelier </option>
          <option value="House Wife" <%= "House Wife".equals(user.getFoccu()) ? "selected" : "" %>>House Wife</option>
          <option value="IT Professional" <%= "IT Professional".equals(user.getFoccu()) ? "selected" : "" %>>IT Professional</option>
          <option value="Lawyer" <%= "Lawyer".equals(user.getFoccu()) ? "selected" : "" %>>Lawyer </option>
          <option value="Lecturer" <%= "Lecturer".equals(user.getFoccu()) ? "selected" : "" %>>Lecturer</option>
          <option value="Manager" <%= "Manager".equals(user.getFoccu()) ? "selected" : "" %>>Manager</option>
          <option value="Medical Professional" <%= "Medical Professional".equals(user.getFoccu()) ? "selected" : "" %>>Medical Professional</option>
          <option value="Military" <%= "Military".equals(user.getFoccu()) ? "selected" : "" %>>Military</option>
          <option value="Not Employed" <%= "Not Employed".equals(user.getFoccu()) ? "selected" : "" %>>Not Employed</option>
          <option value="Nurse" <%= "Nurse".equals(user.getFoccu()) ? "selected" : "" %>> Nurse</option>
          <option value="Police Officer" <%= "Police Officer".equals(user.getFoccu()) ? "selected" : "" %>>Police Officer</option>
          <option value="Quantity Surveyor" <%= "Quantity Surveyor".equals(user.getFoccu()) ? "selected" : "" %>>Quantity Surveyor</option>
          <option value="Researcher" <%= "Researcher".equals(user.getFoccu()) ? "selected" : "" %>>Researcher</option>
          <option value="Sales Executive" <%= "Sales Executive".equals(user.getFoccu()) ? "selected" : "" %>>Sales Executive</option>
          <option value="Self Employed" <%= "Self Employed".equals(user.getFoccu()) ? "selected" : "" %>>Self Employed</option>
          <option value="Surveyor" <%= "Surveyor".equals(user.getFoccu()) ? "selected" : "" %>>Surveyor</option>
          <option value="Teacher" <%= "Teacher".equals(user.getFoccu()) ? "selected" : "" %>>Teacher </option>
          <option value="Technician" <%= "Technician".equals(user.getFoccu()) ? "selected" : "" %>>Technician</option>
          <option value="Other" <%= "Other".equals(user.getFoccu()) ? "selected" : "" %>>Other</option>

        </select>
        <input type="text" name="other_foccu" id="other_foccu" style="display:none;" placeholder="Specify your father's occupation">
        <br>

        <label>Mother's Occupation:</label>
        <select name="moccup" id="moccup" onchange="showOtherInputMoccup()">
          <option value=""></option>
          <option value="Accountant" <%= "Accountant".equals(user.getMoccup()) ? "selected" : "" %>>Accountant </option>
          <option value="Architect" <%= "Architect".equals(user.getMoccup()) ? "selected" : "" %>>Architect</option>
          <option value="Banker" <%= "Banker".equals(user.getMoccup()) ? "selected" : "" %>>Banker</option>
          <option value="Business Owner" <%= "Business Owner".equals(user.getMoccup()) ? "selected" : "" %>>Business Owner</option>
          <option value="Chef" <%= "Chef".equals(user.getMoccup()) ? "selected" : "" %>>Chef</option>
          <option value="Doctor" <%= "Doctor".equals(user.getMoccup()) ? "selected" : "" %>>Doctor</option>
          <option value="Driver" <%= "Driver".equals(user.getMoccup()) ? "selected" : "" %>>Driver</option>
          <option value="Engineer" <%= "Engineer".equals(user.getMoccup()) ? "selected" : "" %>>Engineer</option>
          <option value="Farmer" <%= "Farmer".equals(user.getMoccup()) ? "selected" : "" %>>Farmer</option>
          <option value="Governmet Service" <%= "Governmet Service".equals(user.getMoccup()) ? "selected" : "" %>>Governmet Service</option>
          <option value="Graphic Designer" <%= "Graphic Designer".equals(user.getMoccup()) ? "selected" : "" %>>Graphic Designer</option>
          <option value="Hotelier" <%= "Hotelier".equals(user.getMoccup()) ? "selected" : "" %>>Hotelier </option>
          <option value="House Wife" <%= "House Wife".equals(user.getMoccup()) ? "selected" : "" %>>House Wife</option>
          <option value="IT Professional" <%= "IT Professional".equals(user.getMoccup()) ? "selected" : "" %>>IT Professional</option>
          <option value="Lawyer" <%= "Lawyer".equals(user.getMoccup()) ? "selected" : "" %>>Lawyer </option>
          <option value="Lecturer" <%= "Lecturer".equals(user.getMoccup()) ? "selected" : "" %>>Lecturer</option>
          <option value="Manager" <%= "Manager".equals(user.getMoccup()) ? "selected" : "" %>>Manager</option>
          <option value="Medical Professional" <%= "Medical Professional".equals(user.getMoccup()) ? "selected" : "" %>>Medical Professional</option>
          <option value="Military" <%= "Military".equals(user.getMoccup()) ? "selected" : "" %>>Military</option>
          <option value="Not Employed" <%= "Not Employed".equals(user.getMoccup()) ? "selected" : "" %>>Not Employed</option>
          <option value="Nurse" <%= "Nurse".equals(user.getMoccup()) ? "selected" : "" %>> Nurse</option>
          <option value="Police Officer" <%= "Police Officer".equals(user.getMoccup()) ? "selected" : "" %>>Police Officer</option>
          <option value="Quantity Surveyor" <%= "Quantity Surveyor".equals(user.getMoccup()) ? "selected" : "" %>>Quantity Surveyor</option>
          <option value="Researcher" <%= "Researcher".equals(user.getMoccup()) ? "selected" : "" %>>Researcher</option>
          <option value="Sales Executive" <%= "Sales Executive".equals(user.getMoccup()) ? "selected" : "" %>>Sales Executive</option>
          <option value="Self Employed" <%= "Self Employed".equals(user.getMoccup()) ? "selected" : "" %>>Self Employed</option>
          <option value="Surveyor" <%= "Surveyor".equals(user.getMoccup()) ? "selected" : "" %>>Surveyor</option>
          <option value="Teacher" <%= "Teacher".equals(user.getMoccup()) ? "selected" : "" %>>Teacher </option>
          <option value="Technician" <%= "Technician".equals(user.getMoccup()) ? "selected" : "" %>>Technician</option>
          <option value="Other" <%= "Other".equals(user.getMoccup()) ? "selected" : "" %>>Other</option>

        </select>
        <input type="text" name="other_moccup" id="other_moccup" style="display:none;" placeholder="Specify your mother's occupation">
        <br>


        <label>Marital Status of Parents:</label>
        <select name="maritalstatus">

          <option value=""></option>
          <option value="Married" <%= "Married".equalsIgnoreCase(user.getMaritalstatus()) ? "selected" : "" %>>Married</option>
          <option value="Widowed" <%= "Widowed".equalsIgnoreCase(user.getMaritalstatus()) ? "selected" : "" %>>Widowed</option>
          <option value="Divorced" <%= "Divorced".equalsIgnoreCase(user.getMaritalstatus()) ? "selected" : "" %>>Divorced</option>
          <option value="Seperated" <%= "Seperated".equalsIgnoreCase(user.getMaritalstatus()) ? "selected" : "" %>>Seperated</option>
          <option value="Other" <%= "Other".equalsIgnoreCase(user.getMaritalstatus()) ? "selected" : "" %>>Other</option>
        </select>

        <label>Number of Siblings:</label>
        <input type="number" name="siblings" min="0" value="<%= user != null ? user.getSiblings() : "" %>" required><br>






        <button type="submit" name="action" value="proceed" class="form-container button">Save</button>
      </form>
    </div>



    </form>
  </div>
</div>
</div>

</div>

</body>
</html>