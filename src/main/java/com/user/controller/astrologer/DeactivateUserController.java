package com.user.controller.astrologer;

import com.user.dao.AuthDao;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class DeactivateUserController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/plain");

        boolean isActivated = Boolean.parseBoolean(req.getParameter("isActivated"));

        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("id");
//        UUID id = UUID.fromString(idString);

        if(session.getAttribute("id") == null) {
            resp.sendRedirect("Astrologer/Astrologer_Login.jsp");
            return;
        }

        boolean success = false;
        try {
            success = AuthDao.updateUserStatus(id, isActivated);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        if(success){
            out.print("1");
        } else {
            out.print("0");
        }
    }
}
