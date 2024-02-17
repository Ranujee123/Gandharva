<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-02-17
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="sidebar.jsp"/>

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
        <label for="age">Age:</label>
        <input type="number" id="age" name="age">

        <label for="province">Province:</label>
        <select id="province" name="province">
            <option value="">Select Province</option>
            <!-- Populate options here -->
        </select>

        <label for="cast">Cast:</label>
        <select id="cast" name="cast">
            <option value="">Select Cast</option>
            <!-- Populate options here -->
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
