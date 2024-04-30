package com.user.controller;

import com.user.model.AdminDashboardmodels;
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

public class AdminDashboardController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;


        try {
            connection = DBConnect.getConnection();
            String query = "SELECT count(CASE WHEN isActivated = 1 THEN 1 END) as total, COUNT(CASE WHEN userType = 'ASTROLOGER' THEN 1 END) AS astrologer_count, COUNT(CASE WHEN userType = 'STANDARD_USER' THEN 1 END) AS user_count, COUNT(CASE WHEN userType = 'PREMIUM_USER' THEN 1 END) AS premium_count, COUNT(CASE WHEN userType = 'EVENT_PLANNER' THEN 1 END) AS eventpalanner_count FROM user;";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            AdminDashboardmodels adminDashboardmodels = new AdminDashboardmodels();
            while (resultSet.next()) {
                adminDashboardmodels.setTotalUsers(resultSet.getInt("total"));
                adminDashboardmodels.setAstrologers(resultSet.getInt("astrologer_count"));
                adminDashboardmodels.setStanderdUsers(resultSet.getInt("user_count"));
                adminDashboardmodels.setPremiumUsers(resultSet.getInt("premium_count"));
                adminDashboardmodels.setEventPlanners(resultSet.getInt("eventpalanner_count"));
            }
            query = "SELECT payment_reason, SUM(paymentAmount) AS total_payment_amount FROM payment GROUP BY payment_reason;";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                if (resultSet.getString("payment_reason").equals("Astrologerpayment")) {
                    adminDashboardmodels.setPaymentAstrologers(resultSet.getInt("total_payment_amount"));
                } else if (resultSet.getString("payment_reason").equals("Eventplannerpayment")) {
                    adminDashboardmodels.setPaymentEvents(resultSet.getInt("total_payment_amount"));
                } else if (resultSet.getString("payment_reason").equals("Standardpayment")) {
                    adminDashboardmodels.setPaymentUsers(resultSet.getInt("total_payment_amount"));
                } else if (resultSet.getString("payment_reason").equals("Premiumpayment")) {
                    adminDashboardmodels.setPaymentPremiumUsers(resultSet.getInt("total_payment_amount"));
                }
            }


            req.setAttribute("adminDashboardmodels", adminDashboardmodels);

            req.getRequestDispatcher("/admin_Dashboard.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();

            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving list");
        } finally {

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
