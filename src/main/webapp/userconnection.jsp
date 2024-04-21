<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-19
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>


<%@ page import="java.util.List" %>
<%@ page import="com.user.model.ConnectionRequest" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="Final_Sidebar.jsp"/>

<!DOCTYPE html>
<html>
<head>
  <title>Connection Requests</title>

  <style>
    .container {
      margin-left: 100px;
      margin-top: 50px;
    }
    .request-item {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 10px;
      margin-bottom: 5px;
      background-color: #f0f0f0;
      border-radius: 5px;
    }
    .request-details {
      flex-grow: 1;
    }
    .buttons {
      display: flex;
    }
    .connect-button, .reject-button {
      padding: 10px 15px;
      margin-left: 10px;
      border-radius: 5px;
      cursor: pointer;
      color: white;
      font-weight: bold;
      text-transform: uppercase;
      border: none;
    }
    .connect-button {
      background-color: #4CAF50; /* Green for connect */
    }
    .reject-button {
      background-color: #f44336; /* Red for reject */
    }
  </style>
</head>

<body>
<div class="container">
  <h1>Your Connection Requests</h1>
  <ul>
    <c:if test="${not empty requests}">
      <c:forEach var="request" items="${requests}">
        <li class="request-item">
          <div class="request-details">
            Request ID: ${request.requestId} from User ID: ${request.fromUserId} to User ID: ${request.toUserId} - Status: ${request.status}
          </div>
          <div class="buttons">
            <div class="connect-button">Connect</div>
            <div class="reject-button">Reject</div>
          </div>
        </li>
      </c:forEach>
    </c:if>
    <c:if test="${empty requests}">
      <li>No connection requests found.</li>
    </c:if>
  </ul>

  <h2>Pending Requests Sent By You</h2>
  <ul>
    <c:if test="${not empty requests1}">
      <c:forEach var="pendingRequest" items="${requests1}">
        <li class="request-item">
          <div class="request-details">
            Request ID: ${pendingRequest.requestId} from User ID: ${pendingRequest.fromUserId} to User ID: ${pendingRequest.toUserId} - Status: ${pendingRequest.status}
          </div>
        </li>
      </c:forEach>
    </c:if>
    <c:if test="${empty requests1}">
      <li>No pending connection requests sent by you.</li>
    </c:if>
  </ul>
</div>





</body>
</html>
