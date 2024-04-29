package com.user.dao;

import com.user.database.DBConnection;
import com.user.model.astrologer.Payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class PaymentDAO {
    public static boolean addPaymentDetails(Payment payment) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
//        3- payment_method
//        7- authorization_token
//        8- payment_status
        String query = "INSERT INTO payment(id, paymentDate, paymentAmount, paymentStatus, cusFirstName, cusLastName, cusAddress, cusCity, statement, userId, Link_Id, payment_reason) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pst = connection.prepareStatement(query);

        pst.setString(1, payment.getId().toString());
        pst.setDate(2, payment.getPaymentDate());
        pst.setDouble(3, payment.getPaymentAmount());
        pst.setString(4, payment.getPaymentStatus());
        pst.setString(5, payment.getCusFirstName());
        pst.setString(6, payment.getCusLastName());
        pst.setString(7, payment.getCusAddress());
        pst.setString(8, payment.getCusCity());
        pst.setBytes(9, payment.getStatement());
        pst.setString(10, payment.getUserId().toString());
        pst.setString(11, payment.getLink_Id().toString());
        pst.setString(12, payment.getPayment_reason());

        System.out.println("Payment added!");

        return pst.executeUpdate() > 0;
    }

    public static List<Payment> getAllPaymentDetailsByUserId(String userId) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "SELECT id, paymentDate, paymentTime, paymentAmount, paymentStatus, cusFirstName, cusLastName, cusAddress, cusCity, statement, userId, Link_Id, payment_reason FROM payment WHERE userId = ? ORDER BY paymentDate ASC";
        PreparedStatement pst = connection.prepareStatement(query);
        pst.setString(1, userId);

        ResultSet resultSet = pst.executeQuery();
        List<Payment> physicalPaymentList = new ArrayList<>();

        while (resultSet.next()) {
            if (resultSet != null) {
                physicalPaymentList.add(
                        new Payment(
                                UUID.fromString(resultSet.getString(1)),
                                resultSet.getDate(2),
                                resultSet.getTime(3),
                                resultSet.getDouble(4),
                                resultSet.getString(5),
                                resultSet.getString(6),
                                resultSet.getString(7),
                                resultSet.getString(8),
                                resultSet.getString(9),
                                resultSet.getBytes(10),
                                UUID.fromString(resultSet.getString(11)),
                                UUID.fromString(resultSet.getString(12)),
                                resultSet.getString(13)
                        )
                );
            }
        }
        return physicalPaymentList;
    }

    public static List<Payment> getAllPaymentDetailsByRequestId(String requestId) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "SELECT id, paymentDate, paymentTime, paymentAmount, paymentStatus, cusFirstName, cusLastName, cusAddress, cusCity, statement, userId, Link_Id, payment_reason FROM payment WHERE Link_Id = ? ORDER BY paymentDate DESC";
        PreparedStatement pst = connection.prepareStatement(query);
        pst.setString(1, requestId);

        ResultSet resultSet = pst.executeQuery();
        List<Payment> physicalPaymentList = new ArrayList<>();

        while (resultSet.next()) {
            if (resultSet != null) {
                physicalPaymentList.add(
                        new Payment(
                                UUID.fromString(resultSet.getString(1)),
                                resultSet.getDate(2),
                                resultSet.getTime(3),
                                resultSet.getDouble(4),
                                resultSet.getString(5),
                                resultSet.getString(6),
                                resultSet.getString(7),
                                resultSet.getString(8),
                                resultSet.getString(9),
                                resultSet.getBytes(10),
                                UUID.fromString(resultSet.getString(11)),
                                UUID.fromString(resultSet.getString(12)),
                                resultSet.getString(13)
                        )
                );
            }
        }
        return physicalPaymentList;
    }
}
