package event.servlet;

import com.user.model.UserType;
import event.model.EventUser;
import event.service.EventUserImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

public class EventUserRegister extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = UUID.randomUUID().toString();
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String userType = String.valueOf(UserType.EVENT_PLANNER);
        int numberOfEventsHandled = Integer.parseInt(request.getParameter("events"));
        String password = request.getParameter("password");
        int yearsOfExperience = Integer.parseInt(request.getParameter("exp"));

        EventUser eventUser = new EventUser(id, firstName, lastName, email, userType, password, numberOfEventsHandled, yearsOfExperience);

        EventUserImpl eventUserImpl = new EventUserImpl();
        try {
            eventUserImpl.registerEventUser(eventUser);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        request.getSession().setAttribute("successMessage", "Registration successful.");
        response.sendRedirect("EventPlannerLogin.jsp");
    }
}
