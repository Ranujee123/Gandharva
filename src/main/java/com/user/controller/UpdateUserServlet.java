package com.user.controller;

import com.user.model.User;
import com.user.model.UserDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@MultipartConfig
public class UpdateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 2L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null || userEmail.isEmpty()) {
            response.sendRedirect("login.jsp");
            return;
        }

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
    //  String bday = request.getParameter("bday");
        String idNumber=request.getParameter("idNumber");
        //String cID = request.getParameter("cID");
        String email = request.getParameter("email");
        String provinceName = request.getParameter("province"); // Assuming the dropdown has the name "province"





        Part filePartDP = request.getPart("dpphoto");
        String uploadsDirPath = "/Users/ranu/Desktop/untitled folder 4/Gandharva/src/main/webapp/DP"; // Update this path
        String dpphoto = uploadPhoto(filePartDP, uploadsDirPath, request, response);
        if (dpphoto == null) {
            // Error handling already done inside uploadPhoto
            return; // Stop processing if there was an error uploading the photo
        }


        boolean isTrue = UserDBUtil.updateUser(fname, lname, idNumber, provinceName, email, dpphoto);


        if (isTrue) {
            // Fetch the updated user details
            List<User> updatedUserDetails = UserDBUtil.getUserDetails(email);

            // Check if updated user details are retrieved successfully
            if (!updatedUserDetails.isEmpty()) {
                // Update the session with the new user details
                session.setAttribute("userDetails", updatedUserDetails.get(0));
                request.setAttribute("userDetails", updatedUserDetails);
            }

            RequestDispatcher dis = request.getRequestDispatcher("u_myprofile.jsp");
            dis.forward(request, response);
        } else {
            System.out.println("Error: User update failed for email: " + email);

            // Fetch the original user details to display in case of failure
            List<User> userDetails = UserDBUtil.getUserDetails(userEmail);
            request.setAttribute("userDetails", userDetails);

            RequestDispatcher dis = request.getRequestDispatcher("u_myprofile.jsp");
            dis.forward(request, response);
        }
    }

    private String uploadPhoto(Part filePart, String uploadsDirPath, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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







