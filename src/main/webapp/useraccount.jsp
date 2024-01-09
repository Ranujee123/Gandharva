<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-01-03
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
  <c:forEach var="user" items="${userDetails}">
    <c:set var="fname" value="${user.fname}"/>
    <c:set var="lname" value="${user.lname}"/>
    <c:set var="bday" value="${user.bday}"/>
    <c:set var="country" value="${user.country}"/>
    <c:set var="email" value="${user.email}"/>
    <c:set var="password" value="${user.password}"/>
    <c:set var="cpassword" value="${user.cpassword}"/>


    <tr>
      <td>User first name</td>
      <td> ${user.fname}</td>
    </tr>
    <tr>
      <td>User last name</td>
      <td> ${user.lname}</td>
    </tr>
    <tr>
      <td>Birthday</td>
      <td> ${user.bday}</td>
    </tr>
    <tr>
      <td>Country</td>
      <td> ${user.country}</td>
    </tr>
    <tr>
      <td>User email</td>
      <td> ${user.email}</td>
    </tr>
    <tr>
      <td>Password</td>
      <td> ${user.password}</td>
    </tr>

    <tr>
      <td>Confirm Password</td>
      <td> ${user.cpassword}</td>
    </tr>

  </c:forEach>
</table>

<c:url value="updateuser.jsp" var="userupdate">
  <c:param name="fname" value="${fname}"/>
  <c:param name="lname" value="${lname}"/>
  <c:param name="bday" value="${bday}"/>
  <c:param name="country" value="${country}"/>
  <c:param name="email" value="${email}"/>
  <c:param name="password" value="${password}"/>
  <c:param name="cpassword" value="${cpassword}"/>
  
</c:url>

<a href="${userupdate}">
<input type="button" name="update" value="Update my data">
</a>
</body>
</html>
