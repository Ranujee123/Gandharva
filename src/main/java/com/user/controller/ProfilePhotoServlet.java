package com.user.controller;

import com.user.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class ProfilePhotoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        InputStream photoStream = UserDBUtil.getProfilePhoto(email);
        resp.setContentType("image/jpg");
        OutputStream out = resp.getOutputStream();

        byte[] buffer = new byte[1024];
        int bytesRead;
        while ((photoStream != null) && ((bytesRead = photoStream.read(buffer)) != -1)) {
            out.write(buffer, 0, bytesRead);
        }

        if (photoStream != null) {
            photoStream.close();
        }
        out.flush();
        out.close();
    }
}
