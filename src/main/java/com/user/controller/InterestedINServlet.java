package com.user.controller;

import com.user.model.DBConnect;
import com.user.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class InterestedINServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve user information from the session
            HttpSession session = request.getSession();
            String userEmail = (String) session.getAttribute("userEmail");

            // Check if the user is authenticated
            if (userEmail == null) {
                System.out.println("User email is null");
                response.sendRedirect("login.jsp"); // Redirect to the login page
                return; // Stop further processing
            }

            System.out.println("User email: " + userEmail); // Debug print

            int minAge = Integer.parseInt(request.getParameter("minAge"));
            int maxAge = Integer.parseInt(request.getParameter("maxAge"));
            String religion = request.getParameter("religion");
            String caste = request.getParameter("caste");
            String otherCaste = request.getParameter("other_caste");
            String ethnicity = request.getParameter("ethnicity");
            String province = request.getParameter("province");


            if ("Other".equals(caste) && otherCaste != null && !otherCaste.isEmpty()) {
                caste = otherCaste;
            }


            // Get user ID
            String id = UserDBUtil.getUserIdByEmail(userEmail);

            // Save the details to the database
            if (UserDBUtil.saveInterestedInDetails(id, minAge, maxAge, religion, caste, ethnicity, province)) {
                session.setAttribute("interestedINCompleted", true);
                response.sendRedirect("ProfileCompletionServlet"); // Redirect to next part of profile completion
            } else {
                System.out.println("Failed to save interested in details for user ID: " + id);
                response.sendRedirect("unsuccess.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("unsuccess.jsp");
        }
    }
}