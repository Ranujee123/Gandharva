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


@WebServlet
public class DeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        boolean isTrue;


        isTrue = UserDBUtil.deleteUser(email);

        if (isTrue == true) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("u_reg.jsp");
            dispatcher.forward(request, response);
        }
        else {

            List<User> userDetails = UserDBUtil.getUserDetails(email);
            request.setAttribute("userDetails", userDetails);

            RequestDispatcher dispatcher = request.getRequestDispatcher("u_myprofile.jsp");
            dispatcher.forward(request, response);
        }



    }

}

