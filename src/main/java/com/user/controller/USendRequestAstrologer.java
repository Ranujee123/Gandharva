package com.user.controller;

import com.user.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

@MultipartConfig
public class USendRequestAstrologer extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null) {
            System.out.println("No user email found in session, redirecting to login.");
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int userId = UserDBUtil.getUserIdByEmail(userEmail);
            System.out.println("User ID retrieved from DB: " + userId);

            Part horoscopePart = request.getPart("horoscope");
            Part horoscopeSecondPart = request.getPart("horoscopeSecond");

            byte[] horoscope = convertPartToBytes(horoscopePart);
            byte[] horoscopeSecond = convertPartToBytes(horoscopeSecondPart);

            if (horoscope == null || horoscopeSecond == null) {
                System.out.println("Failed to convert parts to bytes, one of the files may be missing.");
                response.sendRedirect("errorPage.jsp?message='Missing file data'");
                return;
            }

            boolean insertSuccess = UserDBUtil.insertNewRequest(userId, horoscope, horoscopeSecond);
            if (insertSuccess) {
                System.out.println("Request successfully inserted.");
                response.sendRedirect("sucess.jsp");
            } else {
                System.out.println("Failed to insert the request into the database.");
                response.sendRedirect("errorPage.jsp?message='Failed to submit request'");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error occurred: " + e.getMessage());
            response.sendRedirect("errorPage.jsp?message='Database error occurred'");
        }
    }



    private byte[] convertPartToBytes(Part part) throws IOException {
        if (part == null) {
            return null;
        }
        try (InputStream inputStream = part.getInputStream();
             ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            return outputStream.toByteArray();
        }
    }
}
