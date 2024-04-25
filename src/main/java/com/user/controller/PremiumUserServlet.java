package com.user.controller;

import com.user.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PremiumUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve all necessary parameters from the form
        String fullName = request.getParameter("firstname");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zip = request.getParameter("zip");
        String cardName = request.getParameter("cardname");
        String cardNumber = request.getParameter("cardnumber");
        String expMonth = request.getParameter("expmonth");
        String expYear = request.getParameter("expyear");
        String cvv = request.getParameter("cvv");

        // Log the form data for debugging
        System.out.println("Received payment form data for user with email: " + email);

        if (email == null || email.isEmpty()) {
            System.out.println("Email parameter is missing, redirecting to error page.");
            response.sendRedirect("errorPage.jsp?message='Email parameter is missing'");
            return;
        }

        try {
            String userId = UserDBUtil.getUserIdByEmail(email);
            if (userId == null) {
                System.out.println("No user ID associated with the provided email: " + email);
                response.sendRedirect("errorPage.jsp?message='User not found'");
                return;
            }

            String paymentMethod = "Online";
            double paymentAmount = 4000.00;
            String paymentStatus = "Success";
            String paymentReason = "Premiumpayment";

            // Insert payment details
            boolean paymentSuccess = UserDBUtil.insertPREMIUMuserPaymentDetails(
                    userId, paymentMethod, paymentAmount, paymentStatus, address, city, paymentReason
            );

            if (paymentSuccess) {
                UserDBUtil.updatePREMIUMUserType(userId, "PREMIUM_USER");
                response.sendRedirect("login.jsp");
            } else {
                response.sendRedirect("paymentFailure.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp?message='Internal error occurred during payment processing'");
        }
    }
}





