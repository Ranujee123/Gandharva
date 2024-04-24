<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-22
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Your Matches</title>
    <link rel="stylesheet" type="text/css" href="u_style.css">
</head>
<body>
<h1>Potential Matches</h1>
<div>
    <c:if test="${not empty matches}">
        <c:forEach items="${matches}" var="user">
            <div class="profile-card">


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
</body>
</html>
