package com.user.controller;

import com.google.gson.Gson;
import com.user.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class RequestStatusCount extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            String userId = UserDBUtil.getUserIdByEmail(userEmail);
            int newRequests = UserDBUtil.countNewRequests(userId);
            int pendingRequests = UserDBUtil.countPendingRequests(userId);
            int acceptedRequests = UserDBUtil.countAcceptedRequests(userId);

            Gson gson = new Gson();
            String jsonResponse = gson.toJson(new int[] {newRequests, pendingRequests, acceptedRequests});
            response.getWriter().write(jsonResponse);
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"Error fetching data.\"}");
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
