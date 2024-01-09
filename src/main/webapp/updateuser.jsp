<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-01-03
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%

    String fname= request.getParameter("fname");
    String lname= request.getParameter("lname");
    String bday= request.getParameter("bday");
    String country= request.getParameter("country");
    String email= request.getParameter("email");
    String password= request.getParameter("password");
    String cpassword= request.getParameter("cpassword");


    %>

<form action="updateu" method="post">

    User first name <input type="text" name="fname" value=" <%= fname%> "><br>
    User last name <input type="text" name="lname" value="<%= lname%>"><br>
    User birthday <input type="text" name="bday" value="<%= bday%>"><br>
    Country <input type="text" name="country" value="<%= country%>"><br>
    Email <input type="text" name="email" value="<%= email%>"><br>
    Password <input type="password" name="password" value="<%= password%>"><br>
    Confirm Password <input type="cpassword" name="cpassword" value="<%= cpassword%>"><br>
    <input type="submit" name="submit" value="Update my data">

</form>
</body>
</html>
