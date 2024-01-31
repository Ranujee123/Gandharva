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

                RequestDispatcher dis = req.getRequestDispatcher("u_myprofile.jsp");
                dis.forward(req, resp);
            }
            else {
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
}
