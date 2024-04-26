package com.user.controller;

import com.user.model.DBConnect;
import com.user.model.UserListModel;
import com.user.model.payment_admin_model;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Objects;

public class Payments_admin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String view = "false";
        try {
            view = req.getParameter("astro");
        }catch (Exception e){
            e.printStackTrace();
        }



        List<payment_admin_model> paymentlist = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        if(Objects.equals(view, "true")){
            try {
                connection = DBConnect.getConnection();
                String query = "select * from astrologer_payments join user on user.id=astrologer_payments.asrtologerID;";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    payment_admin_model user = new payment_admin_model();
                    user.setUserid(resultSet.getString("id"));
                    user.setFirstName(resultSet.getString("firstName"));
                    user.setLastName(resultSet.getString("lastName"));
                    user.setEmail(resultSet.getString("email"));
                    user.setUserType(resultSet.getString("userType"));
                    user.setCountryOfResidence(resultSet.getString("countryOfResidence"));
                    user.setNumberOfCasesHandled(resultSet.getString("numberOfCasesHandled"));
                    user.setYearsOfExperience(resultSet.getString("yearsOfExperience"));
                    user.setBirthday(resultSet.getString("birthday"));
                    user.setNic(resultSet.getString("nic"));
                    user.setDistrict(resultSet.getString("district"));
                    user.setAmount(resultSet.getString("amount"));
                    byte[] imageData = resultSet.getBytes("userImage");
                    if (imageData != null && imageData.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(imageData);
                        user.setBase64Image("data:image/jpeg;base64,"+ base64Image);
                    }else {
                        // Set a default image URL if userImage is null
                        user.setBase64Image("images/no-profile.png"); // or you can set a default value here if required
                    }
                    DecimalFormat df = new DecimalFormat("#.##");
                    user.setPayamount(df.format(Double.parseDouble(user.getAmount()) / 1.2));




                    paymentlist.add(user);
                }

                // Set user list as attribute to be accessed in JSP
                req.setAttribute("userList", paymentlist);

                req.getRequestDispatcher("/payments_admin_Astrologer.jsp").forward(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
                // Handle the exception appropriately
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving payments list");
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
        }else {
            try {
                connection = DBConnect.getConnection();
                String query = "SELECT paymentDate,paymentMethod,paymentAmount,payment_reason FROM payment order by paymentDate desc";
                statement = connection.prepareStatement(query);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    payment_admin_model payment = new payment_admin_model();
                    payment.setPaymentDate(resultSet.getString("paymentDate"));
                    payment.setPaymentMethod(resultSet.getString("paymentMethod"));
                    payment.setPaymentAmount(resultSet.getString("paymentAmount"));
                    payment.setPayment_reason(resultSet.getString("payment_reason"));



                    paymentlist.add(payment);
                }

                // Set user list as attribute to be accessed in JSP
                req.setAttribute("paymentlist", paymentlist);
                req.getRequestDispatcher("/payments_admin.jsp").forward(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
                // Handle the exception appropriately
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving payments list");
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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uid = req.getParameter("uid");

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        System.out.println("email: " + uid);

        try {
            connection = DBConnect.getConnection();
            String query = "update astrologer_payments set amount=0 where asrtologerID =?";
            statement = connection.prepareStatement(query);
            statement.setString(1, uid);
            statement.executeUpdate();
            resp.setContentType("text/plain");
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
