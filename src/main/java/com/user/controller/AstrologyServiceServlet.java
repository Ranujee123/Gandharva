package com.user.controller;

import com.user.model.UserDBUtil;
import com.user.model.UserListModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/AstrologyService")
public class AstrologyServiceServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			List<UserListModel> astrologers = UserDBUtil.getServiceProviders("ASTROLOGER");
			req.setAttribute("serviceProviders", astrologers);
			req.setAttribute("heading", "Astrologers List");
			req.setAttribute("title", "View AstrologerList");
			req.setAttribute("serviceType", "ASTROLOGER");

			RequestDispatcher dis = req.getRequestDispatcher("viewServiceProvidersList.jsp");
			dis.forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher dis = req.getRequestDispatcher("/error.jsp");
			dis.forward(req, resp);
		}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// get filter text
			String filterText = req.getParameter("filterText");

			if(filterText != null && !filterText.isEmpty()) {
				List<UserListModel> astrologers = UserDBUtil.getFilteredServiceProviders("ASTROLOGER", filterText);
				req.setAttribute("serviceProviders", astrologers);
				req.setAttribute("filterText", filterText);
			} else {
				List<UserListModel> astrologers = UserDBUtil.getServiceProviders("ASTROLOGER");
				req.setAttribute("serviceProviders", astrologers);
			}
			req.setAttribute("heading", "Astrologers List");
			req.setAttribute("title", "View AstrologerList");
			req.setAttribute("serviceType", "ASTROLOGER");

			RequestDispatcher dis = req.getRequestDispatcher("viewServiceProvidersList.jsp");
			dis.forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher dis = req.getRequestDispatcher("/error.jsp");
			dis.forward(req, resp);
		}
	}
}