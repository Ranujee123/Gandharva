package com.user.controller;

import com.user.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class interestedINqual extends  HttpServlet{

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            try {
                HttpSession session = request.getSession();
                String userEmail = (String) session.getAttribute("userEmail");

                if (userEmail == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }

                String school = request.getParameter("school");
                String eduQualification = request.getParameter("eduquali");
                String occupation = request.getParameter("occupation");

                int uID = UserDBUtil.getUserIdByEmail(userEmail);
                int qID = UserDBUtil.getQualificationIdByName(eduQualification);
                int oID = UserDBUtil.getOccupationIdByName(occupation);

                if (UserDBUtil.saveinterestedINQualToDatabase(uID, school, oID, qID)) {
                    session.setAttribute("isInterestedINQualCompleted", true);
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
