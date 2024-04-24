package com.user.controller;

import com.user.model.ConnectionRequest;
import com.user.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet

public class UpdateConnectionStatusServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String requestId = request.getParameter("requestId");
        String action = request.getParameter("action");

        if (requestId == null || action == null) {
            response.sendRedirect("errorPage.jsp?message='Missing parameters'");
            return;
        }

        boolean isSuccess = UserDBUtil.updateConnectionRequestStatus(requestId, action);

        if (isSuccess) {
            // Fetch the latest list of requests after the update
            String userId = null;
            try {
                userId = UserDBUtil.getUserIdByEmail(userEmail);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            List<ConnectionRequest> requests = null;
            try {
                requests = UserDBUtil.getConnectionRequestStatus(userId);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            request.setAttribute("requests", requests);
            request.getRequestDispatcher("/userconnection.jsp").forward(request, response);
        } else {
            response.sendRedirect("errorPage.jsp?message='Unable to update request status'");
        }
    }
}
