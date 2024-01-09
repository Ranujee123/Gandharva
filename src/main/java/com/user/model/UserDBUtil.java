package com.user.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDBUtil {

    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet resultSet = null;
    private static boolean isSuccess;

    public static List<User> validate(String email, String password) {
        ArrayList<User> user = new ArrayList<>();


        //validate
        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "SELECT * FROM user WHERE email='" + email + "' AND password='" + password + "'";
            resultSet = stmt.executeQuery(sql);

            if (resultSet.next()) {

                String fname = resultSet.getString(2);
                String lname = resultSet.getString(3);
                String bday = resultSet.getString(4);
                String country = resultSet.getString(5);
                String emailU = resultSet.getString(6);
                String passwordU = resultSet.getString(7);
                String cpassswordU = resultSet.getString(8);

                User u = new User(fname, lname, bday, country, emailU, passwordU, cpassswordU);
                user.add(u);

            }

        } catch (Exception e) {
            e.printStackTrace();

        }

        return user;
    }

    public static boolean insertUser(String fname, String lname, String bday, String country, String email, String password, String cpassword) {
        boolean isSuccess = false;


        try {

            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "insert into user values(0,'" + fname + "','" + lname + "','" + bday + "','" + country + "','" + email + "','" + password + "','" + cpassword + "')";
            System.out.println("SQL Query: " + sql);

            int resultSet = stmt.executeUpdate(sql);

            if (resultSet > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }


    public static boolean updateUser(String fname, String lname, String bday, String country, String email, String password, String cpassword) {
        boolean isSuccess = false;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "update user set fname='" + fname + "', lname='" + lname + "', bday='" + bday + "', country='" + country + "', email='" + email + "',password='" + password + "', cpassword='" + cpassword + "' where email='" + email + "'";
            int resultSet = stmt.executeUpdate(sql);


            if (resultSet > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }


    public static List<User> getUserDetails(String email) {
        // int convertedID=Integer.parseInt(Id);

        ArrayList<User> user = new ArrayList<>();

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "select * from user where email='" + email + "'";
            resultSet = stmt.executeQuery(sql);

            while (resultSet.next()) {
                //int id=resultSet.getInt(1);
                String fname = resultSet.getString(2);
                String lname = resultSet.getString(3);
                String bday = resultSet.getString(4);
                String country = resultSet.getString(5);
                email = resultSet.getString(6);
                String password = resultSet.getString(7);
                String cpassword = resultSet.getString(8);


                User user1 = new User(fname, lname, bday, country, email, password, cpassword);
                user.add(user1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }


    public static boolean deleteUser(String email) {

        //int convId = Integer.parseInt(id);

        try {

            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "delete from user where email='" + email + "'";
            int rs = stmt.executeUpdate(sql);

            if (rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
}

