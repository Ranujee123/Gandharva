package com.user.controller;

import com.user.model.DBConnect;
import com.user.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class ChatStore extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String senderId = request.getParameter("senderId");
        String receiverId = request.getParameter("receiverId");
        String message = request.getParameter("message");

        try (Connection connection = DBConnect.getConnection();
             PreparedStatement ps = connection.prepareStatement("INSERT INTO messages (sender_id, receiver_id, message, message_time) VALUES (?, ?, ?, NOW())")) {
            ps.setInt(1, Integer.parseInt(senderId));
            ps.setInt(2, Integer.parseInt(receiverId));
            ps.setString(3, message);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.getWriter().write("Message failed to send.");
        }
    }
}
