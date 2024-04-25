package com.user.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class  DBConnect {

    private static String url = "jdbc:mysql://enmoskill.eastus.cloudapp.azure.com:3306/gandharwa";
    private static String userName = "gandharwa";
    private static String password = "password@23";
    private static Connection con;

    public static Connection getConnection(){

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(url, userName,password);
            Statement stmt = con.createStatement();

        }
        catch (Exception e){
            System.out.println("Database connection is not Success!");
        }
        return con;
    }

}