<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-11-02
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Chat Room</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
    function refreshMessages() {
      const senderId = '<%=request.getParameter("userId")%>';
      const receiverId = '<%=request.getParameter("receiverId")%>';
      $.get('LoadMessages', {senderId: senderId, receiverId: receiverId}, function(responseText) {
        $('#messages').html(responseText);
      });
    }

    $(document).ready(function() {
      setInterval(refreshMessages, 3000); // Refresh messages every 3 seconds

      $('#sendMessage').click(function() {
        var message = $('#message').val();
        const senderId = '<%=request.getParameter("userId")%>';
        const receiverId = '<%=request.getParameter("receiverId")%>';
        $.post('ChatStore', {senderId: senderId, receiverId: receiverId, message: message}, function(responseText) {
          $('#message').val(''); // Clear the message input after sending
          refreshMessages(); // Refresh messages to include the new one
        });
      });
    });
  </script>
</head>
<body>
<div id="messages" style="height: 300px; overflow: auto;"></div>
<textarea id="message"></textarea>
<button id="sendMessage">Send</button>
</body>
</html>
