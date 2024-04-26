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
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            String freli = request.getParameter("freli");
            String foccu = request.getParameter("foccu");
            String otherfoccu = request.getParameter("other_foccu");
            String mreli = request.getParameter("mreli");
            String moccup = request.getParameter("moccup");
            String othermoccup = request.getParameter("other_moccup");
            String maritalstatus = request.getParameter("maritalstatus");
            int siblings = Integer.parseInt(request.getParameter("siblings")); // Consider adding try-catch around this

            // Correcting the condition to check if 'Other' is selected and apply other values
            if ("Other".equals(foccu) && otherfoccu != null && !otherfoccu.isEmpty()) {
                foccu = otherfoccu;
            }

            if ("Other".equals(moccup) && othermoccup != null && !othermoccup.isEmpty()) {
                moccup = othermoccup;
            }

            String id = UserDBUtil.getUserIdByEmail(userEmail); // Ensure this method handles exceptions and returns null or a valid id.

            if (UserDBUtil.saveFamilyDetailsToDatabase(id, freli, foccu, mreli, moccup, maritalstatus, siblings)) {
                session.setAttribute("familyDetailsCompleted", true);
                response.sendRedirect("ProfileCompletionServlet"); // Ensure this redirects to a meaningful URL or handler
            } else {
                response.sendRedirect("unsuccess.jsp"); // Consider providing error details or logging
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid number of siblings.");
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Server error occurred. Please try again.");
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
        }
    }
}
