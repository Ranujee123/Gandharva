package event.servlet;

import com.google.gson.Gson;
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
        int numberOfGuests = Integer.parseInt(request.getParameter("noOfGuests"));
        int foodFor = Integer.parseInt(request.getParameter("food"));
        int beveragesFor = Integer.parseInt(request.getParameter("beverage"));
        int tablesChairs = Integer.parseInt(request.getParameter("table"));
        String audioFacilities = request.getParameter("audioFacilities");
        String decorations = request.getParameter("decorations");
        String foodPartner = request.getParameter("foodPartner");
        String decoPartner = request.getParameter("decoPartner");
        String audioPartner = request.getParameter("audioPartner");
        String tablesPartner = request.getParameter("tablePartner");
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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        EventPackageImpl eventPackageImpl = new EventPackageImpl();
        try {
            List<EventPackage> eventPackages = eventPackageImpl.getAllPackages();

            Gson gson = new Gson();
            String json = gson.toJson(eventPackages);
            response.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
