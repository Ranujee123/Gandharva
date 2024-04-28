package event.service;

import com.user.model.DBConnect;
import event.model.EventNotification;

import javax.management.Notification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EventNotificationImpl implements IEventNotification {
    @Override
    public List<EventNotification> getPendingEvents() throws Exception {
        List<EventNotification> pendingEvents = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DBConnect.getConnection();
            String selectSql = "SELECT CONCAT(u.firstName, ' ', u.lastName) AS customer, " +
                    "       e.foodFor, " +
                    "       e.beveragesFor, " +
                    "       e.tablesChairs, " +
                    "       e.budgetRange, " +
                    "       e.requestStatus, " +
                    "       e.requestedDate " +
                    "FROM event_planner_requests  " +
                    "JOIN user u ON e.userId = u.id " +
                    "WHERE e.requestStatus = ? ";
            statement = connection.prepareStatement(selectSql);
            statement.setString(1, "PENDING");
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                EventNotification notification = new EventNotification();
                notification.setId(resultSet.getInt("id"));
                notification.setRequestStatus(resultSet.getString("requestStatus"));
                notification.setCustomer(resultSet.getString("customer"));
                pendingEvents.add(notification);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("Error retrieving pending events: " + e.getMessage());
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }

        return pendingEvents;
    }

    @Override
    public List<EventNotification> getReservationEvents() throws Exception {
        List<EventNotification> reservationEvents = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DBConnect.getConnection();
            String selectSql = "SELECT CONCAT(u.firstName, ' ', u.lastName) AS customer, " +
                    "       e.foodFor, " +
                    "       e.beveragesFor, " +
                    "       e.tablesChairs, " +
                    "       e.budgetRange, " +
                    "       e.requestStatus, " +
                    "       e.requestedDate " +
                    "FROM event_planner_requests  " +
                    "JOIN user u ON e.userId = u.id " +
                    "WHERE e.requestStatus != ? ";
            statement = connection.prepareStatement(selectSql);
            statement.setString(1, "PENDING");
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                EventNotification notification = new EventNotification();
                notification.setId(resultSet.getInt("id"));
                notification.setRequestStatus(resultSet.getString("requestStatus"));
                notification.setPaymentStatus(resultSet.getString("paymentStatus"));
                notification.setRequestedDate(resultSet.getString("requestedDate"));
                notification.setCustomer(resultSet.getString("customer"));
                notification.setEmail(resultSet.getString("email"));
                notification.setFoodFor(resultSet.getInt("foodFor"));
                notification.setBeveragesFor(resultSet.getInt("beveragesFor"));
                notification.setTablesChairs(resultSet.getInt("tablesChairs"));
                notification.setBudgetRange(resultSet.getString("budgetRange"));
                reservationEvents.add(notification);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("Error retrieving reservation events: " + e.getMessage());
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }

        return reservationEvents;
    }

    @Override
    public void updateReservationStatus(int id, String status) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DBConnect.getConnection();
            String updateSql = "UPDATE event_planner_requests SET requestStatus = ? WHERE id = ?";
            statement = connection.prepareStatement(updateSql);
            statement.setString(1, status);
            statement.setInt(2, id);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("Error updating reservation status: " + e.getMessage());
        } finally {
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    }
}
