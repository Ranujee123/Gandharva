package com.user.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.model.UserDBUtil;
import com.user.model.EventPackage;
import com.user.model.EventPackageDB;
import com.user.model.EventPlannerRequest;
import com.user.model.EventPlannerRequestDB;
import com.user.model.User;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.List;

@WebServlet("/SendEventReq")
@MultipartConfig
public class SendEventRequest extends HttpServlet {
    String userId = "";
    String astrologerId = "";
    String userImage = "";

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req = setServiceDetails(req);

            List<EventPackage> packages = EventPackageDB.getPackageList();

            req.setAttribute("packages", packages);

            RequestDispatcher dis = req.getRequestDispatcher("sendingReqEventplanner.jsp");
            dis.forward(req, resp);

        } catch (Exception e) {
            // e.printStackTrace();
            System.err.println(e.getMessage());
            RequestDispatcher dis = req.getRequestDispatcher("error.jsp");
            dis.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req = setServiceDetails(req);

        List<EventPackage> packages = EventPackageDB.getPackageList();

        req.setAttribute("packages", packages);

        int foodFor = Integer.parseInt(req.getParameter("foodFor"));
        int beveragesFor = Integer.parseInt(req.getParameter("beveragesFor"));
        String foodBevSupplier = req.getParameter("foodBevSupplier");
        String tablesChairsSupplier = req.getParameter("tablesChairsSupplier");
        String audioSupplier = req.getParameter("audioSupplier");
        String decorationsSupplier = req.getParameter("decorationsSupplier");
        String djSupplier = req.getParameter("djSupplier");
        String budgetRange = req.getParameter("budgetRange");

        if (tablesChairsSupplier == null || tablesChairsSupplier.isEmpty()) {
            tablesChairsSupplier = "No";
        }
        if (audioSupplier == null || audioSupplier.isEmpty()) {
            audioSupplier = "No";
        }
        if (decorationsSupplier == null || decorationsSupplier.isEmpty()) {
            decorationsSupplier = "No";
        }

        if (tablesChairsSupplier.equals("Not Applicable") || tablesChairsSupplier.equals("Not Applicable")
                || decorationsSupplier.equals("Not Applicable")) {
            req.setAttribute("errorMessage", "Please select a valid supplier for required services.");
            RequestDispatcher dis = req.getRequestDispatcher("sendingReqEventplanner.jsp");
            dis.forward(req, resp);
            return;
        }

        String userId = req.getSession().getAttribute("userId").toString();
        String eventPlannerId = req.getParameter("id");
        String requestStatus = "PENDING";
        String paymentStatus = "PENDING";
        String requestedDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

        boolean isSuccess = EventPlannerRequestDB.insertRequest(new EventPlannerRequest(foodFor, beveragesFor,
                foodBevSupplier, 0, tablesChairsSupplier, audioSupplier, decorationsSupplier, djSupplier, budgetRange,
                userId, eventPlannerId, requestStatus, paymentStatus, requestedDate));

        if (isSuccess) {
            req.setAttribute("successMessage", "Request sent successfully.");
        } else {
            req.setAttribute("errorMessage", "Failed to send request. Please try again.");
        }

        RequestDispatcher dis = req.getRequestDispatcher("sendingReqEventplanner.jsp");
        dis.forward(req, resp);
    }

    private HttpServletRequest setServiceDetails(HttpServletRequest req) {
        // get the user id from the session
        userId = req.getSession().getAttribute("userId").toString();

        // get the astrologer id from the request
        astrologerId = req.getParameter("id");

        User user = UserDBUtil.getUserDetails(astrologerId).get(0);
        req.setAttribute("userData", user);

        try {
            byte[] imageData = user.getDpphoto();
            if (imageData != null && imageData.length > 0) {
                String base64Image = Base64.getEncoder().encodeToString(imageData);
                userImage = "data:image/jpeg;base64," + base64Image;
            } else {
                // Set a default image URL if userImage is null
                userImage = "images/no-profile.png"; // or you can set a default value here if required
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            req.setAttribute("userImage", userImage);
        }

        return req;
    }
}
