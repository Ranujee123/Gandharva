<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/28/2024
  Time: 8:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Event Partner</title>
</head>
<style>
    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }

    body {
        background-color: #ffffff;
        min-height: 100vh;
    }

    .content {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        background-color: #ffffff;
        height: 80vh;
    }

    form {
        display: flex;
        flex-direction: column;
        gap: 15px;
        width: 700px;
    }

    form .form-group {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        gap: 25px;
    }

    form .form-group label {
        font-size: 20px;
        background-color: #D9D9D9;
        color: #000;
        padding: 15px;
        width: 30%;
        font-weight: 700;
    }

    form .form-group input,
    form .form-group select {
        color: #000;
        width: 70%;
        height: 50px;
        font-size: 20px;
    }

    form .form-group button {
        padding: 25px;
        color: #000;
        background-color: #D9D9D9;
        border-radius: 10px;
        border: none;
        cursor: pointer;
        font-weight: 700;
        font-size: 16px;
    }

    form .form-group button:hover {
        background-color: #000;
        color: #D9D9D9;
    }
</style>
<body>
<jsp:include page="NavBarBack.jsp" />
<div class="content">
    <form action="eventPartner" method="POST" onsubmit="return validateForm()">
        <div class="form-group">
            <label for="name">Partner Name:</label>
            <input type="text" name="partnerName" id="name" required>
        </div>
        <div class="form-group">
            <label for="partnerType">Select Partnership Type:</label>
                <select name="partnerType" id="partnerType">
                <option value="">Select Partner</option>
                <option value="food">Food and Beverage</option>
                <option value="table">Tables and Chairs</option>
                <option value="dj">Local DJ</option>
                <option value="deco">Decorations</option>
            </select>
        </div>
        <div class="form-group">
            <button type="submit">Add Partner</button>
        </div>
    </form>
    <script>
        function validateForm() {
            const partnerType = document.getElementById("partnerType").value;
            if (partnerType === "") {
                alert("Please select a partnership type.");
                return false;
            }
            return true;
        }
    </script>
</div>
</body>
</html>
