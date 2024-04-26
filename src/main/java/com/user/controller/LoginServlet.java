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
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

@WebServlet
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        try {
            password = hashPassword(password);  // Hash the password using SHA-256 and base64
        } catch (NoSuchAlgorithmException e) {
            req.setAttribute("errorMessage", "Failed to secure the password.");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        try {
            // Validate the user
			List<User> userDetails = UserDBUtil.validate(email, password);

            // Check if the validation was successful
            if (!userDetails.isEmpty()) {
                User user = userDetails.get(0); // Assuming the first user is the correct one

                // Set userEmail and userId in session
                HttpSession session = req.getSession();
                session.setAttribute("userEmail", email);
                session.setAttribute("userId", user.getId());// Assuming User class has getId method
                session.setAttribute("userType", user.getUserType());


                // Calculate and set profile completion status
                updateProfileCompletionStatus(session, email);

                RequestDispatcher dis = req.getRequestDispatcher("u_myprofile.jsp");
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

        int completedSteps = (personalDetailsCompleted ? 1 : 0) +
                (qualificationCompleted ? 1 : 0) +
                (familyDetailsCompleted ? 1 : 0) +
                (interestCompleted ? 1 : 0) +
                (interestedINCompleted ? 1 : 0) +
                (interestedINQualCompleted ? 1 : 0) +
                (interestedINFamDetailsCompleted ? 1 : 0);
        int totalSteps = 7;
        int completionPercentage = (completedSteps * 100) / totalSteps;

        session.setAttribute("completedSteps", completedSteps);
        session.setAttribute("totalSteps", totalSteps);
        session.setAttribute("completionPercentage", completionPercentage);
    }

    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hashedBytes = digest.digest(password.getBytes(java.nio.charset.StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(hashedBytes);
    }

}
