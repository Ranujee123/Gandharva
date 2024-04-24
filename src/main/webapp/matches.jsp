<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-22
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Matched Profiles</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Ensure you link to your CSS for styling -->
</head>
<body>
<h1>Matched Profiles</h1>
<c:if test="${not empty matchedUsers}">
    <div class="profile-container">
        <c:forEach items="${matchedUsers}" var="user">
            <div class="profile">
                <h2>${user.firstName} ${user.lastName}</h2>
                <p>Email: ${user.email}</p>
                <p>Age: ${user.age}</p>
                <p>Province: ${user.province}</p>
                <!-- Additional user details can be listed here -->
            </div>
        </c:forEach>
    </div>
</c:if>
<c:if test="${empty matchedUsers}">
    <p>No profiles matched your criteria.</p>
</c:if>
</body>
</html>
