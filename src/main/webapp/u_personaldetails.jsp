<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-02-17
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="Final_Sidebar.jsp"/>




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
  </style>



</head>
<body>

<div class="container">




  <div class="main-content">
    <h1>About You</h1>
    <div class="form-container">
      <form action="updetails" method="post" enctype="multipart/form-data">
       <label>Ethnicity:</label>
        <select name="ethnicity" required>
          <option value=""> </option>
          <option value="sinhalese">Sinhalese</option>
          <option value="tamil">Tamil</option>
          <option value="muslim">Muslim</option>
          <option value="burger">Burger</option>
          <option value="other">Other</option>
        </select>


        <label>Religion:</label>
        <select name="religion" required >
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

          <label> Caste:</label>
          <select name="caste" required>
              <option value=""></option>
              <option value="Radala">Radala</option>
              <option value="Govigama">Govigama</option>
              <option value="Bathgama">Bathgama</option>
              <option value="Deva">Deva</option>
              <option value="Nekathi">Nekathi</option>
              <option value="Bodhivansha">Bodhivansha</option>
              <option value="Rajaka">Rajaka</option>
              <option value="kumbal">Kumbal</option>
              <option value="Hunu">Hunu</option>
              <option value="Durava"> Durava</option>
              <option value="Karava">Karava</option>
              <option value="Salagama">Salagama</option>
              <option value="Navandanna"> Navandanna</option>
              <!-- Add more options as needed -->
          </select><br>


          <label>Civil Status :</label>
        <select name="status" >
          <option value=""> </option>
          <option value="Nevermarried">Never Married</option>
          <option value="widowed">Widowed</option>
          <option value="divorced">Divorced</option>
          <option value="seperated">Seperated</option>
          <option value="other">Other</option>
        </select>

        <label>Height :</label>
        <select name="height" >
          <option value=""> </option>
          <% for (int i = 4; i <= 7; i++) {
            for (int j = 0; j < 12; j++) {
              String height = i + "ft " + j + "in";
          %>
          <option value="<%= height %>"><%= height %></option>
          <%
              }
            }
          %>
        </select>

        <label>Food Preference:</label>
        <select name="foodpreferences" >
          <option value=""> </option>
          <option value="Veg">Vegetarian</option>
          <option value="Non-Veg">Non-Vegetarian</option>
          <option value="vegan">Vegan</option>
        </select>

        <label>Drinking:</label>
        <select name="drinking" >
          <option value=""> </option>
          <option value="yes">Yes</option>
          <option value="No">No</option>
          <option value="occationally">Occationally</option>
        </select>


        <label>Smoking :</label>
        <select name="smoking" >
          <option value=""> </option>
          <option value="yes">Yes</option>
          <option value="No">No</option>
        </select>

        <label>Differently Abled :</label>
        <select name="diffabled" >
          <option value=""> </option>
          <option value="yes">Yes</option>
          <option value="No">No</option>
        </select>



        <div class="completion-bar">
          <div class="completion-fill" style="width: 15%;"></div> <!-- Adjust the width based on completion -->
        </div>
        <p class="completion-text">7 out of 7 steps left to complete your profile</p>




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
