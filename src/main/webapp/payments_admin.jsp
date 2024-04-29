<%--suppress CssInvalidPropertyValue --%>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/6/2024
  Time: 5:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Admin Dashboard</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <link rel ="stylesheet" type="text/css" href="admin.css">
</head>
<style>
  .tagbar{
    width: 100%;
    display: flex;
    padding-top: 20px;
    padding-left: 120px;
    justify-content: start;
    gap: 20px;
  }
  .tagbar a{
    width: 200px;
    color: black;
    text-decoration: none;
    height: 30px;
    background-color: rgba(234, 234, 234, 0.7);
    align-items: center;
    justify-content: center;
    display: flex;
    border-radius: 20px;
    border: none;
  }
</style>
<body>

<%@ include file="sidebar_admin.jsp" %>

<div class="content">
  <h2>Payments</h2>
  <div class="tagbar">
    <a href="payments_admin">All Payments</a>
    <a href="payments_admin?astro=true">Astrologer Payments</a>
  </div>



  <div class="container">
    <table>
      <thead>
      <tr>
        <th>Date</th>
        <th>Method</th>
        <th>Amount</th>
        <th>Payment Type</th>
      </tr>
      </thead>

      <tbody>
      <c:forEach items="${paymentlist}" var="payment">
        <tr>
          <td>${payment.paymentDate}</td>
          <td>${payment.paymentMethod}</td>
          <td>${payment.paymentAmount}</td>
          <td>${payment.payment_reason}</td>


        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>



</body>
</html>
