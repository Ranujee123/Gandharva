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

public class UpdateUserFamInfo extends HttpServlet {



        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            HttpSession session = request.getSession();
            String userEmail = (String) session.getAttribute("userEmail");

            if (userEmail == null || userEmail.isEmpty()) {
                response.sendRedirect("login.jsp");
                return;
            }

            String id;
            try {
                id = UserDBUtil.getUserIdByEmail(userEmail);
                if (id == null) {
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
            String freli = request.getParameter("fatherReligion");
            String foccu = request.getParameter("fatherOccupation");
            String mreli = request.getParameter("motherReligion");
            String moccup = request.getParameter("motherOccupation");
            String maritalstatus = request.getParameter("maritalStatus");
            int siblings = Integer.parseInt(request.getParameter("numberOfSiblings"));

            boolean isUpdated = UserDBUtil.updateUserFamInfo(id, freli, foccu, mreli, moccup, maritalstatus, siblings);

            if (isUpdated) {
                List<User> updatedUserInfo = UserDBUtil.getUserfamInfo(id);
                if (!updatedUserInfo.isEmpty()) {
                    User userDetails = updatedUserInfo.get(0);
                    System.out.println("Debug - Father's Religion: " + userDetails.getFreli()); // Example debug statement
                    session.setAttribute("userDetails", userDetails);
                    request.setAttribute("userDetails", userDetails);
                }
                RequestDispatcher dis = request.getRequestDispatcher("edituserfamilyInfo.jsp");
                dis.forward(request, response);
            } else {
                System.out.println("Error: User update failed for email: " + userEmail);
                response.sendRedirect("errorPage.jsp");
            }

        }
    }


