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
        List<ComplaintsModel> complaint = new ArrayList<>();

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DBConnect.getConnection();
            String query = "SELECT * FROM complaints c join user u on u.id= c.userid order by status DESC ;";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                ComplaintsModel complaints = new ComplaintsModel();
                complaints.setIdcomplaints(resultSet.getInt("idcomplaints"));
                complaints.setUserid(resultSet.getString("userid"));
                complaints.setDate(resultSet.getString("date"));
                complaints.setTitle(resultSet.getString("title"));
                complaints.setDescripion(resultSet.getString("descripion"));
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
            String query = "UPDATE complaints SET status = 'Closed' WHERE idcomplaints = ?";
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
