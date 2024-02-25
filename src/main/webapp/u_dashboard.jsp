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
    <link rel="stylesheet" href="u_dashboard.css"> <!-- Link to your CSS file for styling -->
    <!-- Add any additional CSS or JS links here -->
</head>
<body>

<!-- Filter Section -->
<div class="filter-section">
    <form action="your_servlet_url" method="get"> <!-- Replace 'your_servlet_url' with the URL to your servlet handling the filter logic -->
        <label for="age">Age From:</label>
        <input type="number" id="age" name="age" min="18" max="60" oninput="validateAge(this)">
        <span id="age-error" style="color: red;"></span>

        <label for="ageto">To:</label>
        <input type="number" id="ageto" name="ageto" min="18" max="60" oninput="validateAge(this)">
        <span id="ageto-error" style="color: red;"></span>


        <script>
            function validateAgePopup(input) {
                const minValue = 18;
                const maxValue = 60;
                if (input.value < minValue || input.value > maxValue) {
                    alert("Please enter a value between 18 and 60.");
                    input.value = ''; // Optionally, clear the incorrect input
                }
            }
        </script>

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
        <select name="occupation" required>
            <option value=""></option>
            <% for (String occupation : occupations) { %>
            <option><%= occupation %></option>
            <% } %>
        </select>


        <label>Differently Abled :</label>
        <select name="diffabled" required>
            <option value=""> </option>
            <option value="yes">Yes</option>
            <option value="No">No</option>
        </select>

        <!-- Add more filters here up to 10 different filters as per your requirement -->

        <!-- Add more filters here up to 10 different filters as per your requirement -->

        <button type="submit">Filter</button>
        <button type="reset">Clear</button> <!-- Clear button to reset form fields -->
    </form>
</div>

<!-- Profiles Section -->
<div class="profiles-section">
    <!-- Example profiles with dummy data -->
    <div class="profile-card">
        <h3>Jane Doe</h3>
        <p>Age: 28</p>
        <p>Height: 165 cm</p>
        <p>Province: Ontario</p>
        <p>Cast: Cast A</p>
        <!-- Add more profile details here -->
    </div>
    <div class="profile-card">
        <h3>John Smith</h3>
        <p>Age: 32</p>
        <p>Height: 175 cm</p>
        <p>Province: British Columbia</p>
        <p>Cast: Cast B</p>
        <!-- Add more profile details here -->
    </div>
    <!-- Add more dummy profiles as needed -->
</div>

</body>
</html>
