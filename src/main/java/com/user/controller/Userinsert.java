package com.user.controller;

import com.user.model.UserDBUtil;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;

@MultipartConfig
public class Userinsert extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {




// Parse the birthday from the request and calculate age
        String bday = req.getParameter("birthday");
        LocalDate biday = LocalDate.parse(bday, DateTimeFormatter.ISO_LOCAL_DATE);
        LocalDate today = LocalDate.now();
        int age = Period.between(biday, today).getYears();

        if (age < 18) {
            req.setAttribute("errorMessage", "You must be at least 18 years old to register.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/u_reg.jsp");
            dispatcher.forward(req, resp);
            return; // Stop the execution
        }
// Continue with registration process if age is 18 or above



        String fname = req.getParameter("firstName");
        String lname = req.getParameter("lastName");

        String country = req.getParameter("country");
        int cID = -1; // Default or error value, assuming your IDs are positive integers
        try {
            cID = UserDBUtil.getCountryIdByName(country);
        } catch (Exception e) {
            e.printStackTrace();
            // Consider handling this error more gracefully
        }

        // Check if a valid gender ID was retrieved
        if (cID == -1) {
            req.setAttribute("errorMessage", "Invalid country selected.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/u_reg.jsp");
            dispatcher.forward(req, resp);
            return;
        }
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String cpassword = req.getParameter("confirmPassword");
        String gender = req.getParameter("gender");
        int gID = -1; // Default or error value, assuming your IDs are positive integers
        try {
            gID = UserDBUtil.getgenderIdByName(gender);
        } catch (Exception e) {
            e.printStackTrace();
            // Consider handling this error more gracefully
        }

        // Check if a valid gender ID was retrieved
        if (gID == -1) {
            req.setAttribute("errorMessage", "Invalid gender selected.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/u_reg.jsp");
            dispatcher.forward(req, resp);
            return;
        }

        // Check if passwords match
        if (!password.equals(cpassword)) {
            req.setAttribute("errorMessage", "Passwords do not match. Please try again.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/u_reg.jsp");
            dispatcher.forward(req, resp);
            return;
        }

        Part filePartFront = req.getPart("frontphoto");
        Part filePartBack = req.getPart("backphoto");

        String frontphoto = uploadPhoto(filePartFront, "/Users/ranu/Desktop/untitled folder 4/Gandharva/src/main/webapp/PhotoID(F)", req, resp);
        String backphoto = uploadPhoto(filePartBack, "/Users/ranu/Desktop/untitled folder 4/Gandharva/src/main/webapp/PhotoID(B)", req, resp);

        if (frontphoto == null || backphoto == null) {
            // Error handling is already done inside uploadPhoto
            return; // Stop processing if there was an error uploading photos
        }

        password = String.valueOf(password.hashCode()); // Consider a more secure hashing method

        boolean isInserted = UserDBUtil.insertUser(fname, lname, bday, cID, email, frontphoto, backphoto, password,gID);

        if (isInserted) {
            RequestDispatcher dis = req.getRequestDispatcher("login.jsp");
            dis.forward(req, resp);
        } else {
            req.setAttribute("errorMessage", "Registration failed. Please try again.");
            RequestDispatcher dis2 = req.getRequestDispatcher("/u_reg.jsp");
            dis2.forward(req, resp);
        }
    }

    private String uploadPhoto(Part filePart, String uploadsDirPath, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (filePart == null || filePart.getSubmittedFileName().isEmpty()) {
            req.setAttribute("errorMessage", "All photos are required. Please select files to upload.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/u_reg.jsp");
            dispatcher.forward(req, resp);
            return null; // Indicate error
        }

        String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        // Generate a unique file name by appending a timestamp
        String newFileName = System.currentTimeMillis() + "_" + originalFileName;


       // String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        File uploadsDir = new File(uploadsDirPath);
        if (!uploadsDir.exists() && !uploadsDir.mkdirs()) {
            System.err.println("Failed to create directory for file uploads.");
            req.setAttribute("errorMessage", "Server error: unable to create directory for file upload.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/u_reg.jsp");
            dispatcher.forward(req, resp);
            return null; // Indicate error
        }

        String photoIDPath = uploadsDirPath + File.separator + newFileName;
        filePart.write(photoIDPath); // Save the file

        return newFileName; // Return the file name for database storage
    }
}


