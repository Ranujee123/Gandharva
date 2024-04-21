
<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-20
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="Final_Sidebar.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <title>Send Request</title>

    <style>
        .container {
            margin-left: 100px;
            margin-top: 50px;
        }
        .button {
            padding: 10px 15px;
            margin-left: 10px;
            border-radius: 5px;
            cursor: pointer;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
            border: none;
            background-color: #4CAF50;
        }
        .topic{

            text-align: justify-all;
            margin-left: 300px;
        }

    </style>
</head>

<body>
<div class="container">
<div class="topic">
<h2>Sri Jayathisse</h2>
    <p>The well known and experienced astrologer  </p>
    <p>Send your horoscope now</p>
    <br>
</div>
<form action="SendRequest" method="post" enctype="multipart/form-data">

    <label for="horoscope">Horoscope Image:</label>
    <input type="file" id="horoscope" name="horoscope" accept="image/*" required><br><br>

    <label for="horoscopeSecond">Second Horoscope Image:</label>
    <input type="file" id="horoscopeSecond" name="horoscopeSecond" accept="image/*" required><br><br>

    <input type="submit" value="Submit Request" class="button">

</form>
</div>
</body>
</html>
