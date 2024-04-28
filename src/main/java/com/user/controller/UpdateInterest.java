package com.user.controller;

import com.user.model.User;
import com.user.model.UserDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class UpdateInterest extends HttpServlet {

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
            String personalitytype = request.getParameter("personalitytype");

            String id = UserDBUtil.getUserIdByEmail(userEmail);


            // Save the details to the database
            if (UserDBUtil.saveInterestDetails(id, interests, personalitytype)) {
                session.setAttribute("interestCompleted", true);
                // After updating, fetch the updated details to verify or display
                List<User> interestDetails = UserDBUtil.getInterestDetails(id);
                request.setAttribute("interestDetails", interestDetails);
                RequestDispatcher dispatcher = request.getRequestDispatcher("userSelectEdit.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("unsuccess.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("unsuccess.jsp");
        }
    }
}


