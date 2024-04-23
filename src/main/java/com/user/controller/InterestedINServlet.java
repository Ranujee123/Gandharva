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
                // Log or print the value of userEmail here for debugging
                System.out.println("User email is null");
                response.sendRedirect("login.jsp"); // Redirect to the login page or an appropriate page
                return; // Stop further processing
            }

            System.out.println("User email: " + userEmail); // Debug print

            int minAge= Integer.parseInt(request.getParameter("minAge"));
            int maxAge= Integer.parseInt(request.getParameter("maxAge"));
            String religion = request.getParameter("religion");
            String caste = request.getParameter("caste");
            String ethnicity = request.getParameter("ethnicity");
            String province = request.getParameter("province");


            // Get user ID, qpersonality ID

            int uID = UserDBUtil.getUserIdByEmail(userEmail);




            // Save the details to the database

            if (UserDBUtil.saveInterestedInDetails( uID,minAge,maxAge,religion,caste,ethnicity, province)) {
                session.setAttribute("interestedINCompleted", true);
                response.sendRedirect("ProfileCompletionServlet");
            } else {
                response.sendRedirect("unsuccess.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("unsuccess.jsp");
        }


    }
}





