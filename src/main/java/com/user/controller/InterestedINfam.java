package com.user.controller;

import com.user.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class InterestedINfam extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String userEmail = (String) session.getAttribute("userEmail");

            if (userEmail == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            String fathername = request.getParameter("fatherName");
            String freli = request.getParameter("fatherReligion");
            String foccu = request.getParameter("fatherOccupation");
            String mothername = request.getParameter("motherName");
            String mreli = request.getParameter("motherReligion");
            String moccup = request.getParameter("motherOccupation");
            String maritalstatus = request.getParameter("maritalStatus");
            String siblings = request.getParameter("numberOfSiblings");


            if (UserDBUtil.saveinterestedINFamDetailsToDatabase(userEmail, fathername, freli, foccu, mothername, mreli, moccup, maritalstatus, siblings)) {
                session.setAttribute("interestedINFamDetailsCompleted", true);
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




