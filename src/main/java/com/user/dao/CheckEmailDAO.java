package com.user.dao;

import com.user.database.DBConnection;
import com.user.model.astrologer.EmailUser;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckEmailDAO {
    public static boolean checkEmailDetail(String userEmail) throws SQLException, ClassNotFoundException {
        EmailUser emailUser = new EmailUser();
        Connection connection = DBConnection.getInstance().getConnection();

        String query = "SELECT firstName, lastName FROM user WHERE emai =?";
        PreparedStatement pst = connection.prepareStatement(query);
        pst.setString(1,userEmail);

        ResultSet resultSet = pst.executeQuery();

        boolean added = false;

        if(resultSet.next()){
            emailUser.setFirstName(resultSet.getString(1));
            emailUser.setLatName(resultSet.getString(2));
            added = true;
        }
        System.out.println("Check Added2"+added);
        return added;
    }
}
