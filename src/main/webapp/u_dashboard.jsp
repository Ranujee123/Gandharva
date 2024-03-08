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
<c:import url="sidebar.jsp"/>

<%

    List<String> province = UserDBUtil.getAllProvince();
    List<String> occupations = UserDBUtil.getAllOccupations();
    List<String> qualifications = UserDBUtil.getAllQualifications();
%>

<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="u_dashboard.css">
    <style>
        .profile-card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            width: 40%;
            border-radius: 5px;
            display: inline-block;
            margin: 10px;
            padding: 2px 16px;
        }
        .profile-card:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }
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
</head>
<body>

<!-- Filter Section -->
<div class="filter-section">
    <form action="Filter" method="get"> <!-- Replace 'your_servlet_url' with the URL to your servlet handling the filter logic -->
        <label for="age">Age From:</label>
        <input type="number" id="age" name="age" min="18" max="60" oninput="validateAge(this)">
        <span id="age-error" style="color: red;"></span>

        <label for="ageto">To:</label>
        <input type="number" id="ageto" name="ageto" min="18" max="60" oninput="validateAge(this)">
        <span id="ageto-error" style="color: red;"></span>




        <label>Province<span ></span>:</label>
        <select name="province" required>
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


        <label>Differently Abled :</label>
        <select name="diffabled" >
            <option value=""> </option>
            <option value="yes">Yes</option>
            <option value="No">No</option>
        </select>

        <!-- Add more filters here up to 10 different filters as per your requirement -->

        <!-- Add more filters here up to 10 different filters as per your requirement -->

        <button type="submit">Filter</button>
        <button type="reset">Clear</button>
    </form>
</div>

<!-- Display filtered users securely using c:out to prevent XSS -->
<c:if test="${not empty filteredUsers}">
    <c:forEach items="${filteredUsers}" var="user">
        <div class="profile-card">
            <h2><c:out value="${user.fname}"/> <c:out value="${user.lname}"/></h2>
            <!-- Include other user details using c:out tags -->
        </div>
    </c:forEach>
</c:if>
<c:if test="${empty filteredUsers}">
    <p>No users found matching your criteria.</p>
</c:if>
</body>
</html>