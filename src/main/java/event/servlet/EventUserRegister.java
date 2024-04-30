package event.servlet;

import com.user.constants.UserType;
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
        UserType userTypeEnum = UserType.EVENT_PLANNER;
        String id = UUID.randomUUID().toString();
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String aboutMe = request.getParameter("about");
        String phoneNo = request.getParameter("phone");

        int numberOfEventsHandled = Integer.parseInt(request.getParameter("events"));
        String password = request.getParameter("password");
        int yearsOfExperience = Integer.parseInt(request.getParameter("exp"));

        EventUser eventUser = new EventUser(id, firstName, lastName, email, userTypeEnum, password, numberOfEventsHandled, yearsOfExperience, aboutMe, phoneNo);

        EventUserImpl eventUserImpl = new EventUserImpl();
        try {
            eventUserImpl.registerEventUser(eventUser);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        request.getSession().setAttribute("successMessage", "Registration successful!");
        response.sendRedirect(request.getContextPath() + "/login");
    }
}
