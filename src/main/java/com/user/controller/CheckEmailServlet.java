package com.user.controller;
import  com.user.model.UserDBUtil;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CheckEmailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        boolean isRegistered = UserDBUtil.isEmailRegistered(email);
        response.setContentType("text/plain");
        response.getWriter().write(String.valueOf(isRegistered));
    }
}

