package com.user.controller.astrologer;

import com.user.dao.AuthDao;
import com.user.model.astrologer.AllUser;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import static com.user.constants.PasswordHashing.obtainSHA;
import static com.user.constants.PasswordHashing.toHexStr;


public class UpdateAstrologerPasswordController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/plain");

        String password = req.getParameter("password");
        String newPassword = req.getParameter("newPassword");

        try {
            password = toHexStr(obtainSHA(password));
            newPassword = toHexStr(obtainSHA(newPassword));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("id");
//        UUID id = UUID.fromString(idString);

        if(session.getAttribute("id") == null) {
            resp.sendRedirect("login");
            return;
        }

        boolean success = false;
        try {
            AllUser allUser = AuthDao.getUser(id);

            assert allUser != null;
            if(allUser.getPassword().equals(password)){
                success = AuthDao.updateAstrologerPassword(id, newPassword);
            }else {
                out.print("2");
            }

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
