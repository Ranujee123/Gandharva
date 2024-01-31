package com.user.controller;


import java.io.IOException;
import java.util.List;

import com.user.model.User;
import com.user.model.UserDBUtil;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet
public class DeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");



        if (userEmail == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if session expired or user not logged in
            return;
        }

        boolean isDeleted = UserDBUtil.deleteUser(userEmail);

        if (isDeleted) {
            session.invalidate(); // Invalidate the session after deletion
            response.sendRedirect("u_reg.jsp"); // Redirect to login or home page
        }
        else {

            request.setAttribute("errorMessage", "User deletion failed.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("u_myprofile.jsp");
            dispatcher.forward(request, response);
        }



    }

}

