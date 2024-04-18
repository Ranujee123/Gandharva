<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-18
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.ConnectionRequest" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <title>Pending Connection Requests</title>
</head>
<body>
<h1>Pending Connection Requests</h1>
<c:if test="${empty pendingRequests}">
  <p>No pending requests.</p>
</c:if>
<c:if test="${not empty pendingRequests}">
  <ul>
    <c:forEach items="${pendingRequests}" var="request">
      <li>
        From user ID: ${request.fromUserId} - Status: ${request.status}
        <form action="handleRequest" method="post">
          <input type="hidden" name="requestId" value="${request.requestId}" />
          <button type="submit" name="action" value="accept">Accept</button>
          <button type="submit" name="action" value="reject">Reject</button>
        </form>
      </li>
    </c:forEach>
  </ul>
</c:if>
</body>
</html>
