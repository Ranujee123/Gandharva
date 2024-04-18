package com.user.controller;

import com.user.model.ConnectionRequest;
import com.user.model.UserDBUtil;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class ViewPendingRequestsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String fromUserEmail = (String) session.getAttribute("userEmail");

        if (fromUserEmail == null) {
            response.sendRedirect("login.jsp");
            return;
        }



        try {
            int userId = UserDBUtil.getUserIdByEmail(fromUserEmail);
            System.out.println("User ID: " + userId);

            List<ConnectionRequest> pendingRequests = UserDBUtil.getPendingConnectionRequests(userId);
            System.out.println("Number of pending requests: " + pendingRequests.size());

            request.setAttribute("pendingRequests", pendingRequests);
            request.getRequestDispatcher("/pendingRequests.jsp").forward(request, response);


        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error while retrieving pending requests");
        }
    }
}