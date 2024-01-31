package com.user.controller;

import com.user.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet
public class ProfileCompletionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String action = request.getParameter("action");


        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        // Handle "Save Progress" action
        if ("save".equals(action)) {
            response.sendRedirect("u_myprofile.jsp");
            return;
        }


        boolean qualificationCompleted = UserDBUtil.isQualificationDetailsCompleted(userEmail);
        boolean familyDetailsCompleted = UserDBUtil.isFamilyDetailsCompleted(userEmail);
        boolean interestCompleted = UserDBUtil.isInterestCompleted(userEmail);
        boolean interestedINCompleted = UserDBUtil.isInterestedINCompleted(userEmail);
        boolean interestedINQualCompleted = UserDBUtil.isInterestedINQualCompleted(userEmail);
        boolean interestedINFamDetailsCompleted = UserDBUtil.isinterestedINFamDetailsCompleted(userEmail);





        if (!qualificationCompleted) {
            response.sendRedirect("addDetails.jsp");
        } else if (!familyDetailsCompleted) {
            response.sendRedirect("family.jsp");
        }
        else if (!interestCompleted) {
            response.sendRedirect("interest.jsp");

        } else if (!interestedINCompleted) {
                response.sendRedirect("interestedIN.jsp");

        } else if (!interestedINQualCompleted) {
            response.sendRedirect("interestINqual.jsp");

        }else if (!interestedINFamDetailsCompleted) {
                response.sendRedirect("interestedINfam.jsp");
        }else {
            response.sendRedirect("u_myprofile.jsp");
        }
    }
}
