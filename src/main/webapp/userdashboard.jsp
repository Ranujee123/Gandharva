<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-10-31
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Assuming you have set these variables in your servlet or some other way -->
<c:set var="fname" value="John"/>
<c:set var="lname" value="Doe"/>
<c:set var="email" value="john.doe@example.com"/>
<c:set var="password" value="secretpassword"/>

<html>
<head>
  <title>User Dashboard</title>
</head>
<body>
<!-- Rest of your code -->

<c:url value="editProfile.jsp" var="userUpdate">
  <c:param name="fname" value="${fname}"/>
  <c:param name="lname" value="${lname}"/>
  <c:param name="email" value="${email}"/>
  <c:param name="password" value="${password}"/>
</c:url>

<a href="${userUpdate}">
  <input type="button" name="update" value="updateMydata">
</a>

<!-- Rest of your code -->
</body>
</html>


</body>
</html>


