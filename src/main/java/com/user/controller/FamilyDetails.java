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
public class FamilyDetails extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String userEmail = (String) session.getAttribute("userEmail");

            if (userEmail == null) {
                response.sendRedirect("login.jsp");
                return;
            }


            String freli = request.getParameter("freli");
            String foccu = request.getParameter("foccu");
            String mreli = request.getParameter("mreli");
            String moccup = request.getParameter("moccup");
            String maritalstatus = request.getParameter("maritalstatus");
            int siblings = Integer.parseInt(request.getParameter("siblings"));
            String id = UserDBUtil.getUserIdByEmail(userEmail);


        if (UserDBUtil.saveFamilyDetailsToDatabase(id,  freli, foccu,  mreli, moccup, maritalstatus, siblings)) {
            session.setAttribute("familyDetailsCompleted", true);
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
