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

public class UpdateINterestedINFAM extends HttpServlet {
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
            String otherfoccu = request.getParameter("other_foccu");
            String mreli = request.getParameter("mreli");
            String moccup = request.getParameter("moccup");
            String othermoccup = request.getParameter("other_moccup");
            String maritalstatus = request.getParameter("maritalstatus");
            int siblings = Integer.parseInt(request.getParameter("siblings"));


            if ("Other".equals(foccu) && otherfoccu != null && !otherfoccu.isEmpty()) {
                foccu = otherfoccu;
            }

            if ("Other".equals(moccup) && othermoccup != null && !othermoccup.isEmpty()) {
                moccup = othermoccup;
            }


            // Fetch the user ID as a String
            String id = UserDBUtil.getUserIdByEmail(userEmail);

            // Pass the ID as a String to your DB utility method
            if (UserDBUtil.saveinterestedINFamDetailsToDatabase(id, freli, foccu, mreli, moccup, maritalstatus, siblings)) {
                session.setAttribute("interestedINFamDetailsCompleted", true);
                // After updating, fetch the updated details to verify or display
                List<User> updateinterestedinFam = UserDBUtil.getInterestedInFamDetails(id);
                request.setAttribute("updateinterestedinFam", updateinterestedinFam);
                RequestDispatcher dispatcher = request.getRequestDispatcher("userSelectEdit.jsp");
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