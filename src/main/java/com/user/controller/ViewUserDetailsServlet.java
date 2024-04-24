package com.user.controller;

import com.user.model.User;
import com.user.model.UserDBUtil;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Optional;

public class ViewUserDetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String currentUserEmail = (String) session.getAttribute("userEmail"); // Logged-in user's email
        String email = request.getParameter("email"); // Email of the user whose details are being viewed
        System.out.println("Current User Email: " + currentUserEmail);
        System.out.println("Email received for details: " + email);

        if (email == null || email.isEmpty()) {
            request.setAttribute("errorMessage", "Invalid email address!");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            return;
        }

        Optional<User> userOptional = UserDBUtil.getUserByEmail(email);
        if (!userOptional.isPresent()) {
            request.setAttribute("errorMessage", "No user found with the given email address!");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            return;
        }

        User user = userOptional.get();
        request.setAttribute("user", user);

        try {
            String fromUserId = UserDBUtil.getUserIdByEmail(currentUserEmail); // Now returns a String ID
            String toUserId = UserDBUtil.getUserIdByEmail(email); // Now returns a String ID
            boolean isPending = UserDBUtil.isConnectionRequestPending(fromUserId, toUserId);
            request.setAttribute("isConnectionRequestPending", isPending);

            request.getRequestDispatcher("u_moredetails.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp?message='Internal error occurred'");
        }
    }
}
