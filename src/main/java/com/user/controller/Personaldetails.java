package com.user.controller;

import com.user.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Personaldetails extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     try {
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null) {
            response.sendRedirect("login.jsp");
            return;
        }


        String ethnicity = request.getParameter("ethnicity");
        String religion = request.getParameter("religion");
        String status = request.getParameter("status");
        String height = request.getParameter("height");
        String foodPreference = request.getParameter("foodpreferences");
        String drinking = request.getParameter("drinking");
        String smoking = request.getParameter("smoking");
        String diffabled = request.getParameter("diffabled");

        if (UserDBUtil.savePersonalDetailsToDatabase(userEmail,  ethnicity, religion,  status, height, foodPreference, drinking,smoking,diffabled)) {
            session.setAttribute("personalDetailsCompleted", true);
            response.sendRedirect("ProfileCompletionServlet");
        } else {
            response.sendRedirect("unsuccess.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("unsuccess.jsp");
    }

}
}



