package com.user.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FamilyDBUtil {


    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet resultSet = null;


    public static boolean famdetails(String fathername, String fatherreli, String mothername, String motherreli, String foccupation, String moccupation, String maritelstatus, String nosiblings) {
        boolean isSuccess = false;


        try {

            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "insert into family values(0,'" + fathername + "','" + fatherreli + "','" + mothername + "',' " + motherreli + "','" + foccupation + "','" + moccupation + "','" + maritelstatus + "','" + nosiblings + "')";
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


}

