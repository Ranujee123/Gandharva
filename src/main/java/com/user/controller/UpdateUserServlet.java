package com.user.controller;

import com.user.model.User;
import com.user.model.UserDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class UpdateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 2L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null || userEmail.isEmpty()) {
            response.sendRedirect("login.jsp");
            return;
        }

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String bday = request.getParameter("bday");
        String country = request.getParameter("country");
        String email = request.getParameter("email");
        String password = request.getParameter("password");



        boolean isTrue = UserDBUtil.updateUser(fname, lname, bday, country, email, password);

        if (isTrue) {
            // Fetch the updated user details
            List<User> updatedUserDetails = UserDBUtil.getUserDetails(email);

            // Check if updated user details are retrieved successfully
            if (!updatedUserDetails.isEmpty()) {
                // Update the session with the new user details
                session.setAttribute("userDetails", updatedUserDetails.get(0));
                request.setAttribute("userDetails", updatedUserDetails);
            }

            RequestDispatcher dis = request.getRequestDispatcher("u_myprofile.jsp");
            dis.forward(request, response);
        } else {
            System.out.println("Error: User update failed for email: " + email);

            // Fetch the original user details to display in case of failure
            List<User> userDetails = UserDBUtil.getUserDetails(userEmail);
            request.setAttribute("userDetails", userDetails);

            RequestDispatcher dis = request.getRequestDispatcher("u_myprofile.jsp");
            dis.forward(request, response);
        }
    }
}




