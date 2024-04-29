package com.user.model;

import java.sql.*;
import java.util.*;

public class EventPackageDB {
	private static Connection con = DBConnect.getConnection();

	public static List<EventPackage> getPackageList() {
		ArrayList<EventPackage> packages = new ArrayList<>();

		String sql = "SELECT * FROM event_package;";

		try {
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				EventPackage ep = new EventPackage(resultSet.getInt("id"), resultSet.getInt("packageNo"),
						resultSet.getInt("numberOfGuests"), resultSet.getInt("foodFor"),
						resultSet.getInt("beveragesFor"), resultSet.getInt("tablesChairs"),
						resultSet.getString("audioFacilities"), resultSet.getString("decorations"),
						resultSet.getString("localDJ"), resultSet.getString("budgetRange"));

				packages.add(ep);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}

		return packages;
	}
}