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
            const lastNameElements = document.querySelectorAll('.lname');

            lastNameElements.forEach(function(element) {
                // Get the full last name from data-lname attribute
                const lastName = element.getAttribute('data-lname');
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





        <label>Province<span ></span>:</label>
        <select name="province" >
            <option value=""></option>
            <% for (String pro : province) { %>
            <option><%= pro %></option>
            <% } %>
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

        <label>Heighest Education Qualification:</label>
        <select name="eduquali" >
            <option value=""></option>
            <% for (String qualification : qualifications) { %>
            <option><%= qualification %></option>
            <% } %>
        </select>


        <label>Occupation :</label>
        <select name="occupation" >
            <option value=""></option>
            <% for (String occupation : occupations) { %>
            <option><%= occupation %></option>
            <% } %>
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


        <h2><c:out value="${user.fname}"/> <span class="lname" data-lname="<c:out value='${user.lname}'/>"></span></h2>
            <div class="profile-details-grid">
                <div class="profile-detail">
                    <p>Province: <c:out value="${user.provinceName}"/></p>
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
                    <p>Occupation: <c:out value="${user.occupationName}"/></p>
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