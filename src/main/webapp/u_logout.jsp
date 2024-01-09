<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-11-03
  Time: 00:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Logout Confirmation</title>
  <style>
    body {
      background-color: #f0f0f0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .confirmation-message {
      text-align: center;
      font-size: 24px;
      background-color: #ffffff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    .confirmation-buttons {
      margin-top: 20px;
    }
    .logout-button, .cancel-button {
      background-color: #ff3333;
      color: white;
      border: none;
      padding: 10px 20px;
      font-size: 18px;
      border-radius: 5px;
      cursor: pointer;
      margin: 0 10px;
    }
  </style>
</head>
<body>
<div class="confirmation-message">
  <p>Are you sure you want to log out?</p>
  <div class="confirmation-buttons">
    <form action="logout" method="post">
      <input type="hidden" name="confirmed" value="true">
      <button class="logout-button" type="submit">Yes</button>
    </form>
    <a href="javascript:history.go(-1);" class="cancel-button">No</a>
  </div>
</div>
</body>
</html>
