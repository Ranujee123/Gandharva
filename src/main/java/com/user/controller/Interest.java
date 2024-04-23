package com.user.controller;

import com.user.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Interest extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve user information from the session
            HttpSession session = request.getSession();
            String userEmail = (String) session.getAttribute("userEmail");

            if (userEmail == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            System.out.println("User email: " + userEmail); // Debug print

            String interests = request.getParameter("interest");
            String ptype = request.getParameter("ptype");

            String id = UserDBUtil.getUserIdByEmail(userEmail);
            int pID = UserDBUtil.getPersonalityIdByName(ptype);

            // Save the details to the database
            if (UserDBUtil.saveInterestDetails(id, interests, pID)) {
                session.setAttribute("interestCompleted", true);
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
