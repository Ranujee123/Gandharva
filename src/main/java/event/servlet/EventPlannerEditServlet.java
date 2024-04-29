package event.servlet;

import event.model.EventUser;
import event.service.EventUserImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class EventPlannerEditServlet  extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String aboutMe = request.getParameter("about");
        String id = request.getParameter("id");
        EventUserImpl eventUserService = new EventUserImpl();
        EventUser eventUser =  new EventUser(id, firstName, lastName, aboutMe);
        try {
            eventUserService.updateEventUser(eventUser);
            HttpSession session = request.getSession();
            session.setAttribute("firstName", eventUser.getFirstName());
            session.setAttribute("lastName", eventUser.getLastName());
            response.sendRedirect("EventPlannerSettings.jsp");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
