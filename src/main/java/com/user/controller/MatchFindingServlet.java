/*package com.user.controller;

import com.user.model.User;
import com.user.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class MatchFindingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null || userEmail.isEmpty()) {
            response.sendRedirect("login.jsp"); // Redirect to login if no user is logged in
            return;
        }

        try {
            List<User> matches = UserDBUtil.getPotentialMatches(userEmail);
            request.setAttribute("matches", matches);
            if (matches == null || matches.isEmpty()) {
                request.setAttribute("message", "No matches found.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving matches: " + e.getMessage());
        }

        request.getRequestDispatcher("matches.jsp").forward(request, response);
    }
}
*/