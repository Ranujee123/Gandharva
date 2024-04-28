<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-28
  Time: 00:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="com.user.model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="Final_Sidebar.jsp"/>


<%

  String userEmail = (String) session.getAttribute("userEmail");
  User user = null;

  if (userEmail != null) {
   String id=UserDBUtil.getUserIdByEmail(userEmail);
    List<User> personaldetails = UserDBUtil.getPersonalDetails(id);
    if (personaldetails != null && !personaldetails.isEmpty()) {
      user = personaldetails.get(0);
    }
  }

%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="u_styles.css">
  <title>Personal Details</title>
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
      var select = document.getElementById('caste');
      var otherInput = document.getElementById('other_caste');
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
    <h1>About You</h1>
    <div class="form-container">
      <% if (user != null) { %>
      <form action="updatepersonaldetails" method="post" enctype="multipart/form-data">

        <label>Ethnicity:</label>
        <select name="ethnicity" required>
          <option value=""></option>
          <option value="Burger" <%= "Burger".equals(user.getEthnicity()) ? "selected" : "" %>>Burger</option>
          <option value="Muslim" <%= "Muslim".equals(user.getEthnicity()) ? "selected" : "" %>>Muslim</option>
          <option value="Sinhalese" <%= "Sinhalese".equals(user.getEthnicity()) ? "selected" : "" %>>Sinhalese</option>
          <option value="Tamil" <%= "Tamil".equals(user.getEthnicity()) ? "selected" : "" %>>Tamil</option>
          <option value="Other" <%= "Other".equals(user.getEthnicity()) ? "selected" : "" %>>Other</option>
        </select>


        <label>Religion:</label>
        <select name="religion" required>
          <option value=""></option>
          <option value="Atheists" <%= "Atheists".equalsIgnoreCase(user.getReligion()) ? "selected" : "" %>>Atheists</option>
          <option value="Buddhist" <%= "Buddhist".equalsIgnoreCase(user.getReligion()) ? "selected" : "" %>>Buddhist</option>
          <option value="Catholic" <%= "Catholic".equalsIgnoreCase(user.getReligion()) ? "selected" : "" %>>Catholic</option>
          <option value="Christian" <%= "Christian".equalsIgnoreCase(user.getReligion()) ? "selected" : "" %>>Christian</option>
          <option value="Hindu" <%= "Hindu".equalsIgnoreCase(user.getReligion()) ? "selected" : "" %>>Hindu</option>
          <option value="Islam" <%= "Islam".equalsIgnoreCase(user.getReligion()) ? "selected" : "" %>>Islam</option>
          <option value="Other" <%= "Other".equalsIgnoreCase(user.getReligion()) ? "selected" : "" %>>Other</option>
        </select>


        <label>Caste:</label>
        <select name="caste" id="caste" onchange="showOtherInput()" required>
          <option value=""></option>
          <option value="Bathgama" <%= "Bathgama".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Bathgama</option>
          <option value="Bodhivansha" <%= "Bodhivansha".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Bodhivansha</option>
          <option value="Deva" <%= "Deva".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Deva</option>
          <option value="Durava" <%= "Durava".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Durava</option>
          <option value="Govigama" <%= "Govigama".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Govigama</option>
          <option value="Hunu" <%= "Hunu".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Hunu</option>
          <option value="Karava" <%= "Karava".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Karava</option>
          <option value="Kumbal" <%= "Kumbal".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Kumbal</option>
          <option value="Navandanna" <%= "Navandanna".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Navandanna</option>
          <option value="Nekathi" <%= "Nekathi".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Nekathi</option>
          <option value="Rajaka" <%= "Rajaka".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Rajaka</option>
          <option value="Radala" <%= "Radala".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Radala</option>
          <option value="Salagama" <%= "Salagama".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Salagama</option>
          <option value="Other" <%= "Other".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Other</option>
        </select>ther</option>
        <input type="text" name="other_caste" id="other_caste" style="display:none;" placeholder="Specify your caste">



        <label>Civil Status:</label>
        <select name="status">
          <option value=""></option>
          <option value="Divorced" <%= "Divorced".equalsIgnoreCase(user.getStatus()) ? "selected" : "" %>>Divorced</option>
          <option value="Nevermarried" <%= "Nevermarried".equalsIgnoreCase(user.getStatus()) ? "selected" : "" %>>Never Married</option>
          <option value="Seperated" <%= "Seperated".equalsIgnoreCase(user.getStatus()) ? "selected" : "" %>>Separated</option>
          <option value="Widowed" <%= "Widowed".equalsIgnoreCase(user.getStatus()) ? "selected" : "" %>>Widowed</option>
          <option value="Other" <%= "Other".equalsIgnoreCase(user.getStatus()) ? "selected" : "" %>>Other</option>
        </select>

        <label>Height :</label>
        <select name="height">
          <option value=""> </option>
          <%
            String currentHeight = user.getHeight(); // Assumes you have a getHeight() method in your User object
            for (int i = 4; i <= 7; i++) {
              for (int j = 0; j < 12; j++) {
                String height = i + "ft " + j + "in";
                boolean isSelected = height.equalsIgnoreCase(currentHeight); // Check if the generated height matches the current height
          %>
          <option value="<%= height %>" <%= isSelected ? "selected" : "" %>><%= height %></option>
          <%
              }
            }
          %>
        </select>

        <label>Food Preference:</label>
        <select name="foodpreferences">
          <option value=""></option>
          <option value="Vegetarian" <%= "Vegetarian".equalsIgnoreCase(user.getFoodpreferences()) ? "selected" : "" %>>Vegetarian</option>
          <option value="Non-Vegetarian" <%= "Non-Vegetarian".equalsIgnoreCase(user.getFoodpreferences()) ? "selected" : "" %>>Non-Vegetarian</option>
          <option value="Vegan" <%= "Vegan".equalsIgnoreCase(user.getFoodpreferences()) ? "selected" : "" %>>Vegan</option>
        </select>

        <label>Drinking:</label>
        <select name="drinking">
          <option value=""></option>
          <option value="Yes" <%= "Yes".equalsIgnoreCase(user.getDrinking()) ? "selected" : "" %>>Yes</option>
          <option value="No" <%= "No".equalsIgnoreCase(user.getDrinking()) ? "selected" : "" %>>No</option>
          <option value="Occationally" <%= "Occationally".equalsIgnoreCase(user.getDrinking()) ? "selected" : "" %>>Occasionally</option>
        </select>



        <label>Smoking:</label>
        <select name="smoking">
          <option value=""></option>
          <option value="Yes" <%= "Yes".equalsIgnoreCase(user.getSmoking()) ? "selected" : "" %>>Yes</option>
          <option value="No" <%= "No".equalsIgnoreCase(user.getSmoking()) ? "selected" : "" %>>No</option>
        </select>

        <label>Differently Abled:</label>
        <select name="diffabled">
          <option value=""></option>
          <option value="Yes" <%= "Yes".equalsIgnoreCase(user.getDiffabled()) ? "selected" : "" %>>Yes</option>
          <option value="No" <%= "No".equalsIgnoreCase(user.getDiffabled()) ? "selected" : "" %>>No</option>
        </select>






        <!-- Proceed button -->
        <button type="submit" name="action" value="proceed" class="form-container button" >Save & Next</button>

        <!-- Save Progress button -->
        <a href="u_myprofile.jsp" class="form-container button">Back to Profile</a>
      </form>
      <% } %>
    </div>


  </div>
</div>

</body>
</html>
