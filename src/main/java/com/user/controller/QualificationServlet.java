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
public class QualificationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String userEmail = (String) session.getAttribute("userEmail");

            if (userEmail == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            String school = request.getParameter("school");
            String qualification = request.getParameter("qualification");
            String occupation = request.getParameter("occupation");
            String otheroccupation = request.getParameter("other_occupation");

            String id = UserDBUtil.getUserIdByEmail(userEmail);

            if ("Other".equals(occupation) && otheroccupation!= null && !otheroccupation.isEmpty()) {
                occupation = otheroccupation;
            }



            if (UserDBUtil.saveDetailsToDatabase(id, qualification, occupation, school)) {
                session.setAttribute("qualificationCompleted", true);
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