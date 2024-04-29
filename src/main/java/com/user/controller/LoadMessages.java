package com.user.controller;

import com.user.model.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoadMessages extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String senderId = request.getParameter("senderId");
        String receiverId = request.getParameter("receiverId");
        response.setContentType("text/html;charset=UTF-8");

        try (Connection connection = DBConnect.getConnection();
             PreparedStatement ps = connection.prepareStatement("SELECT * FROM messages WHERE (sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?) ORDER BY message_time ASC")) {
            ps.setInt(1, Integer.parseInt(senderId));
            ps.setInt(2, Integer.parseInt(receiverId));
            ps.setInt(3, Integer.parseInt(receiverId));
            ps.setInt(4, Integer.parseInt(senderId));
            ResultSet rs = ps.executeQuery();

            StringBuilder output = new StringBuilder();
            while (rs.next()) {
                output.append("<p><b>").append(rs.getString("sender_id")).append(": </b>").append(rs.getString("message")).append("</p>");
            }
            response.getWriter().write(output.toString());
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.getWriter().write("Failed to load messages.");
        }
    }
}
