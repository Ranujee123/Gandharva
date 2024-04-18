<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-18
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.user.model.User" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="logoutbutton.jsp"/>


<!DOCTYPE html>
<html>

<head>
  <title>More details </title>
  <link rel="stylesheet" type="text/css" href="u_styles.css">



  <style>
    body {
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background-color: #f0f0f0;
      }
    .details-card {

      margin: 15px; /* Space between cards */
      padding: 20px; /* Internal spacing */
      border-radius: 10px; /* Rounded corners */
      background-color: #ffffff; /* Card background color */
      width: 100vh; /* Fixed width, adjust as necessary */

    }

    .profile-image {
      border-radius: 50%;
      width: 100px;
      height: 100px;

    }



    tr:nth-child(even) {
      background-color: #d7a15e;
    }


    .tables-container {
      display: flex;
      justify-content: space-between; /* Ensures the tables are evenly spaced */
    }

    .table-card {
      flex: 1; /* Each table card takes up equal space */
      margin: 10px; /* Spacing between the tables */
      padding: 20px; /* Padding inside each table card */

    }

    table {
      width: 100%; /* Full width of the table card */
      border-collapse: collapse; /* Ensures borders between cells are merged */
    }

    td {
      padding: 8px; /* Padding inside table cells */
      border-bottom: 1px solid #ddd; /* Adds a line under each row */
    }

    th, td {
      text-align: left; /* Aligns text to the left */
    }
    .button-container {
      display: flex;
      width: 100%; /* Take the full width of the card to spread the buttons */
      justify-content: space-between; /* Space out the buttons */
      margin-top: 10px; /* Space from the last element above the buttons */
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
    }

    .connect-button {
      background-color: #4CAF50; /* Green color for connect */
    }

    .reject-button {
      background-color: #f44336; /* Red color for reject */
    }
    .connect-status {
      color: #666; /* Dimmed text color for less emphasis */
      font-size: 16px; /* Appropriate font size for visibility */
      font-weight: bold; /* Makes the text slightly heavier */
      padding: 10px 20px; /* Padding for better spacing */
      background-color: #f0f0f0; /* Light grey background to highlight the text slightly */
      border-radius: 5px; /* Rounded corners for aesthetics */
      text-align: center; /* Centers the text */
      display: block; /* Ensures the text takes its own line */
      margin-top: 10px; /* Extra space above the status for clarity */
    }



  </style>
  <script src="nic-utils.js"></script>

</head>



<body style="margin: 0;">

<div

<%
  User user = (User) request.getAttribute("user");
  if (user != null) {
%>
<h1>User Details</h1>
<div class="details-card">
  <img src="DP/defaultDP.jpeg" alt="Profile Image" class="profile-image">
<h2 > <%= user.getFname() %></h2>
  <p><%=user.getAge()%>-<%=user.getOccupationName()%>-<%=user.getHeight()%></p>
<p>Email: <%= user.getEmail() %></p>
</div>

<div class="details-card">
  <p>Private information such as full name, birth date, pictures, contact details and horoscope information are only visible to matched profiles.</p>
</div>

<div class="details-card">
  <h3>Personal Info</h3>
  <h4>Basic</h4>
  <table style="width:100%">
<tr>
  <td><b>Ethnicity</b></td>
  <td><%=user.getEthnicity()%></td>
</tr>

    <tr>
      <td><b>Religion</b></td>
      <td><%=user.getReligion()%></td>
    </tr>
    <tr>
      <td><b>Age</b></td>
      <td><%=user.getAge()%></td>
    </tr>
    <tr>
      <td><b>Civil Status</b></td>
      <td><%=user.getStatus()%></td>
    </tr>
    <tr>
      <td><b>Height</b></td>
      <td><%=user.getHeight()%></td>
    </tr>
    <tr>
      <td><b>Province</b></td>
      <td><%=user.getProvinceName()%></td>
    </tr>

  </table>

  <h4>Education & Profession</h4>
  <table style="width:100%">
    <tr>
      <td><b>Education</b></td>
      <td><%=user.getQualificationName()%></td>
    </tr>

    <tr>
      <td><b>Profession</b></td>
      <td><%=user.getOccupationName()%></td>
    </tr>
  </table>

  <h4>Habits</h4>
  <table style="width:100%">
    <tr>
      <td><b>Food Preference</b></td>
      <td><%=user.getFoodpreferences()%></td>
    </tr>

    <tr>
      <td><b>Drinking</b></td>
      <td><%=user.getDrinking()%></td>
    </tr>
    <tr>
      <td><b>Smoking</b></td>
      <td><%=user.getSmoking()%></td>
    </tr>
  </table>
</div>


<div class="details-card">

    <h3>Family Info</h3>

    <div class="tables-container">
      <div class="table-card">
        <h4>Father's Info</h4>
        <table>
          <tr>
            <td><b>Religion</b></td>
            <td><%=user.getFreli()%></td>
          </tr>
          <tr>
            <td><b>Profession</b></td>
            <td><%=user.getFoccu()%></td>
          </tr>
        </table>
      </div>

      <div class="table-card">
        <h4>Mother's Info</h4>
        <table>
          <tr>
            <td><b>Religion</b></td>
            <td><%=user.getMreli()%></td>
          </tr>
          <tr>
            <td><b>Profession</b></td>
            <td><%=user.getMoccup()%></td>
          </tr>
        </table>
      </div>


    </div>
  <table>
    <tr>
      <td><b>Marital Status of parents</b></td>
      <td><%=user.getMaritalstatus()%></td>
    </tr>
    <tr>
      <td><b>No of Siblings</b></td>
      <td><%=user.getSiblings()%></td>
    </tr>
  </table>
  </div>



<c:if test="${isConnectionRequestPending}">
  <p class="connect-status">Pending Request</p>
</c:if>
<c:if test="${not isConnectionRequestPending}">
  <form action="connection" method="post">
    <input type="hidden" name="toUserEmail" value="${user.email}" />
    <button type="submit" class="connect-button">Connect</button>
  </form>
</c:if>




</div>
<br>
<br>
<br>

  <!-- Add other fields similarly -->
<% } else { %>
<p>User details not found.</p>
<% } %>
</body>
</html>
