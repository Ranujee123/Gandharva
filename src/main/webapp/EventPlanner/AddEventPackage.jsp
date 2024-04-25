<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/25/2024
  Time: 11:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="addPackage.css" />
    <title>Add New Packages</title>
</head>
<body>
<nav>
    <div class="buttons">
        <a href="EventPlannerDashboard.jsp"
        ><img src="../images/sign-out-icon.png" alt="" id="sign-out-icon" />Back</a
        >
    </div>
</nav>

<div class="content">
    <form action="#" method="POST">
        <div class="form-group">
            <label for="packageNo">Package No:</label>
            <input type="text" name="packageNo" id="packageNo">
        </div>
        <div class="form-group">
            <label for="noOfGuests">Number of Guests:</label>
            <input type="text" name="noOfGuests" id="noOfGuests">
        </div>
        <div class="form-group">
            <label for="foodFor">Food for:</label>
            <input type="text" name="foodFor" id="foodFor">
        </div>
        <div class="form-group">
            <label for="beveragesFor">Beverages for:</label>
            <input type="text" name="beveragesFor" id="beveragesFor">
        </div>
        <div class="form-group">
            <label for="tablesChairs">Tables/Chairs:</label>
            <input type="text" name="tablesChairs" id="tablesChairs">
        </div>
        <div class="form-group">
            <label for="audio">Audio Facilities:</label>
            <input type="text" name="audio" id="audio">
        </div>
        <div class="form-group">
            <label for="deco">Decorations:</label>
            <input type="text" name="deco" id="deco">
        </div>
        <div class="form-group">
            <label for="dj">Local DJ:</label>
            <input type="text" name="dj" id="dj">
        </div>
        <div class="form-group">
            <label for="budget">Budget Range:</label>
            <input type="text" name="budget" id="budget">
        </div>
        <div class="form-group">
            <button type="submit">Add Package</button>
        </div>
    </form>
</div>
</body>
</html>

