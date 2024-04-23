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
    private static final long serialVersionUID = 2L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null || userEmail.isEmpty()) {
            response.sendRedirect("login.jsp");
            return;
        }

        int uID;
        try {
            uID = UserDBUtil.getUserIdByEmail(userEmail);
            if (uID == -1) {
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
        String qualification = request.getParameter("qualification");
        String school = request.getParameter("school");
        String occupation = request.getParameter("occupation");
        String foodpreferences = request.getParameter("foodPreferences");
        String drinking = request.getParameter("drinking");
        String smoking = request.getParameter("smoking");
        String diffabled = request.getParameter("diffabled");

        boolean isUpdated = UserDBUtil.updateUserInfo(uID, ethnicity, religion, caste, status, height, qualification,school, occupation, foodpreferences, drinking, smoking, diffabled);

        if (isUpdated) {
            List<User> updatedUserInfo = UserDBUtil.getUserInfo(uID); // Assuming getUserInfo now accepts uID
            if (!updatedUserInfo.isEmpty()) {
                session.setAttribute("userDetails", updatedUserInfo.get(0));
                request.setAttribute("userDetails", updatedUserInfo);
            }
            RequestDispatcher dis = request.getRequestDispatcher("editpersonalInfo.jsp");
            dis.forward(request, response);
        } else {
            System.out.println("Error: User update failed for email: " + userEmail);
            List<User> getUserInfo = UserDBUtil.getUserInfo(uID);
            request.setAttribute("userDetails", getUserInfo);
            RequestDispatcher dis = request.getRequestDispatcher("u_myprofile.jsp");
            dis.forward(request, response);
        }
    }
}
