package com.user.controller;

import com.user.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class InterestedINfam extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String userEmail = (String) session.getAttribute("userEmail");

            if (userEmail == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            String freli = request.getParameter("freli");
            String foccu = request.getParameter("foccu");
            String mreli = request.getParameter("mreli");
            String moccup = request.getParameter("moccup");
            String maritalstatus = request.getParameter("maritalstatus");
            int siblings = Integer.parseInt(request.getParameter("siblings"));

            // Fetch the user ID as a String
            String id = UserDBUtil.getUserIdByEmail(userEmail);

            // Pass the ID as a String to your DB utility method
            if (UserDBUtil.saveinterestedINFamDetailsToDatabase(id, freli, foccu, mreli, moccup, maritalstatus, siblings)) {
                session.setAttribute("interestedINFamDetailsCompleted", true);
                response.sendRedirect("ProfileCompletionServlet");
            } else {
                response.sendRedirect("unsuccess.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("unsuccess.jsp");
        }
    }
}
