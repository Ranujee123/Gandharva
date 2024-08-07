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

public class UpdateQualificationServlet extends HttpServlet {
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
                // After updating, fetch the updated details to verify or display
                List<User> qualificationDetails = UserDBUtil.getQualificationDetails(id);
                request.setAttribute("qualificationDetails", qualificationDetails);
                RequestDispatcher dispatcher = request.getRequestDispatcher("u_myprofile.jsp");
                dispatcher.forward(request, response);


            } else {
                response.sendRedirect("unsuccess.jsp");
            }


        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("unsuccess.jsp");
        }
    }
}





