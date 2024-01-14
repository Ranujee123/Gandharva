package com.user.controller;

import com.user.model.DBConnect;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet
public class FamilyDetails extends HttpServlet {

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

            String fathername = request.getParameter("fatherName");
            String freli = request.getParameter("fatherReligion");
            String foccu = request.getParameter("fatherOccupation");
            String mothername = request.getParameter("motherName");
            String mreli = request.getParameter("motherReligion");

            String moccup = request.getParameter("motherOccupation");
            String maritalstatus = request.getParameter("maritalStatus");
            String siblings = request.getParameter("numberOfSiblings");


            // Validate and parse siblings count
            try {
                int siblingsCount = Integer.parseInt(siblings);
                // Use siblingsCount in the saveFamilyDetailsToDatabase method

                System.out.println("Father Name: " + fathername); // Debug print
                System.out.println("Mother Name: " + mothername); // Debug print
                System.out.println("Father Occupation: " + foccu); // Debug print
                System.out.println("Number of Siblings: " + siblingsCount); // Debug print


                // Rest of your code...

                boolean isTrue = saveFamilyDetailsToDatabase(userEmail, fathername, freli, foccu, mothername, mreli, moccup, maritalstatus, String.valueOf(siblingsCount));
                int uID = getUserIdByEmail(userEmail);


                if (isTrue) {
                    response.sendRedirect("pricing.jsp"); // Redirect to a success page
                } else {
                    response.sendRedirect("unsuccess.jsp"); // Redirect to an error page
                }
            } catch (NumberFormatException e) {
                // Handle the case where numberOfSiblings is not a valid integer
                e.printStackTrace();
                response.sendRedirect("unsuccess.jsp"); // Redirect to an error page
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("unsuccess.jsp"); // Redirect to an error page
        }
    }

    private int getUserIdByEmail(String email) throws Exception {
        Connection con = DBConnect.getConnection();
        String sql = "SELECT uID FROM user WHERE email = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setString(1, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("uID");
                }
            }
        }
        return -1; // Handle the case when no uID is found
    }
    // Helper method to save family details to the database
// Helper method to save family details to the database
    private boolean saveFamilyDetailsToDatabase(String userEmail, String fathername, String freli, String foccu,
                                                String mothername, String mreli, String moccup, String maritalstatus, String siblings) {



        try {
            // Get uID from the user table based on the email
            int uID = getUserIdByEmail(userEmail);

            // Save the family details to the database
            Connection con = DBConnect.getConnection();
            String sql = "INSERT INTO fdetails (uID, fathername, freli, foccu, mothername, mreli, moccup, maritalstatus, siblings) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, uID);
                preparedStatement.setString(2, fathername);
                preparedStatement.setString(3, freli);
                preparedStatement.setString(4, foccu);
                preparedStatement.setString(5, mothername);
                preparedStatement.setString(6, mreli);
                preparedStatement.setString(7, moccup);
                preparedStatement.setString(8, maritalstatus);
                preparedStatement.setString(9, siblings);
                preparedStatement.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error saving family details: " + e.getMessage()); // Print error message
            return false;
        }
    }

    // Helper method to get uID from the user table based on the email

    }

