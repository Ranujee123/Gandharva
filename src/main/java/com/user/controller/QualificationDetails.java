package com.user.controller;

import com.user.model.QualificationDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



@WebServlet("/qul")

public class QualificationDetails extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String school = req.getParameter("school");
        String eduquali = req.getParameter("eduquali");
        String occupation = req.getParameter("occupation");
        String about = req.getParameter("about");




        boolean isTrue;

        isTrue = QualificationDBUtil.qualification(school,eduquali,occupation,about);

        if(isTrue == true){
            RequestDispatcher dis = req.getRequestDispatcher("family.jsp");
            dis.forward(req,resp);
        }
        else{
            RequestDispatcher dis2 =req.getRequestDispatcher("unsuccess.jsp");
            dis2.forward(req,resp);
        }


    }


}




