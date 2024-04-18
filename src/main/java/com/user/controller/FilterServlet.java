package com.user.controller;

import com.user.model.User;
import com.user.model.UserDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class FilterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String province = request.getParameter("province");
        String ethnicity = request.getParameter("ethnicity");
        String religion = request.getParameter("religion");
        String status=request.getParameter("status");
        String height=request.getParameter("height");
        String foodpreferences= request.getParameter("foodpreferences");
        String drinking= request.getParameter("drinking");
        String smoking= request.getParameter("smoking");
        String eduquali=request.getParameter("eduquali");
        String occupation=request.getParameter("occupation");
        String diffabled= request.getParameter("diffabled");


        // Call the model to get filtered users, excluding the current user
        List<User> filteredUsers = UserDBUtil.getFilteredUsers(province, ethnicity, religion, status,height,foodpreferences,drinking,smoking,eduquali,occupation,diffabled,userEmail);

        request.setAttribute("filteredUsers", filteredUsers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("u_dashboard.jsp"); // Adjust if necessary
        dispatcher.forward(request, response);
    }


}
