package com.user.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class  DBConnect {

//    private static String url = "jdbc:mysql://localhost:3306/gandharva";
    private static String url = "jdbc:mysql://localhost:3306/gandharvanewtest";
//    private static String userName = "root";
    private static String userName = "binali";
    private static String password = "password";
//    private static String password = "root";
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
