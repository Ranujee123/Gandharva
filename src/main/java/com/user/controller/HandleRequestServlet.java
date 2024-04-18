package com.user.controller;

import com.user.model.UserDBUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

public class HandleRequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int requestId = Integer.parseInt(request.getParameter("requestId"));
        String action = request.getParameter("action");

        try {
            if (!action.equals("accept") && !action.equals("reject")) {
                throw new IllegalArgumentException("Invalid action specified");
            }
            UserDBUtil.updateConnectionRequestStatus(requestId, action);
            response.sendRedirect("pendingRequests"); // Redirect back to the pending requests page
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Database error while updating request status");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error processing your request");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }
}
