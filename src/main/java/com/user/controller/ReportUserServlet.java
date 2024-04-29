package com.user.controller;

import com.user.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ReportUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String fromUserEmail = (String) session.getAttribute("userEmail");
        String toUserEmail = request.getParameter("toUserEmail");

        String reason = request.getParameter("reason");

        if (fromUserEmail == null || toUserEmail == null || fromUserEmail.isEmpty() || toUserEmail.isEmpty()) {
            // Redirecting to the error page with an appropriate message if the emails are invalid
            response.sendRedirect("errorPage.jsp?message='Invalid user email'");
            return;
        }


        try {
            String fromUserId = UserDBUtil.getUserIdByEmail(fromUserEmail);
            String toUserId = UserDBUtil.getUserIdByEmail(toUserEmail);

            // Check if either user ID is null, indicating the email did not correspond to a user
            if (fromUserId == null || toUserId == null) {
                response.sendRedirect("errorPage.jsp?message='User not found'");
                return;
            }


            boolean isSuccess = UserDBUtil.addUserReport(fromUserId, toUserId, reason, "REPORTED");
            if (isSuccess) {
                response.sendRedirect("u_dashboard.jsp");
            } else {
                response.sendRedirect("errorPage.jsp?message='Failed to report user'");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}