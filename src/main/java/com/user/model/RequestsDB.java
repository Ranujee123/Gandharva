package com.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RequestsDB {
	private static Connection con = DBConnect.getConnection();

	public static List<Request> getAstroRequests(String userId) {
		ArrayList<Request> requests = new ArrayList<>();

		String sql = "SELECT r.id, r.startDate, r.deadline, r.status, r.comments, r.feedback, r.astrologerId, r.feedbackImage, u.firstName, u.lastName FROM request r JOIN user u ON r.astrologerId = u.id WHERE r.astrologerId IS NOT NULL AND r.userId = ? ORDER BY r.startDate DESC";

		try {
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, userId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Request r = new Request(
					resultSet.getString("r.id"),
					resultSet.getDate("r.startDate"),
					resultSet.getDate("r.deadline"),
					resultSet.getString("r.status"),
					resultSet.getString("r.comments"),
					resultSet.getString("r.feedback"),
					resultSet.getString("r.astrologerId"),
					resultSet.getBytes("r.feedbackImage")
				);

				requests.add(r);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}

		return requests;
	}

	public static List<EventPlannerRequest> getEventPlannerRequests(String userId) {
		ArrayList<EventPlannerRequest> requests = new ArrayList<>();

		String sql = "SELECT r.id, r.foodFor, r.beveragesFor, r.foodBevSupplier, r.tablesChairs, r.tablesChairsSupplier, r.audioSupplier, r.decorationsSupplier, r.djSupplier, r.budgetRange, r.userId, r.eventPlannerId, r.requestStatus, r.paymentStatus, r.requestedDate FROM event_planner_requests r WHERE r.userId = ? ORDER BY r.requestedDate DESC";

		try {
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, userId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				EventPlannerRequest r = new EventPlannerRequest(
					resultSet.getInt("r.id"),
					resultSet.getInt("r.foodFor"),
					resultSet.getInt("r.beveragesFor"),
					resultSet.getString("r.foodBevSupplier"),
					resultSet.getInt("r.tablesChairs"),
					resultSet.getString("r.tablesChairsSupplier"),
					resultSet.getString("r.audioSupplier"),
					resultSet.getString("r.decorationsSupplier"),
					resultSet.getString("r.djSupplier"),
					resultSet.getString("r.budgetRange"),
					resultSet.getString("r.userId"),
					resultSet.getString("r.eventPlannerId"),
					resultSet.getString("r.requestStatus"),
					resultSet.getString("r.paymentStatus"),
					resultSet.getString("r.requestedDate")
				);

				requests.add(r);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}

		return requests;
	}

	public static List<Request> getAcceptedAstroRequests(String userId) {
		ArrayList<Request> requests = new ArrayList<>();

		String sql = "SELECT r.id, r.startDate, r.deadline, r.status, r.comments, r.feedback, r.astrologerId, r.feedbackImage, u.firstName, u.lastName FROM request r JOIN user u ON r.astrologerId = u.id WHERE r.astrologerId IS NOT NULL AND r.userId = ? AND r.status = 'PAYMENT_PENDING'";

		try {
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, userId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Request r = new Request(
					resultSet.getString("r.id"),
					resultSet.getDate("r.startDate"),
					resultSet.getDate("r.deadline"),
					resultSet.getString("r.status"),
					resultSet.getString("r.comments"),
					resultSet.getString("r.feedback"),
					resultSet.getString("r.astrologerId"),
					resultSet.getBytes("r.feedbackImage")
				);

				requests.add(r);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}

		return requests;
	}

	public static Request getRequestById(String requestId) {
		Request r = null;

		String sql = "SELECT r.id, r.startDate, r.deadline, r.status, r.comments, r.feedback, r.astrologerId, r.feedbackImage, u.firstName, u.lastName FROM request r JOIN user u ON r.astrologerId = u.id WHERE r.id = ? ORDER BY r.startDate DESC";

		try {
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, requestId);

			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				r = new Request(
					resultSet.getString("r.id"),
					resultSet.getDate("r.startDate"),
					resultSet.getDate("r.deadline"),
					resultSet.getString("r.status"),
					resultSet.getString("r.comments"),
					resultSet.getString("r.feedback"),
					resultSet.getString("r.astrologerId"),
					resultSet.getBytes("r.feedbackImage")
				);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}

		return r;
	}
}