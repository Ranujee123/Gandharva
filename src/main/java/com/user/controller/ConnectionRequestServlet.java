package com.user.controller;

import com.user.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ConnectionRequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String fromUserEmail = (String) session.getAttribute("userEmail");
        String toUserEmail = request.getParameter("toUserEmail");


        // Debugging output to check IDs
        System.out.println("From User ID: " + fromUserEmail); // Should not be null
        System.out.println("To User ID: " + toUserEmail); // Should not be zero or null


        try {
            int fromUserId = UserDBUtil.getUserIdByEmail(fromUserEmail);
            int toUserId = UserDBUtil.getUserIdByEmail(toUserEmail);

            if (fromUserId == -1 || toUserId == -1) {
                response.sendRedirect("errorPage.jsp?message='Invalid user email'");
                return;
            }

            boolean isSuccess = UserDBUtil.addConnectionRequest(String.valueOf(fromUserId), String.valueOf(toUserId));
            if (isSuccess) {
                response.sendRedirect("u_dashboard.jsp");
            } else {
                response.sendRedirect("errorPage.jsp?message='Failed to send connection request'");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp?message='Internal error occurred'");
        }
    }
}