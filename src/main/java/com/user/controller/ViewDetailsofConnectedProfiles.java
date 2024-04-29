package com.user.controller;

import com.user.constants.UserType;
import com.user.model.User;
import com.user.model.UserDBUtil;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Optional;

public class ViewDetailsofConnectedProfiles extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String currentUserEmail = (String) session.getAttribute("userEmail");
        UserType userType = (UserType) session.getAttribute("userType");
        String email = request.getParameter("email"); // Correctly retrieving email from the form submission

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
        request.getRequestDispatcher("connectedu_moredetails.jsp").forward(request, response);
    }
}
