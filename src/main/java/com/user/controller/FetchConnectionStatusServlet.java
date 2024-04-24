package com.user.controller;

import com.user.model.ConnectionRequest;
import com.user.model.UserDBUtil;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class FetchConnectionStatusServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            String userId = UserDBUtil.getUserIdByEmail(userEmail);  // Get the user ID as a String
            List<ConnectionRequest> requests = UserDBUtil.getConnectionRequestStatus(userId);// Adjusted to accept String ID
            request.setAttribute("requests", requests != null ? requests : new ArrayList<>());

            List<ConnectionRequest> requests1 = UserDBUtil.getPendingReq(userId);  // Adjusted to accept String ID
            request.setAttribute("requests1", requests1 != null ? requests1 : new ArrayList<>());
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("requests", new ArrayList<>()); // Ensure requests is never null
            request.setAttribute("requests1", new ArrayList<>());
        }

        request.getRequestDispatcher("/userconnection.jsp").forward(request, response);
    }
}
