package com.user.controller;


import com.user.model.ComplaintsModel;
import com.user.model.DBConnect;
import com.user.model.UserListModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class ComplaintsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("ComplaintsController doGet() called");
        String query = null;

        if (req.getParameter("id") != null) {
            query = "SELECT  c.*, u.firstName,  u.lastName,  u.email,  u.userType,  u.countryOfResidence,  u.userImage,  u2.firstName AS receiver_firstName,  u2.lastName AS receiver_lastName,  u2.email AS receiver_email,  u2.userType AS receiver_userType,  u2.countryOfResidence AS receiver_countryOfResidence,  u2.district AS receiver_district,  u2.nic AS receiver_nic,  u2.birthday AS receiver_birthday,  u2.numberOfCasesHandled AS receiver_numberOfCasesHandled,  u2.yearsOfExperience AS receiver_yearsOfExperience,   u2.userImage AS receiver_userImage, (SELECT COUNT(*) FROM user_reports WHERE c.to_user_id = c.to_user_id) AS receiver_complaint_count FROM  user_reports c  JOIN  user u ON u.id = c.from_user_id  JOIN  user u2 ON u2.id = c.to_user_id where  c.to_user_id = \'"+req.getParameter("id")+"\'  ORDER BY  c.status ASC;";

        } else {
            query = "SELECT  c.*, u.firstName,  u.lastName,  u.email,  u.userType,  u.countryOfResidence,  u.userImage,  u2.firstName AS receiver_firstName,  u2.lastName AS receiver_lastName,  u2.email AS receiver_email,  u2.userType AS receiver_userType,  u2.countryOfResidence AS receiver_countryOfResidence,  u2.district AS receiver_district,  u2.nic AS receiver_nic,  u2.birthday AS receiver_birthday,  u2.numberOfCasesHandled AS receiver_numberOfCasesHandled,  u2.yearsOfExperience AS receiver_yearsOfExperience,   u2.userImage AS receiver_userImage, (SELECT COUNT(*) FROM user_reports WHERE c.to_user_id = c.to_user_id) AS receiver_complaint_count FROM  user_reports c  JOIN  user u ON u.id = c.from_user_id  JOIN  user u2 ON u2.id = c.to_user_id ORDER BY  c.status ASC;";
        }

        List<ComplaintsModel> complaint = new ArrayList<>();

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DBConnect.getConnection();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                ComplaintsModel complaints = new ComplaintsModel();
                complaints.setIdcomplaints(resultSet.getInt("report_id"));
                complaints.setUserid(resultSet.getString("from_user_id"));
                complaints.setDate(resultSet.getString("timestamp"));
                complaints.setTitle(resultSet.getString("reason"));

                complaints.setStatus(resultSet.getString("status"));
                complaints.setFirstName(resultSet.getString("firstName"));
                complaints.setLastName(resultSet.getString("lastName"));
                complaints.setEmail(resultSet.getString("email"));
                complaints.setCountryOfResidence(resultSet.getString("countryOfResidence"));
                complaints.setUserType(resultSet.getString("userType"));
                byte[] imageData = resultSet.getBytes("userImage");
                if (imageData != null && imageData.length > 0) {
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                    complaints.setBase64Image("data:image/jpeg;base64,"+ base64Image);
                }else {
                    // Set a default image URL if userImage is null
                    complaints.setBase64Image("images/no-profile.png"); // or you can set a default value here if required
                }
                imageData = resultSet.getBytes("receiver_userImage");
                if (imageData != null && imageData.length > 0) {
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                    complaints.setReceiver_userImage("data:image/jpeg;base64,"+ base64Image);
                }else {
                    // Set a default image URL if userImage is null
                    complaints.setReceiver_userImage("images/no-profile.png"); // or you can set a default value here if required
                }
                complaints.setReceiver_firstName(resultSet.getString("receiver_firstName"));
                complaints.setReceiver_lastName(resultSet.getString("receiver_lastName"));
                complaints.setReceiver_email(resultSet.getString("receiver_email"));
                complaints.setReceiver_countryOfResidence(resultSet.getString("receiver_countryOfResidence"));
                complaints.setReceiver_userType(resultSet.getString("receiver_userType"));
                complaints.setReceiver_district(resultSet.getString("receiver_district"));
                complaints.setReceiver_nic(resultSet.getString("receiver_nic"));
                complaints.setReceiver_birthday(resultSet.getString("receiver_birthday"));
                complaints.setReceiver_numberOfCasesHandled(resultSet.getString("receiver_numberOfCasesHandled"));
                complaints.setReceiver_yearsOfExperience(resultSet.getString("receiver_yearsOfExperience"));
                complaints.setReceiver_complaint_count(resultSet.getString("receiver_complaint_count"));
                complaints.setReceiverid(resultSet.getString("to_user_id"));

                complaint.add(complaints);
            }

            // Set user list as attribute to be accessed in JSP
            req.setAttribute("complaints", complaint);
            req.getRequestDispatcher("/handle_complaints.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving user list");
        } finally {
            // Close resources in a finally block to ensure they are closed even if an exception occurs
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("ComplaintsController doPost() called");
        String id = req.getParameter("id");
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = DBConnect.getConnection();
            String query = "UPDATE user_reports SET status = 'Resolved' WHERE report_id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, id);
            statement.executeUpdate();

            resp.setStatus(HttpServletResponse.SC_OK);
            resp.setContentType("text/plain");
            resp.getWriter().write("Complaint status updated successfully");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating complaint status");
        } finally {
            // Close resources in a finally block to ensure they are closed even if an exception occurs
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
