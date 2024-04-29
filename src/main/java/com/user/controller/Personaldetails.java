package com.user.controller;

import com.user.model.UserDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@MultipartConfig
public class Personaldetails extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Assuming session management and retrieval of userEmail is correctly done
            HttpSession session = request.getSession();
            String userEmail = (String) session.getAttribute("userEmail");

            if (userEmail == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Retrieve and validate form data
            String ethnicity = request.getParameter("ethnicity");
            String religion = request.getParameter("religion");
            String caste=request.getParameter("caste");
            String otherCaste = request.getParameter("other_caste");
            String status = request.getParameter("status");
            String height = request.getParameter("height");
            String foodPreference = request.getParameter("foodpreferences");
            String drinking = request.getParameter("drinking");
            String smoking = request.getParameter("smoking");
            String diffabled = request.getParameter("diffabled");

// Determine the actual caste value to store
            if ("Other".equals(caste) && otherCaste != null && !otherCaste.isEmpty()) {
                caste = otherCaste;
            }


            // Save personal details to database
            boolean isSaved = UserDBUtil.savePersonalDetailsToDatabase(userEmail, ethnicity, religion,caste, status, height, foodPreference, drinking, smoking, diffabled);
            if (isSaved) {
                session.setAttribute("personalDetailsCompleted", true);
                response.sendRedirect("ProfileCompletionServlet"); // Redirect to the next step or confirmation page
            } else {
                request.setAttribute("errorMessage", "Failed to save personal details. Please try again.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/errorPage.jsp"); // Adjust the redirection as needed
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Server error occurred. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/errorPage.jsp");
            dispatcher.forward(request, response);
        }
    }

}