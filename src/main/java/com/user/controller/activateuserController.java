package com.user.controller;

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

public class activateuserController extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<UserListModel> userList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;


        try {
            connection = DBConnect.getConnection();
            String query = "SELECT * FROM user_status us join user u on u.id = us.userID order by us.status asc";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                UserListModel user = new UserListModel();
                user.setId(resultSet.getString("id"));
                user.setFirstName(resultSet.getString("firstName"));
                user.setLastName(resultSet.getString("lastName"));
                user.setEmail(resultSet.getString("email"));
                user.setUserType(resultSet.getString("userType"));
                user.setCountryOfResidence(resultSet.getString("countryOfResidence"));
                user.setBirthday(resultSet.getDate("birthday"));
                user.setNumberOfCasesHandled(resultSet.getInt("numberOfCasesHandled"));
                user.setYearsOfExperience(resultSet.getInt("yearsOfExperience"));
                user.setBirthday(resultSet.getDate("birthday"));
                user.setNic(resultSet.getString("nic"));
                user.setDistrict(resultSet.getString("district"));
                user.setStat(resultSet.getString("status"));

                byte[] imageData = resultSet.getBytes("userImage");
                if (imageData != null && imageData.length > 0) {
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                    user.setBase64Image("data:image/jpeg;base64,"+ base64Image);
                }else {
                    // Set a default image URL if userImage is null
                    user.setBase64Image("images/no-profile.png"); // or you can set a default value here if required
                }

                byte[] certificateFile = resultSet.getBytes("certificateFileUpload");
                if (certificateFile != null && certificateFile.length > 0) {
                    String base64certificateFile = Base64.getEncoder().encodeToString(certificateFile);
                    user.setCertificateFileUpload("data:image/jpeg;base64,"+ base64certificateFile);
                }else {
                    user.setCertificateFileUpload(null);
                }

                byte[] brFile = resultSet.getBytes("brFileUpload");
                if (brFile != null && brFile.length > 0) {
                    String base64brFile = Base64.getEncoder().encodeToString(brFile);
                    user.setBrFileUpload("data:image/jpeg;base64,"+ base64brFile);
                }else {
                    user.setBrFileUpload(null);
                }

                userList.add(user);
            }

            // Set user list as attribute to be accessed in JSP
            req.setAttribute("userList", userList);
            req.getRequestDispatcher("/adminUserlist.jsp").forward(req, resp);
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
        String id = req.getParameter("id");
        String status = req.getParameter("status");
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DBConnect.getConnection();
            String query = "UPDATE user_status SET status = ? WHERE userID = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, status);
            statement.setString(2, id);
            statement.executeUpdate();
            resp.setStatus(HttpServletResponse.SC_OK);
            resp.getWriter().write("User status updated successfully");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating user status");
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
}
