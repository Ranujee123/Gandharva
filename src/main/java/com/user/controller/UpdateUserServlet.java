package com.user.controller;

import com.user.model.User;
import com.user.model.UserDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
    //  String bday = request.getParameter("bday");
        String nic=request.getParameter("nic");
        //String cID = request.getParameter("cID");
        String phonenumber=request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String province = request.getParameter("province"); // Assuming the dropdown has the name "province"

        Part dpphotoPart = request.getPart("dpphoto");
     //   int isVerified=request.getParameter("isVerified");



        byte[] dpPhoto = convertPartToByteArray(dpphotoPart);


        boolean isTrue = UserDBUtil.updateUser(firstName, lastName, nic, province, phonenumber, dpPhoto,email);


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

    private byte[] convertPartToByteArray(Part filePart) throws IOException {
        if (filePart == null) {
            return null;
        }

        InputStream inputStream = filePart.getInputStream();
        byte[] bytes = new byte[(int) filePart.getSize()];
        inputStream.read(bytes);
        return bytes;
    }


}







