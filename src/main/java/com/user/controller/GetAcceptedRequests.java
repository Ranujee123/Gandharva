package com.user.controller;

import com.user.model.ConnectionRequest;
import com.user.model.UserDBUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

@WebServlet
public class GetAcceptedRequests extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            String userId = UserDBUtil.getUserIdByEmail(userEmail);
            List<ConnectionRequest> acceptedRequests = UserDBUtil.getAcceptedConnectionDetails(userId);
            request.setAttribute("acceptedRequests", acceptedRequests != null ? acceptedRequests : new ArrayList<>());
            request.getRequestDispatcher("ViewAcceptedReqU.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("acceptedRequests", new ArrayList<>());
            request.getRequestDispatcher("/errorPage.jsp?message='Unable to fetch accepted requests'").forward(request, response);
        }
    }
}