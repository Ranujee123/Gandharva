package com.user.controller;

import com.user.constants.UserType;
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
        UserType userType = (UserType) session.getAttribute("userType");  // Correctly retrieve as UserType

        if (currentUserEmail == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            String currentUserGender = UserDBUtil.getUsergenderByEmail(currentUserEmail);
            Integer currentUserAge = UserDBUtil.getUserAgeByEmail(currentUserEmail);

            if (currentUserGender == null || currentUserAge == null) {
                request.setAttribute("errorMessage", "Incomplete user profile. Please update your profile information.");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                return;
            }

            String currentUserId = UserDBUtil.getUserIdByEmail(currentUserEmail);
            List<User> matchedUsers = UserDBUtil.findMatchingUsers(currentUserId, currentUserGender, currentUserAge);

            // Check the user type for conditional logic
            boolean isPremiumUser = userType == UserType.PREMIUM_USER;
            if (!isPremiumUser && matchedUsers.size() > 3) {
                matchedUsers = matchedUsers.subList(0, 3);
                request.setAttribute("showMore", true);  // Signal to show 'View More' button
            }

            request.setAttribute("matchedUsers", matchedUsers);
            request.setAttribute("isPremiumUser", isPremiumUser);  // Use boolean for easier handling in JSP

            RequestDispatcher dispatcher = request.getRequestDispatcher("matches.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving matched profiles: " + e.getMessage());
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }
}
