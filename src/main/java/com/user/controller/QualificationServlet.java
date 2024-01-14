package com.user.controller;

import com.user.model.DBConnect;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet
public class QualificationServlet extends HttpServlet {

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

            String school = request.getParameter("school");
            String eduQualification = request.getParameter("eduquali");
            String occupation = request.getParameter("occupation");

            System.out.println("School: " + school); // Debug print
            System.out.println("Edu Qualification: " + eduQualification); // Debug print
            System.out.println("Occupation: " + occupation); // Debug print

            // Get user ID, qualification ID, and occupation ID
            int uID = getUserIdByEmail(userEmail);
            int qID = getQualificationIdByName(eduQualification);
            int oID = getOccupationIdByName(occupation);

            // Save the details to the database
            saveDetailsToDatabase(uID, qID, oID, school);

            response.sendRedirect("family.jsp"); // Redirect to a success page
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("unsuccess.jsp"); // Redirect to an error page
        }
    }

    // Helper method to get uID from the user table based on the email
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

    // Helper method to get qID from the qualification table based on the qualification name
    private int getQualificationIdByName(String qualification) throws Exception {
        Connection con = DBConnect.getConnection();
        String sql = "SELECT qID FROM qualification WHERE qualification = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setString(1, qualification);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("qID");
                }
            }
        }
        return -1; // Handle the case when no qID is found
    }

    // Helper method to get oID from the occupation table based on the occupation name
    private int getOccupationIdByName(String occupation) throws Exception {
        Connection con = DBConnect.getConnection();
        String sql = "SELECT oID FROM occupation WHERE occupation = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setString(1, occupation);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("oID");
                }
            }
        }
        return -1; // Handle the case when no oID is found
    }

    // Helper method to save the details to the database
    private void saveDetailsToDatabase(int uID, int qID, int oID, String school) throws Exception {
        Connection con = DBConnect.getConnection();
        String sql = "INSERT INTO userdetails (uID, qID, oID, school) VALUES (?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setInt(1, uID);
            preparedStatement.setInt(2, qID);
            preparedStatement.setInt(3, oID);
            preparedStatement.setString(4, school);
            preparedStatement.executeUpdate();
        }
    }
}
