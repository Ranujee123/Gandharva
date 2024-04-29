package event.servlet;

import com.google.gson.Gson;
import event.model.EventNotification;
import event.service.EventNotificationImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class EventReservationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        EventNotificationImpl notification = new EventNotificationImpl();
        try {
            List<EventNotification> eventNotifications = notification.getReservationEvents();

            Gson gson = new Gson();
            String json = gson.toJson(eventNotifications);
            response.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}