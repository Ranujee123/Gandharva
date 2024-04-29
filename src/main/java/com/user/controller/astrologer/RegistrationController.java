package com.user.controller.astrologer;

import com.user.constants.UserType;
import com.user.dao.AuthDao;
import com.user.model.astrologer.Astrologer;
import com.user.model.astrologer.EventPlanner;
import com.user.model.astrologer.ParentUser;
import com.user.model.astrologer.User;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Base64;

import static com.user.constants.PasswordHashing.obtainSHA;
import static com.user.constants.PasswordHashing.toHexStr;

@MultipartConfig
public class RegistrationController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        PrintWriter out = resp.getWriter();
//        resp.setContentType("text/plain");
//
//        String pathInfo = req.getPathInfo();
//        String userType = null;
//
//        String[] pathParts = pathInfo.split("/");
//        if (pathParts.length > 1) {
//            userType = pathParts[1];
//        }
//        System.out.println("Registration Page get call");
//        System.out.println("User Type: "+userType);
//
//        UserType userTypeEnum = null;
//
//        try {
//            assert userType != null;
//            userTypeEnum = UserType.valueOf(userType.toUpperCase());
//        } catch (IllegalArgumentException e) {
//            System.out.println("Exception caught: " + e.getMessage());
//            resp.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "UserType cannot be null!");
//            return;
//        }
//
//        switch (userTypeEnum) {
//            case USER:
//                System.out.println("Guest User");
//                resp.sendRedirect("user.jsp");
//                break;
//            case ASTROLOGER:
//                System.out.println("Astrologer User");
//                resp.sendRedirect("astrologer");
//                break;
//            case EVENT_PLANNER:
//                System.out.println("Event Planner User");
//                resp.sendRedirect("eventPlanner.jsp");
//                break;
//            default:
//                System.out.println();
////                out.print("0");
//                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "UserType not found!");
//                return;
//        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("Astrologer/NavigatePage.jsp");
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/plain");

        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String userType = req.getParameter("userType");
        String countryOfResidence = req.getParameter("countryOfResidence");
        String district = req.getParameter("district");

        System.out.println("FirstName "+ firstName);
        System.out.println("UserType "+ userType);

        try {
            password = toHexStr(obtainSHA(password)); // Hash the password
        } catch (NoSuchAlgorithmException e) {
            req.setAttribute("errorMessage", "An error occurred while processing the password. Please try again.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/u_reg.jsp");
            dispatcher.forward(req, resp);
            return;
        }
        System.out.println("Password: "+password);

        UserType userTypeEnum = UserType.valueOf(userType);

//        Part userImageFilePart = req.getPart("userImage");
//        byte[] userImage = null;
//        if (userImageFilePart != null) {
//            System.out.println("Image file is not null!");
//            InputStream fileContent = userImageFilePart.getInputStream();
//            userImage = fileContent.readAllBytes();
//        }
        byte[] whiteImageBytes = null;
        try {
            BufferedImage image = new BufferedImage(200, 200, BufferedImage.TYPE_INT_RGB);
            Graphics2D graphics = image.createGraphics();

            Color greyColor = new Color(128, 128, 128); // RGB values for grey color
            graphics.setColor(greyColor);
//            graphics.setColor(Color.WHITE);
            graphics.fillRect(0, 0, image.getWidth(), image.getHeight());
            graphics.dispose();

            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            ImageIO.write(image, "jpg", outputStream);
            whiteImageBytes = outputStream.toByteArray();
            outputStream.close();
            System.out.println("New white image created!");
        } catch (IOException e) {
            e.printStackTrace();
        }

        ParentUser parentUser = new ParentUser(firstName,lastName,userTypeEnum,email,password,countryOfResidence,district);
        parentUser.setUserImage(whiteImageBytes);

        boolean success = false;

        switch (userTypeEnum) {
            case USER:
            case STANDARD_USER:
            case PREMIUM_USER:
                System.out.println("User");
                String nic = req.getParameter("nic");
                LocalDate birthday = LocalDate.parse(req.getParameter("birthday"));

                User user = new User(parentUser,nic,birthday);
                try {
                    success = AuthDao.userRegistration(user);
                } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case ASTROLOGER:
                System.out.println("Astrologer User");
                int numberOfCasesHandled = Integer.parseInt(req.getParameter("numberOfCasesHandled"));
                int yearsOfExperience = Integer.parseInt(req.getParameter("yearsOfExperience"));
                int astrologerPayment = Integer.parseInt(req.getParameter("astrologerPayment"));
                Part filePart = req.getPart("certificateFileUpload");
                byte[] certificateFileUpload = null;
                if (filePart != null) {
                    System.out.println("File part is not null!");
                    InputStream fileContent = filePart.getInputStream();
                    certificateFileUpload = fileContent.readAllBytes();
                }

                Astrologer astrologer = new Astrologer(parentUser,numberOfCasesHandled,yearsOfExperience, astrologerPayment,certificateFileUpload);
                try {
                    success = AuthDao.astrologerRegistration(astrologer);
                } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case EVENT_PLANNER:
                System.out.println("Event Planner User");
                int numberOfCasesHandledByEP = Integer.parseInt(req.getParameter("numberOfCasesHandled"));
                int yearsOfExperienceByEP = Integer.parseInt(req.getParameter("yearsOfExperience"));
                String brFileUploadData = req.getParameter("brFileUpload");
                byte[] brFileUpload = Base64.getDecoder().decode(brFileUploadData);

                EventPlanner eventPlanner = new EventPlanner(parentUser,numberOfCasesHandledByEP,yearsOfExperienceByEP,brFileUpload);
                try {
                    success = AuthDao.eventPlannerRegistration(eventPlanner);
                } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case ADMIN:
                System.out.println("admin User");
                break;
            default:
                System.out.println();
                out.print("0");
        }

        if(success){
            out.print("0");
        }
    }
}
