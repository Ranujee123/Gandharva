package com.user.controller;


import com.user.model.ConnectionRequest;
import com.user.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class ViewRequestsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int userId = UserDBUtil.getUserIdByEmail(userEmail); // Assume this method throws SQLException
            List<ConnectionRequest> sentRequests = UserDBUtil.getSentConnectionRequests(userId); // Fetch sent requests
            List<ConnectionRequest> receivedRequests = UserDBUtil.getReceivedConnectionRequests(userId); // Fetch received requests

            request.setAttribute("sentRequests", sentRequests);
            request.setAttribute("receivedRequests", receivedRequests);
            request.getRequestDispatcher("/connection.jsp").forward(request, response); // Display in sidebar.jsp
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error while retrieving connection requests");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp?message='Internal server error'");
        }
    }
}
