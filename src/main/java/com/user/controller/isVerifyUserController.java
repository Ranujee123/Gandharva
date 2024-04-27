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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet
public class isVerifyUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        if (userId == null || userId.isEmpty()) {
            request.setAttribute("error", "User ID is required");
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
            return;
        }

        boolean isVerified = UserDBUtil.isUserVerified(userId);
        request.setAttribute("isVerified", isVerified);
        request.setAttribute("userId", userId);

        String jspPage = request.getParameter("targetPage"); // Determine which JSP to forward to
        if ("myProfile".equals(jspPage)) {
            request.getRequestDispatcher("/u_myprofile.jsp").forward(request, response);
        } else if ("viewDetails".equals(jspPage)) {
            request.getRequestDispatcher("/view_user_details.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Invalid target page");
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
        }
    }


}
