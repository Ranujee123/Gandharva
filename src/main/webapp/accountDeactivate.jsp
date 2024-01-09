<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-11-01
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        body {
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f0f0f0;
        }

        .form-container button {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        .popup {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        .popup-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
        }

        .error {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="sidebar.jsp" />
<div class="main-content">
    <h1>Deactivate Account</h1>
    <div class="form-container">
        <input type="checkbox" id="temporaryDeactivate"> Temporary Deactivate<br>
        <input type="checkbox" id="permanentDeactivate"> Permanent Deactivate<br>
        <button type="button" onclick="showPopup()">Deactivate Account</button>
        <div class="error" id="error-message"></div>
    </div>
    <div class="popup" id="popup">
        <div class="popup-content">
            <p>Are you sure you want to deactivate your account?</p>
            <button onclick="confirmDeactivate()">Yes</button>
            <button onclick="closePopup()">No</button>
        </div>
    </div>

    <script>
        function showPopup() {
            var temporaryDeactivate = document.getElementById("temporaryDeactivate").checked;
            var permanentDeactivate = document.getElementById("permanentDeactivate").checked;
            var errorMessage = document.getElementById("error-message");

            errorMessage.innerHTML = ""; // Reset error message

            if (!temporaryDeactivate && !permanentDeactivate) {
                errorMessage.innerHTML = "Please select an option to deactivate your account.";
            } else {
                document.getElementById("popup").style.display = "flex";
            }
        }

        function closePopup() {
            document.getElementById("popup").style.display = "none";
        }

        function confirmDeactivate() {
            // Perform account deactivation logic here (e.g., delete from database)
            alert("Account deactivated successfully!");
            // Redirect to a new page after deactivation
            window.location.href = "deactivation-success.jsp";
        }
    </script>
</div>

</body>
</html>
