package com.user.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.user.model.UserDBUtil;
import com.user.model.Request;
import com.user.model.RequestsDB;
import com.user.model.User;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Base64;

@WebServlet("/SendHoroscope")
@MultipartConfig
public class SendHoroscope extends HttpServlet {
	String userId = "";
	String astrologerId = "";
	String userImage = "";
	String requestId = "";

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req = setServiceDetails(req);

			RequestDispatcher dis = req.getRequestDispatcher("sendingHoroscope.jsp");
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

		Part horoscope1Part = req.getPart("horoscope");
		Part horoscope2Part = req.getPart("horoscopeSecond");

		byte[] horoscopePhoto1 = convertPartToByteArray(horoscope1Part);
		byte[] horoscopePhoto2 = convertPartToByteArray(horoscope2Part);

		if (horoscopePhoto1 == null || horoscopePhoto2 == null) {
			req.setAttribute("errorMessage", "All photos are required. Please select files to upload.");
			RequestDispatcher dispatcher = req.getRequestDispatcher("sendingHoroscope.jsp");
			dispatcher.forward(req, resp);
			return;
		}

		boolean isInserted = false;

		isInserted = UserDBUtil.updateHoroscopes(requestId, horoscopePhoto1, horoscopePhoto2);

		if (isInserted) {
			req.setAttribute("successMessage", "Request sent");

			try {
				// get userId from session
				String userId = (String) req.getSession().getAttribute("userId");
				String paymentMethod = "Online";
				double paymentAmount = 1000.00;
				String paymentStatus = "PENDING";
				String paymentReason = "AstrologerPayment";

				// Insert payment details
				try {
					boolean paymentSuccess = UserDBUtil.insertPaymentDetails(userId, paymentMethod, paymentAmount,
							paymentStatus, "", "", paymentReason);

					if (paymentSuccess) {
						req.setAttribute("successMessage", "Payment successful!");
						resp.sendRedirect("AcceptedRequests");
						return;
					} else {
						req.setAttribute("errorMessage", "Payment failed. Please try again.");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} catch (Exception e) {

			}
			resp.sendRedirect("AcceptedRequests");
		} else {
			req.setAttribute("errorMessage", "Error sending request. Please try again.");
			RequestDispatcher dis = req.getRequestDispatcher("sendingHoroscope.jsp");
			dis.forward(req, resp);
		}

	}

	private byte[] convertPartToByteArray(Part filePart) throws IOException {
		if (filePart == null || filePart.getSize() == 0) {
			return null;
		}

		InputStream inputStream = filePart.getInputStream();
		byte[] bytes = new byte[(int) filePart.getSize()];
		inputStream.read(bytes);
		return bytes;
	}

	private HttpServletRequest setServiceDetails(HttpServletRequest req) {
		requestId = req.getParameter("id");
		req.setAttribute("requestId", requestId);
		Request request = RequestsDB.getRequestById(requestId);

		astrologerId = request.getAstrologerId().toString();

		User user = UserDBUtil.getUserDetails(astrologerId).get(0);
		req.setAttribute("astrologer", user);

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
