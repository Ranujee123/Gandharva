package com.user.controller;

import com.user.model.UserDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.util.UUID;


import java.security.NoSuchAlgorithmException;


import static com.user.constants.PasswordHashing.obtainSHA;
import static com.user.constants.PasswordHashing.toHexStr;


@MultipartConfig
public class Userinsert extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = UUID.randomUUID().toString();
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String nic = req.getParameter("nic");
        String province = req.getParameter("province");
        String phonenumber= req.getParameter("phonenumber");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String cpassword = req.getParameter("confirmPassword");

        if (!password.equals(cpassword)) {
            req.setAttribute("errorMessage", "Passwords do not match. Please try again.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/u_reg.jsp");
            dispatcher.forward(req, resp);
            return;
        }

        try {
            password = toHexStr(obtainSHA(password));
//            System.out.println(login_password);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        Part frontPhotoPart = req.getPart("frontphoto");
        Part backPhotoPart = req.getPart("backphoto");

        byte[] frontPhoto = convertPartToByteArray(frontPhotoPart);
        byte[] backPhoto = convertPartToByteArray(backPhotoPart);

        if (frontPhoto == null || backPhoto == null) {
            req.setAttribute("errorMessage", "All photos are required. Please select files to upload.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/u_reg.jsp");
            dispatcher.forward(req, resp);
            return;
        }


        String dob = req.getParameter("dob");
        LocalDate birthDate = LocalDate.parse(dob);
        int age = LocalDate.now().minusYears(birthDate.getYear()).getYear();

        if (age < 18) {
            req.setAttribute("errorMessage", "You must be 18 years or older to register.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/u_reg.jsp");
            dispatcher.forward(req, resp);
            return;
        }

        // Check if email is already registered
        boolean isRegistered = UserDBUtil.isEmailRegistered(email);
        if (isRegistered) {
            req.setAttribute("errorMessage", "Email already registered.");
            req.setAttribute("firstName", firstName);
            req.setAttribute("lastName", lastName);
            req.setAttribute("nic", nic);
            req.setAttribute("province", province);

            // You can also retain other non-sensitive data if needed

            RequestDispatcher dispatcher = req.getRequestDispatcher("/u_reg.jsp");
            dispatcher.forward(req, resp);
            return;

        }
            boolean isInserted = UserDBUtil.insertUser(id,firstName, lastName, nic, province,phonenumber, email, frontPhoto, backPhoto, password, req.getParameter("gender"), dob, age);

        if (isInserted) {
            req.getSession().setAttribute("successMessage", "Registration successful.");
            resp.sendRedirect("pricing.jsp");
        } else {
            req.setAttribute("errorMessage", "Registration failed. Please try again.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/u_reg.jsp");
            dispatcher.forward(req, resp);
        }
    }

    private byte[] convertPartToByteArray(Part filePart) throws IOException {
        if (filePart == null) {
            return null;
        }

        InputStream inputStream = filePart.getInputStream();
        byte[] bytes = new byte[(int) filePart.getSize()];
        inputStream.read(bytes);
        return bytes;
    }


}
