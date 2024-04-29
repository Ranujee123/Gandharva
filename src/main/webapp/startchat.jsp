<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.user.model.User, com.user.model.UserDBUtil, java.util.List" %>
<html>
<head>
  <title>The Chat Room</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <script type="text/javascript" src="js/check.js"></script>
  <title>The Chat Room</title>
  <link rel="shortcut icon" href="icon.jpeg" />
  <script>
    setInterval(reloaddata, 3000);
  </script>
</head>


<body>
<%
  String userEmail = (String) session.getAttribute("userEmail");
  User user = null;
  if (userEmail != null) {
    List<User> userDetails = UserDBUtil.getUserDetails(userEmail);
    if (userDetails != null && !userDetails.isEmpty()) {
      user = userDetails.get(0);
    }
  }
%>
<p id="result"></p>
Welcome, <%= user.getFname() %>
<div class="logout-div" align="right"><a href="logout.jsp" class="logout-chat">Logout</a></div>
<div id="list">
  <div id="content"></div>
  <input type="text" id="u" value="<%= user.getFname() %>" style="display: none">
  <textarea id="h" style="width: 100%; height: 10%;"></textarea>
  <input type="button" value="send" onclick="addText()" />
</div>
</body>
</html>
