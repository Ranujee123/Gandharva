package com.user.controller;

import com.user.model.User;
import com.user.model.UserDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class UpdateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String bday = request.getParameter("bday");
        String country = request.getParameter("country");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");

        // Retrieve existing user details
        List<User> existingUserDetails = UserDBUtil.getUserDetails(email);
        User existingUser = existingUserDetails.get(0);

        // Use existing values if corresponding form fields are not provided or empty
        if (fname == null || fname.isEmpty()) {
            fname = existingUser.getFname();
        }

        if (lname == null || lname.isEmpty()) {
            lname = existingUser.getLname();
        }

        if (bday == null || bday.isEmpty()) {
            bday = existingUser.getBday();
        }

        if (email == null || email.isEmpty()) {
            email = existingUser.getEmail();
        }

        if (password == null || password.isEmpty()) {
            password = existingUser.getPassword();
        }
        if (cpassword == null || cpassword.isEmpty()) {
            cpassword = existingUser.getCpassword();
        }





        // Repeat this for other fields as needed...

        boolean isTrue = UserDBUtil.updateUser(fname, lname, bday, country, email, password, cpassword);

        if (isTrue) {
            List<User> userDetails = UserDBUtil.getUserDetails(email);
            request.setAttribute("userDetails", userDetails);

            RequestDispatcher dis = request.getRequestDispatcher("u_myprofile.jsp");
            dis.forward(request, response);
        } else {
            // Handle the case where the update was not successful
            List<User> userDetails = UserDBUtil.getUserDetails(email);
            request.setAttribute("userDetails", userDetails);

            RequestDispatcher dis = request.getRequestDispatcher("u_myprofile.jsp");
            dis.forward(request, response);
        }
    }
}
