package com.user.controller;

import com.user.model.UserDBUtil;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;

public class Oppositeuseremail extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Assuming userId is stored as UUID in session, convert it to String properly
        UUID userId = (UUID) session.getAttribute("userId"); // Retrieve as UUID
        String requestIdParam = request.getParameter("requestId");
        int requestId = Integer.parseInt(requestIdParam); // Convert to integer to handle the request ID

        try {
            // Convert UUID to String before passing it to the method
            String oppositeUserEmail = UserDBUtil.getOppositeUserEmail(requestId, userId.toString());
            if (oppositeUserEmail != null) {
                request.setAttribute("email", oppositeUserEmail);
                request.getRequestDispatcher("/moredetails").forward(request, response);
            } else {
                request.setAttribute("error", "Opposite user not found.");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp?message='Database error occurred'");
        }
    }
}