package event.servlet;

import event.model.EventUser;
import event.service.EventUserImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class EventPlannerLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        EventUserImpl eventUserImpl = new EventUserImpl();
        boolean isAuthenticated = false;
        try {
            isAuthenticated = eventUserImpl.loginEventUser(email, password);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        if (isAuthenticated) {
            EventUser user = null;
            try {
                user = eventUserImpl.getUserByEmail(email);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getId());
            session.setAttribute("firstName", user.getFirstName());
            session.setAttribute("lastName", user.getLastName());
            session.setAttribute("email", user.getEmail());

            response.sendRedirect("EventPlannerDashboard.jsp");
        } else {
            response.sendRedirect("EventPlannerLogin.jsp?error=1");
        }
    }
}
