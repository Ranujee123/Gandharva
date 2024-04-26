package com.user.controller.astrologer;

import com.user.constants.UserType;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LogOutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        System.out.println("Logout controller called");
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();

//        UserType userType = UserType.valueOf((String) session.getAttribute("userType"));
//        System.out.println(session.getAttribute("userType"));
//        System.out.println(userType);
        session.removeAttribute("loggedInUser");
        session.removeAttribute("id");
        session.removeAttribute("firstName");
        session.removeAttribute("lastName");
        session.removeAttribute("userType");

//        switch (userType) {
//            case PREMIUM_USER:
//                session.removeAttribute("premiumUser");
//                break;
//            case STANDARD_USER:
//                session.removeAttribute("standardUser");
//                break;
//            case ASTROLOGER:
//                session.removeAttribute("astrologer");
//                break;
//            case EVENT_PLANNER:
//                session.removeAttribute("eventPlanner");
//                break;
//            case ADMIN:
//                session.removeAttribute("admin");
//                break;
//            default:
//                break;
//        }

        session.invalidate();
        out.write("1");
    }
}
