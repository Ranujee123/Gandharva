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
            String status = request.getParameter("status");
            String height = request.getParameter("height");
            String foodPreference = request.getParameter("foodpreferences");
            String drinking = request.getParameter("drinking");
            String smoking = request.getParameter("smoking");
            String diffabled = request.getParameter("diffabled");

            Part filePartDP = request.getPart("dpphoto");
            String uploadsDirPath = "/Users/ranu/Desktop/untitled folder 4/Gandharva/src/main/webapp/DP"; // Update this path
            String dpphoto = uploadPhoto(filePartDP, uploadsDirPath, request, response);
            if (dpphoto == null) {
                // Error handling already done inside uploadPhoto
                return; // Stop processing if there was an error uploading the photo
            }

            // Save personal details to database
            boolean isSaved = UserDBUtil.savePersonalDetailsToDatabase(userEmail, ethnicity, religion, status, height, foodPreference, drinking, smoking, diffabled, dpphoto);
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

    private String uploadPhoto(Part filePart, String uploadsDirPath, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (filePart == null || filePart.getSubmittedFileName().isEmpty()) {
            request.setAttribute("errorMessage", "Profile picture is required. Please select a file to upload.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/errorPage.jsp");
            dispatcher.forward(request, response);
            return null;
        }

        String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String newFileName = System.currentTimeMillis() + "_" + originalFileName;

        File uploadsDir = new File(uploadsDirPath);
        if (!uploadsDir.exists() && !uploadsDir.mkdirs()) {
            request.setAttribute("errorMessage", "Server error: unable to create directory for file upload.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/errorPage.jsp");
            dispatcher.forward(request, response);
            return null;
        }

        String photoPath = uploadsDirPath + File.separator + newFileName;
        filePart.write(photoPath);

        return newFileName;
    }
}
