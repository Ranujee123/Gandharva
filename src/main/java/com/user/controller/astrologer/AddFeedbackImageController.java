package com.user.controller.astrologer;

import com.user.dao.RequestDAO;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.UUID;

public class AddFeedbackImageController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/plain");

        Part filePart = req.getPart("feedbackImage");
        String requestId = req.getParameter("requestId");

        byte[] feedbackImage = null;
        if (filePart != null) {
            System.out.println("File part is not null!");
            InputStream fileContent = filePart.getInputStream();
            feedbackImage = fileContent.readAllBytes();
        }

        HttpSession session = req.getSession();
        String idString = (String) session.getAttribute("id");
        UUID userId = UUID.fromString(idString);

        if(session.getAttribute("id") == null) {
            resp.sendRedirect("login");
            return;
        }

        boolean success = false;
        try {
            success = RequestDAO.updateFeedbackImage(requestId,feedbackImage);
//            AllUser allUser = AuthDao.getUser(idString);

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
