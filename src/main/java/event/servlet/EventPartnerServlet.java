package event.servlet;

import com.google.gson.Gson;
import event.model.EventPartner;
import event.service.EventPartnerImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class EventPartnerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String partnerName = request.getParameter("partnerName");
        String partnerType = request.getParameter("partnerType");

        EventPartner eventPartner = new EventPartner(partnerName, partnerType);
        EventPartnerImpl eventPartnerImpl = new EventPartnerImpl();
        try {
            eventPartnerImpl.addPartner(eventPartner);
            response.sendRedirect("Partners.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String type = request.getParameter("type");
//
//        EventPartnerImpl eventPartnerImpl = new EventPartnerImpl();
//        try {
//            List<EventPartner> partnersByType = eventPartnerImpl.getPartnersByType(type);
//            // Do something with partnersByType, like forwarding to a JSP for display
//            request.setAttribute("partners", partnersByType);
//            request.getRequestDispatcher("displayPartners.jsp").forward(request, response);
//        } catch (Exception e) {
//            e.printStackTrace();
//            // Handle error appropriately
//        }
//    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EventPartnerImpl eventPartnerImpl = new EventPartnerImpl();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try {
            Map<String, List<EventPartner>> partnersGroupedByType = eventPartnerImpl.getAllPartnersGroupByType();

            Gson gson = new Gson();
            String json = gson.toJson(partnersGroupedByType);
            response.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
