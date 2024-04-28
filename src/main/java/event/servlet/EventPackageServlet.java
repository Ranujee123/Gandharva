package event.servlet;

import event.model.EventPackage;
import event.service.EventPackageImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class EventPackageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int packageNo = Integer.parseInt(request.getParameter("packageNo"));
        int numberOfGuests = Integer.parseInt(request.getParameter("numberOfGuests"));
        int foodFor = Integer.parseInt(request.getParameter("foodFor"));
        int beveragesFor = Integer.parseInt(request.getParameter("beveragesFor"));
        int tablesChairs = Integer.parseInt(request.getParameter("tablesChairs"));
        String audioFacilities = request.getParameter("audioFacilities");
        String decorations = request.getParameter("decorations");
        String localDJ = request.getParameter("localDJ");
        String foodPartner = request.getParameter("foodPartner");
        String decoPartner = request.getParameter("decoPartner");
        String audioPartner = request.getParameter("audioPartner");
        String tablesPartner = request.getParameter("tablesPartner");
        float budgetRange = Float.parseFloat(request.getParameter("budgetRange"));

        EventPackage eventPackage = new EventPackage(packageNo, numberOfGuests, foodFor, beveragesFor, tablesChairs,
                audioFacilities, decorations, budgetRange, foodPartner, decoPartner, audioPartner, tablesPartner);

        EventPackageImpl eventPackageImpl = new EventPackageImpl();
        try {
            eventPackageImpl.addPackage(eventPackage);
            response.sendRedirect("EventPackages.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EventPackageImpl eventPackageImpl = new EventPackageImpl();
        try {
            List<EventPackage> eventPackages = eventPackageImpl.getAllPackages();
            // Do something with eventPackages, like forwarding to a JSP for display
            request.setAttribute("eventPackages", eventPackages);
            request.getRequestDispatcher("EventPackages.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
