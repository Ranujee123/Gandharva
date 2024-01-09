package com.user.controller;

import com.user.model.FamilyDBUtil;
import com.user.model.UserDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FamilyDetails extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fathername = req.getParameter("fatherName");
        String fatherreli = req.getParameter("fatherReligion");
        String mothername = req.getParameter("motherName");
        String motherreli = req.getParameter("motherReligion");
        String foccupation = req.getParameter("fatherOccupation");
        String moccupation = req.getParameter("motherOccupation");
        String maritelstatus = req.getParameter("maritalStatus");
        String nosiblings = req.getParameter("numberOfSiblings");



        boolean isTrue;

        isTrue = FamilyDBUtil.famdetails(fathername,fatherreli,mothername,motherreli,foccupation,moccupation,maritelstatus,nosiblings);

        if(isTrue == true){
            RequestDispatcher dis = req.getRequestDispatcher("pricing.jsp");
            dis.forward(req,resp);
        }
        else{
            RequestDispatcher dis2 =req.getRequestDispatcher("unsuccess.jsp");
            dis2.forward(req,resp);
        }


    }


}

