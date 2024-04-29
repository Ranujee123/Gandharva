package com.user.controller;

import com.user.model.UserDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

@MultipartConfig
public class GuestRegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = UUID.randomUUID().toString();
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String cpassword = req.getParameter("confirmPassword");

		if (!password.equals(cpassword)) {
			req.setAttribute("errorMessage", "Passwords do not match. Please try again.");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/guest_register.jsp");
			dispatcher.forward(req, resp);
			return;
		}

		try {
			password = hashPassword(password); // Hash the password
		} catch (NoSuchAlgorithmException e) {
			req.setAttribute("errorMessage", "Failed to hash the password.");
			req.getRequestDispatcher("/guest_register.jsp").forward(req, resp);
			return;
		}

		// Check if email is already registered
		boolean isRegistered = UserDBUtil.isEmailRegistered(email);
		if (isRegistered) {
			req.setAttribute("errorMessage", "Email already registered.");
			req.setAttribute("firstName", firstName);
			req.setAttribute("lastName", lastName);

			RequestDispatcher dispatcher = req.getRequestDispatcher("/guest_register.jsp");
			dispatcher.forward(req, resp);
			return;

		}
		boolean isInserted = UserDBUtil.insertGuest(id, firstName, lastName, email, password);

		if (isInserted) {
			req.getSession().setAttribute("successMessage", "Registration successful.");
			resp.sendRedirect("login.jsp");
		} else {
			req.setAttribute("errorMessage", "Registration failed. Please try again.");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/guest_register.jsp");
			dispatcher.forward(req, resp);
		}
	}

	private String hashPassword(String password) throws NoSuchAlgorithmException {
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		byte[] hashedBytes = digest.digest(password.getBytes(java.nio.charset.StandardCharsets.UTF_8));
		return Base64.getEncoder().encodeToString(hashedBytes);
	}

}
