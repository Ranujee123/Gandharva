package com.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class QualificationDBUtil {

    private static Connection con = null;

    public static boolean qualification(String school, String eduquali, String occupation, String about) {
        boolean isSuccess = false;

        try {
            con = DBConnect.getConnection();
            String sql = "INSERT INTO qualification(school, eduquali, occupation, about) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, school);
            pstmt.setString(2, eduquali);
            pstmt.setString(3, occupation);
            pstmt.setString(4, about);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                isSuccess = true;
            }

            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
}
