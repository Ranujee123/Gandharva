package com.user.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class GuestDBUtil extends UserDBUtil {

	public static boolean insertUser(String id, String firstName, String lastName, String email, String password) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBConnect.getConnection();
			String sql = "INSERT INTO user (id,firstName, lastName, email, password, userType) VALUES (?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, UUID.randomUUID().toString());
			pstmt.setString(2, firstName);
			pstmt.setString(3, lastName);
			pstmt.setString(4, email);
			pstmt.setString(5, password);
			pstmt.setString(6, "GUEST_USER");

			// Log the prepared statement to see what's being sent to the DB
			System.out.println("Executing SQL: " + pstmt.toString());

			int rowsAffected = pstmt.executeUpdate();
			isSuccess = rowsAffected > 0;
			System.out.println("Insert successful? " + isSuccess);
		} catch (SQLException e) {
			System.err.println("SQL Error: " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isSuccess;
	}

	public static List<User> validate(String email, String password) {
		List<User> users = new ArrayList<>();
		try {
			Connection con = DBConnect.getConnection();
			String sql = "SELECT firstName, lastName, email FROM user WHERE email = ? AND password = ?";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				String firstName = resultSet.getString("firstName");
				String lastName = resultSet.getString("lastName");
				String emailU = resultSet.getString("email");

				Guest u = new Guest(firstName, lastName, emailU);
				users.add(u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}

}
