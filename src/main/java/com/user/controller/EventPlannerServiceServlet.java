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

@WebServlet("/EventPlannerService")
public class EventPlannerServiceServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<UserListModel> eventPlanners = UserDBUtil.getServiceProviders("EVENT_PLANNER");
            req.setAttribute("serviceProviders", eventPlanners);
            req.setAttribute("heading", "Event Planners List");
            req.setAttribute("title", "View Event Planner List");
            req.setAttribute("serviceType", "EVENT_PLANNER");

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
				List<UserListModel> eventPlanners = UserDBUtil.getFilteredServiceProviders("EVENT_PLANNER", filterText);
				req.setAttribute("serviceProviders", eventPlanners);
				req.setAttribute("filterText", filterText);
			} else {
				List<UserListModel> eventPlanners = UserDBUtil.getServiceProviders("EVENT_PLANNER");
				req.setAttribute("serviceProviders", eventPlanners);
			}
            req.setAttribute("heading", "Event Planners List");
            req.setAttribute("title", "View Event Planner List");
            req.setAttribute("serviceType", "EVENT_PLANNER");

			RequestDispatcher dis = req.getRequestDispatcher("viewServiceProvidersList.jsp");
			dis.forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher dis = req.getRequestDispatcher("/error.jsp");
			dis.forward(req, resp);
		}
	}
}
