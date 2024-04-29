package com.user.model;

import java.sql.*;
import java.sql.Date;
import java.util.*;

public class EventPlannerRequestDB {
	private static Connection con = DBConnect.getConnection();

	public static List<EventPlannerRequest> getRequestsByUserId(String userId) {
		ArrayList<EventPlannerRequest> requests = new ArrayList<>();

		String sql = "SELECT * FROM event_planner_request where userId = ?;";

		try {
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, userId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				EventPlannerRequest epr = new EventPlannerRequest(resultSet.getInt("id"), resultSet.getInt("foodFor"),
						resultSet.getInt("beveragesFor"), resultSet.getString("foodBevSupplier"),
						resultSet.getInt("tablesChairs"), resultSet.getString("tablesChairsSupplier"),
						resultSet.getString("audioSupplier"), resultSet.getString("decorationsSupplier"),
						resultSet.getString("djSupplier"), resultSet.getString("budgetRange"),
						resultSet.getString("userId"), resultSet.getString("eventPlannerId"),
						resultSet.getString("requestStatus"), resultSet.getString("paymentStatus"),
						resultSet.getDate("requestedDate").toString());

				requests.add(epr);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}

		return requests;
	}

	public static boolean insertRequest(EventPlannerRequest newEPR) {
		boolean isSuccess = true;

		String sql = "INSERT INTO `event_planner_requests` (`foodFor`, `beveragesFor`, `foodBevSupplier`, `tablesChairs`, `tablesChairsSupplier`, `audioSupplier`, `decorationsSupplier`, `djSupplier`, `budgetRange`, `userId`, `eventPlannerId`, `requestStatus`, `paymentStatus`, `requestedDate`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
		
		try {
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setInt(1, newEPR.getFoodFor());
			preparedStatement.setInt(2, newEPR.getBeveragesFor());
			preparedStatement.setString(3, newEPR.getFoodBevSupplier());
			preparedStatement.setInt(4, newEPR.getTablesChairs());
			preparedStatement.setString(5, newEPR.getTablesChairsSupplier());
			preparedStatement.setString(6, newEPR.getAudioSupplier());
			preparedStatement.setString(7, newEPR.getDecorationsSupplier());
			preparedStatement.setString(8, newEPR.getDjSupplier());
			preparedStatement.setString(9, newEPR.getBudgetRange());
			preparedStatement.setString(10, newEPR.getUserId());
			preparedStatement.setString(11, newEPR.getEventPlannerId());
			preparedStatement.setString(12, newEPR.getRequestStatus());
			preparedStatement.setString(13, newEPR.getPaymentStatus());
			preparedStatement.setDate(14, new Date(System.currentTimeMillis()));


			int result = preparedStatement.executeUpdate();
            isSuccess = result > 0;
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			isSuccess = false;
		}

		return isSuccess;
	}
}