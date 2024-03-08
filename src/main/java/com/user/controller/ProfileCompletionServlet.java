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


        boolean personalDetailsCompleted = UserDBUtil.isPersonalDetailsCompleted(userEmail);
        boolean qualificationCompleted = UserDBUtil.isQualificationDetailsCompleted(userEmail);
        boolean familyDetailsCompleted = UserDBUtil.isFamilyDetailsCompleted(userEmail);
        boolean interestCompleted = UserDBUtil.isInterestCompleted(userEmail);
        boolean interestedINCompleted = UserDBUtil.isInterestedINCompleted(userEmail);
        boolean interestedINQualCompleted = UserDBUtil.isInterestedINQualCompleted(userEmail);
        boolean interestedINFamDetailsCompleted = UserDBUtil.isinterestedINFamDetailsCompleted(userEmail);


        session.setAttribute("personalDetailsCompleted", personalDetailsCompleted);
        session.setAttribute("qualificationCompleted", qualificationCompleted);
        session.setAttribute("familyDetailsCompleted", familyDetailsCompleted);
        session.setAttribute("interestCompleted", interestCompleted);
        session.setAttribute("interestedINCompleted", interestedINCompleted);
        session.setAttribute("interestedINQualCompleted", interestedINQualCompleted);
        session.setAttribute("interestedINFamDetailsCompleted", interestedINFamDetailsCompleted);





        // Calculate completion percentage
        int completedSteps = 0;
        if (personalDetailsCompleted) completedSteps++;
        if (qualificationCompleted) completedSteps++;
        if (familyDetailsCompleted) completedSteps++;
        if (interestCompleted) completedSteps++;
        if (interestedINCompleted) completedSteps++;
        if (interestedINQualCompleted) completedSteps++;
        if (interestedINFamDetailsCompleted) completedSteps++;

        int totalSteps = 7;
        int completionPercentage = (completedSteps * 100) / totalSteps;

        // Update session attributes
        session.setAttribute("completedSteps", completedSteps);
        session.setAttribute("completionPercentage", completionPercentage);

     String redirectUrl;

        if(!personalDetailsCompleted){
            redirectUrl="u_personaldetails.jsp";
        }
        else if (!qualificationCompleted) {
            redirectUrl="addDetails.jsp";
        } else if (!familyDetailsCompleted) {
            redirectUrl="family.jsp";
        }
        else if (!interestCompleted) {
            redirectUrl="interest.jsp";

        } else if (!interestedINCompleted) {
            redirectUrl="interestedIN.jsp";

        } else if (!interestedINQualCompleted) {
            redirectUrl="interestINqual.jsp";

        }else if (!interestedINFamDetailsCompleted) {
            redirectUrl="interestedINfam.jsp";
        }else {
            redirectUrl="u_myprofile.jsp";
        }

        response.sendRedirect(redirectUrl);



    }


}
