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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <!-- Include SweetAlert2 from a CDN in the head section of your HTML -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>



  <style>
    *{
      font-family: "Poppins", sans-serif;
    }

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
      background-color: #8f8d8b;
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
  <script src="js/nic-utils.js"></script>
  <script>
    function confirmConnection() {
      Swal.fire({
        title: 'Are you sure?',
        text: "You want to send a connection request!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#4CAF50',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, send it!'
      }).then((result) => {
        if (result.isConfirmed) {
          document.getElementById('connectionForm').submit(); // Submit the form programmatically if confirmed
        }
      });
    }
  </script>

  <script>
    document.addEventListener('DOMContentLoaded', function() {
      // Select all elements that contain last names
      const lastNameElements = document.querySelectorAll('.lastName');

      lastNameElements.forEach(function(element) {
        // Get the full last name from data-lastName attribute
        const lastName = element.getAttribute('data-lastName');
        if (lastName && lastName.length > 0) {
          // Extract the first letter and convert to uppercase
          const firstLetter = lastName[0].toUpperCase();
          // Update the text of the span to only show the capitalized first letter
          element.textContent = firstLetter + '.';
        }
      });
    });
  </script>

  <script>
    function reportUser() {
      Swal.fire({
        title: 'Report User',
        input: 'select',
        inputOptions: {
          'spam': 'Spam or misleading',
          'harassment': 'Harassment or bullying',
          'hateSpeech': 'Hate speech or symbols',
          'other': 'Other'
        },
        inputPlaceholder: 'Select a reason',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Report'
      }).then((result) => {
        if (result.isConfirmed && result.value) {
          document.getElementById('reason').value = result.value; // Set the reason
          document.getElementById('reportForm').submit(); // Submit the form programmatically
        }
      });
    }

  </script>


</head>



<body style="margin: 0;">

<div>

<%
  User user = (User) request.getAttribute("user");
  Boolean isReported = (Boolean) request.getAttribute("isUserReported");
  Boolean isConnected=(Boolean)request.getAttribute("isConnectedUser") ;

  if (user != null) {
%>
<h1></h1>

  <div class="details-card">
    <!-- User details -->
    <p> <%= isReported ? "This user has been reported by you:" : " " %></p>
    <p> <%= isConnected? "You both are mutually connected:" : " " %></p>
    <!-- Show other user details -->
  </div>
<div class="details-card">
  <img src="DP/defaultDP.jpeg" alt="Profile Image" class="profile-image">
  <h2><c:out value="${user.firstName}"/> <span class="lastName" data-lastName="<c:out value='${user.lastName}'/>"></span></h2>
  <p><%=user.getAge()%>-<%=user.getProvince() %></p>

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
  <td><%=user.getEthnicity() != null ? user.getEthnicity() : "Not Shared" %></td>
</tr>

    <tr>
      <td><b>Religion</b></td>
      <td><%=user.getReligion() != null ? user.getReligion() : "Not Shared"%></td>
    </tr>
    <tr>
      <td><b>Age</b></td>
      <td><%=user.getAge()%></td>
    </tr>
    <tr>
      <td><b>Civil Status</b></td>
      <td><%=user.getStatus() != null ? user.getStatus() : "Not Shared"%></td>
    </tr>
    <tr>
      <td><b>Height</b></td>
      <td><%=user.getHeight()%></td>
    </tr>
    <tr>
      <td><b>Province</b></td>
      <td><%=user.getProvince()%></td>
    </tr>

  </table>

  <h4>Education & Profession</h4>
  <table style="width:100%">
    <tr>
      <td><b>Highest Education Qualification</b></td>
      <td><%=user.getQualification() != null ? user.getQualification() : "Not Shared"%></td>
    </tr>

    <tr>
      <td><b>Profession</b></td>
      <td><%=user.getOccupation() != null ? user.getOccupation() : "Not Shared"%></td>
    </tr>
  </table>

  <h4>Habits</h4>
  <table style="width:100%">
    <tr>
      <td><b>Food Preference</b></td>
      <td><%=user.getFoodpreferences() != null ? user.getFoodpreferences() : "Not Shared"%></td>
    </tr>

    <tr>
      <td><b>Drinking</b></td>
      <td><%=user.getDrinking() != null ? user.getDrinking() : "Not Shared"%></td>
    </tr>
    <tr>
      <td><b>Smoking</b></td>
      <td><%=user.getSmoking() != null ? user.getSmoking() : "Not Shared"%></td>
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
            <td><%=user.getFreli() != null ? user.getFreli() : "Not Shared"%></td>
          </tr>
          <tr>
            <td><b>Profession</b></td>
            <td><%=user.getFoccu() != null ? user.getFoccu() : "Not Shared"%></td>
          </tr>
        </table>
      </div>

      <div class="table-card">
        <h4>Mother's Info</h4>
        <table>
          <tr>
            <td><b>Religion</b></td>
            <td><%=user.getMreli() != null ? user.getMreli() : "Not Shared"%></td>
          </tr>
          <tr>
            <td><b>Profession</b></td>
            <td><%=user.getMoccup() != null ? user.getMoccup() : "Not Shared"%></td>
          </tr>
        </table>
      </div>


    </div>
  <table>
    <tr>
      <td><b>Marital Status of parents</b></td>
      <td><%=user.getMaritalstatus() != null ? user.getMaritalstatus() : "Not Shared"%></td>
    </tr>
    <tr>
      <td><b>No of Siblings</b></td>
      <td><%=user.getSiblings() %></td>
    </tr>


  </table>
  </div>



  <c:if test="${isConnectionRequestPending}">
    <!-- Displayed if there is a pending connection request -->
    <p class="connect-status">Pending Request</p>
  </c:if>

  <c:if test="${isConnectedUser}">
    <!-- Displayed if the users are already connected -->
    <p class="connect-status">You both are mutually connected</p>
  </c:if>

  <c:if test="${!isConnectionRequestPending and !isConnectedUser}">
  <form action="connection" method="post" id="connectionForm">
    <input type="hidden" name="toUserEmail" value="${user.email}" />
    <button type="button" class="connect-button" onclick="confirmConnection()">Connect</button>
  </form>
</c:if>

  <!-- Reporting Section -->
  <div class="report-user-section">
    <button onclick="reportUser()" class="report-button">Report User</button>
    <form id="reportForm" action="ReportUserServlet" method="POST" style="display:none;">
      <input type="hidden" name="fromUserEmail" value="<%=session.getAttribute("email")%>" />
      <input type="hidden" name="toUserEmail" value="<%=user.getEmail()%>" />
      <input type="hidden" id="reason" name="reason" />
    </form>
  </div>



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
