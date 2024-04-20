<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-19
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>


<!DOCTYPE html>
<html>

<head>
  <title>User profile </title>
</head>
<body>
<h2>Sent Requests</h2>
<c:if test="${empty sentRequests}">
  <p>You have no sent requests.</p>
</c:if>
<c:if test="${not empty sentRequests}">
  <ul>
    <c:forEach items="${sentRequests}" var="request">
      <li>Request to ${request.toUserFullName} - Status: ${request.status}</li>
    </c:forEach>
  </ul>
</c:if>

<h2>Received Requests</h2>
<c:if test="${empty receivedRequests}">
  <p>You have no received requests.</p>
</c:if>
<c:if test="${not empty receivedRequests}">
  <ul>
    <c:forEach items="${receivedRequests}" var="request">
      <li>Request from ${request.fromUserFullName} - Status: ${request.status}</li>
    </c:forEach>
  </ul>
</c:if>


</body>
</html>
