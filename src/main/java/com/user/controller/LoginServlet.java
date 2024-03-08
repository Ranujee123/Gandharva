package com.user.controller;

import com.user.model.User;
import com.user.model.UserDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        password = String.valueOf(password.hashCode());

        try {
            // Validate the user
            List<User> userDetails = UserDBUtil.validate(email, password);

            // Check if the validation was successful
            if (!userDetails.isEmpty()) {
                req.setAttribute("userDetails", userDetails);

                // Set userEmail in session
                HttpSession session = req.getSession();
                session.setAttribute("userEmail", email);

                // Calculate and set profile completion status
                updateProfileCompletionStatus(session, email);

                RequestDispatcher dis = req.getRequestDispatcher("u_dashboard.jsp");
                dis.forward(req, resp);
            } else {
                // Handle invalid login (redirect to login page, show error message, etc.)
                req.setAttribute("errorMessage", "Invalid email or password");
                RequestDispatcher dis = req.getRequestDispatcher("/login.jsp");
                dis.forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle other exceptions as needed
            RequestDispatcher dis = req.getRequestDispatcher("/error.jsp");
            dis.forward(req, resp);
        }
    }
        private void updateProfileCompletionStatus(HttpSession session, String userEmail) {
            // Assume these methods return true if the respective section is completed
            boolean personalDetailsCompleted = UserDBUtil.isPersonalDetailsCompleted(userEmail);
            boolean qualificationCompleted = UserDBUtil.isQualificationDetailsCompleted(userEmail);
            boolean familyDetailsCompleted = UserDBUtil.isFamilyDetailsCompleted(userEmail);
            boolean interestCompleted = UserDBUtil.isInterestCompleted(userEmail);
            boolean interestedINCompleted = UserDBUtil.isInterestedINCompleted(userEmail);
            boolean interestedINQualCompleted = UserDBUtil.isInterestedINQualCompleted(userEmail);
            boolean interestedINFamDetailsCompleted = UserDBUtil.isinterestedINFamDetailsCompleted(userEmail);


            int completedSteps = (personalDetailsCompleted ? 1 : 0) +(qualificationCompleted ? 1 : 0) + (familyDetailsCompleted ? 1 : 0) + (interestCompleted ? 1 : 0) + (interestedINCompleted ? 1 : 0) + (interestedINQualCompleted ? 1 : 0) + (interestedINFamDetailsCompleted ? 1 : 0);
            int totalSteps = 7;
            int completionPercentage = (completedSteps * 100) / totalSteps;

            session.setAttribute("completedSteps", completedSteps);
            session.setAttribute("totalSteps", totalSteps);
            session.setAttribute("completionPercentage", completionPercentage);
        }
    }
