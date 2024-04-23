<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserDBUtil" %><%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-02-17
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="Final_Sidebar.jsp"/>


<%

    List<String> province = UserDBUtil.getAllProvince();
    List<String> occupations = UserDBUtil.getAllOccupations();
    List<String> qualifications = UserDBUtil.getAllQualifications();
    List<String> ages= UserDBUtil.getAge();
%>

<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="u_dashboard.css">


    <style>



    </style>
    <script>
        function validateAgeRange() {
            var ageFrom = document.getElementById('age').value;
            var ageTo = document.getElementById('ageto').value;
            if (parseInt(ageFrom) > parseInt(ageTo)) {
                alert('Age From should be less than or equal to Age To.');
                return false;
            }
            return true;
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


</head>
<body>
<div class="main-container">
    <!-- Sidebar Navigation -->

    <!-- Main Content Section -->
    <div class="main-content">
        <!-- Filter Section -->
        <div class="filter-section">

<div class="filter-section">
    <form action="Filter" method="post"> <!-- Replace 'your_servlet_url' with the URL to your servlet handling the filter logic -->



        <label>District<span ></span>:</label>
        <select name="province">
            <option value=""></option>
            <option value="Ampara">Ampara</option>
            <option value="Anuradhapura">Anuradhapura</option>
            <option value="Badulla">Badulla</option>
            <option value="Batticaloa">Batticaloa</option>
            <option value="Colombo">Colombo</option>
            <option value="Galle">Galle</option>
            <option value="Gampaha">Gampaha</option>
            <option value="Hambantota">Hambantota</option>
            <option value="Jaffna">Jaffna</option>
            <option value="Kalutara"> Kalutara</option>
            <option value="Kandy">Kandy</option>
            <option value="Kegalle">Kegalle</option>
            <option value="Kilinochchi">Kilinochchi</option>
            <option value="Kurunegala"> Kurunegala</option>
            <option value="Mannar">Mannar</option>
            <option value="Matale">Matale</option>
            <option value="Matara">Matara</option>
            <option value="Monaragala">Monaragala</option>
            <option value="Mullaitivu">Mullaitivu</option>
            <option value="Nuwara Eliya"> Nuwara Eliya</option>
            <option value="Polonnaruwa">Polonnaruwa</option>
            <option value="Puttalam">Puttalam</option>
            <option value="Ratnapura"> Ratnapura</option>
            <option value="Trincomalee">Trincomalee</option>
            <option value="Vavuniya">Vavuniya</option>
        </select>



        <label>Ethnicity:</label>
        <select name="ethnicity" >
            <option value=""> </option>
            <option value="sinhalese">Sinhalese</option>
            <option value="tamil">tamil</option>
            <option value="muslim">Muslim</option>
            <option value="burger">Burger</option>
            <option value="other">Other</option>
        </select>

        <label>Religion:</label>
        <select name="religion" >
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

        <label>Minimum Education Qualification:</label>
        <select name="qualification">
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

        </select>


        <label> Occupation :</label>
        <select name="occupation">
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

        <!-- Add more filters here up to 10 different filters as per your requirement -->

        <!-- Add more filters here up to 10 different filters as per your requirement -->

        <button type="submit" class="filter-button">Filter</button>
        <button type="reset" class="clear-button">Clear</button>
    </form>
</div>

<!-- Display filtered users securely using c:out to prevent XSS -->
            <div class="profiles-section">

<c:if test="${not empty filteredUsers}">
    <c:forEach items="${filteredUsers}" var="user">
        <div class="profile-card">


        <h2><c:out value="${user.firstName}"/> <span class="lastName" data-lastName="<c:out value='${user.lastName}'/>"></span></h2>
            <div class="profile-details-grid">
                <div class="profile-detail">
                    <p>Province: <c:out value="${user.province}"/></p>
                </div>
                <div class="profile-detail">
                    <p>Religion: <c:out value="${user.religion}"/></p>
                </div>
                <div class="profile-detail">
                    <p>Status: <c:out value="${user.status}"/></p>
                </div>
                <div class="profile-detail">
                    <p>Height: <c:out value="${user.height}"/></p>
                </div>
                <div class="profile-detail">
                    <p>Occupation: <c:out value="${user.occupation}"/></p>
                </div>
            </div>

            <input type="hidden" name="email" value="<c:out value='${user.email}'/>">
            <div class="button-container">
            <!--    <button class="connect-button">Connect</button>
                <button class="reject-button">Reject</button>-->
                <form action="moredetails" method="post">
                    <input type="hidden" name="email" value="${user.email}"/>
                    <button type="submit" class="connect-button">View More</button>
                </form>

            </div>

        </div>
    </c:forEach>
</c:if>

<c:if test="${empty filteredUsers}">
    <p>No users found matching your criteria.</p>
</c:if>

            </div>
        </div>
    </div>

</body>
</html>