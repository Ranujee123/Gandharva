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

public class UpdateUserPersonalInfo extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null || userEmail.isEmpty()) {
            response.sendRedirect("login.jsp");
            return;
        }

        String id;
        try {
            id = UserDBUtil.getUserIdByEmail(userEmail);
            if (id == null) {
                System.out.println("User ID not found for the email: " + userEmail);
                response.sendRedirect("login.jsp");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to retrieve user ID: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("errorPage.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Fetch all parameters
        String ethnicity = request.getParameter("ethnicity");
        String religion = request.getParameter("religion");
        String caste = request.getParameter("caste");
        String status = request.getParameter("status");
        String height = request.getParameter("height");
        String foodpreferences = request.getParameter("foodpreferences");
        String drinking = request.getParameter("drinking");
        String smoking = request.getParameter("smoking");
        String diffabled = request.getParameter("diffabled");
        String qualification = request.getParameter("qualification");
        String occupation = request.getParameter("occupation");
        String school = request.getParameter("school");


        System.out.println("Updating with ID: " + id + " and data: Ethnicity=" + ethnicity + ", Religion=" + religion + ", etc.");



        boolean isUpdated = UserDBUtil.updateUserInfo(id, ethnicity, religion, caste, status, height, foodpreferences, drinking, smoking, diffabled, qualification, occupation, school);

        if (isUpdated) {
            List<User> updatedUserInfo = UserDBUtil.getUserInfo(id); // Assuming getUserInfo now accepts id
            if (!updatedUserInfo.isEmpty()) {
                session.setAttribute("userDetails", updatedUserInfo.get(0));
                request.setAttribute("userDetails", updatedUserInfo);
            }
            RequestDispatcher dis = request.getRequestDispatcher("editpersonalInfo.jsp");
            dis.forward(request, response);
        } else {
            System.out.println("Error: User update failed for email: " + userEmail);
            List<User> getUserInfo = UserDBUtil.getUserInfo(id);
            request.setAttribute("userDetails", getUserInfo);
            RequestDispatcher dis = request.getRequestDispatcher("u_myprofile.jsp");
            dis.forward(request, response);
        }
    }
}
