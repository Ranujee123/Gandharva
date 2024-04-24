package com.user.controller;

import com.user.model.User;
import com.user.model.UserDBUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class MatchedUsersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String currentUserEmail = (String) session.getAttribute("userEmail");

        if (currentUserEmail == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if no email is found in session
            return;
        }

        try {
            String currentUserGender = UserDBUtil.getUsergenderByEmail(currentUserEmail);
            Integer currentUserAge = UserDBUtil.getUserAgeByEmail(currentUserEmail); // Changed to return Integer

            if (currentUserGender == null || currentUserAge == null) {
                request.setAttribute("errorMessage", "Incomplete user profile. Please update your profile information.");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                return;
            }

            List<User> matchedUsers = UserDBUtil.findMatchingUsers(currentUserEmail, currentUserGender, currentUserAge);
            request.setAttribute("matchedUsers", matchedUsers);
            RequestDispatcher dispatcher = request.getRequestDispatcher("matches.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving matched profiles: " + e.getMessage());
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }
}
