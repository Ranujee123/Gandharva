package com.user.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.model.UserDBUtil;
import com.user.model.User;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;

@WebServlet("/SendAstroReq")
@MultipartConfig
public class SendAstroReq extends HttpServlet {
    String userId = "";
    String astrologerId = "";
    String userImage = "";

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req = setServiceDetails(req);

            RequestDispatcher dis = req.getRequestDispatcher("sendingReqAstorologer.jsp");
            dis.forward(req, resp);

        } catch (Exception e) {
            // e.printStackTrace();
            System.err.println(e.getMessage());
            RequestDispatcher dis = req.getRequestDispatcher("error.jsp");
            dis.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	req = setServiceDetails(req);
    	
    	String deadline = req.getParameter("deadline");

        boolean invalidDeadline = false;
        if (deadline == null || deadline.isEmpty()) {
            req.setAttribute("errorMessage", "Deadline is required. Please select a deadline.");
            invalidDeadline = true;
        } else {
            try {
            	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                Date deadlineDate = formatter.parse(deadline);
                Date currentDate = new Date();
                
                if (deadlineDate.before(currentDate)) {
                    req.setAttribute("errorMessage", "Invalid deadline. Please select a future date.");
                    invalidDeadline = true;
                }
            } catch (Exception e) {
            	System.err.println(e.getMessage());
                req.setAttribute("errorMessage", "Invalid deadline. Please select a valid date.");
                invalidDeadline = true;
            }
        }

        if (invalidDeadline) {
            RequestDispatcher dispatcher = req.getRequestDispatcher("sendingReqAstorologer.jsp");
            dispatcher.forward(req, resp);
            return;
        }

        boolean isInserted = false;

        try {
            isInserted = UserDBUtil.insertNewRequest(userId, astrologerId, deadline);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (isInserted) {
            req.setAttribute("successMessage", "Request sent");
        } else {
            req.setAttribute("errorMessage", "Error sending request. Please try again.");
        }

        RequestDispatcher dis = req.getRequestDispatcher("sendingReqAstorologer.jsp");
        dis.forward(req, resp);
    }
    
    private HttpServletRequest setServiceDetails(HttpServletRequest req) {
    	// get the user id from the session
        userId = req.getSession().getAttribute("userId").toString();

        // get the astrologer id from the request
        astrologerId = req.getParameter("id");

        User user = UserDBUtil.getUserDetails(astrologerId).get(0);
        req.setAttribute("astrologer", user);

        try {
            byte[] imageData = user.getDpphoto();
            if (imageData != null && imageData.length > 0) {
                String base64Image = Base64.getEncoder().encodeToString(imageData);
                userImage = "data:image/jpeg;base64," + base64Image;
            } else {
                // Set a default image URL if userImage is null
                userImage = "images/no-profile.png"; // or you can set a default value here if required
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            req.setAttribute("userImage", userImage);
        }
        
        return req;
    }
}
