package com.user.controller;

import com.user.model.UserDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Userinsert extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String fname= req.getParameter("firstName");
        String lname= req.getParameter("lastName");
        String bday=req.getParameter("birthday");
        String country =req.getParameter("country");
        String email= req.getParameter("email");
        String password= req.getParameter("password");
        String cpassword= req.getParameter("confirmPassword");
        password= String.valueOf(password.hashCode());
        cpassword= String.valueOf(cpassword.hashCode());


        boolean isTrue;

        isTrue = UserDBUtil. insertUser(fname,lname,bday,country,email,password,cpassword);

        if(isTrue == true){
            RequestDispatcher dis = req.getRequestDispatcher("login.jsp");
            dis.forward(req,resp);
        }
        else{
            RequestDispatcher dis2 =req.getRequestDispatcher("unsuccess.jsp");
            dis2.forward(req,resp);
        }


        }



    }

