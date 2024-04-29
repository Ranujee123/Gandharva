package com.user.controller;

import com.user.model.Request;
import com.user.model.RequestsDB;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewAstroReq")
public class ViewAstroReq extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Get the userId from the session
			String userId = req.getSession().getAttribute("userId").toString();
			
			List<Request> requests = RequestsDB.getAstroRequests(userId);
			req.setAttribute("serviceRequests", requests);
			req.setAttribute("heading", "Astrologer Service Requests");
			req.setAttribute("title", "Astrologer Service Requests");
			req.setAttribute("serviceType", "ASTROLOGER");

			RequestDispatcher dis = req.getRequestDispatcher("viewServiceRequests.jsp");
			dis.forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher dis = req.getRequestDispatcher("/error.jsp");
			dis.forward(req, resp);
		}
	}
}