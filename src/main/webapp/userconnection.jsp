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
      display: flex;
      flex-direction: column;
      align-items: center;
      width: calc(100% - 120px);
      margin-left: 100px;
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
  <c:if test="${not empty requests}">
    <ul>
      <c:forEach var="request" items="${requests}">
        <li class="request-item">
          <div class="request-details">
            Request from ${request.fromUserFullName} to ${request.toUserFullName} - Status: ${request.status}
          </div>
          <div class="buttons">
            <form method="post" action="${pageContext.request.contextPath}/updateConnectionStatus">
              <input type="hidden" name="requestId" value="${request.requestId}" />
              <c:choose>
                <c:when test="${request.status eq 'PENDING'}">
                  <button type="submit" name="action" value="Accept" class="connect-button">Accept</button>
                  <button type="submit" name="action" value="Reject" class="reject-button">Reject</button>
                </c:when>
                <c:otherwise>
                  <span class="connect-status">Accepted</span>
                </c:otherwise>
              </c:choose>
            </form>
          </div>
        </li>
      </c:forEach>
    </ul>
  </c:if>
  <c:if test="${empty requests}">
    <p>No connection requests found.</p>
  </c:if>
</div>
</body>
</html>
