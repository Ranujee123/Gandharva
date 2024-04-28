package event.service;

import com.user.model.DBConnect;
import event.model.EventPackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EventPackageImpl implements IEventPackage {
    @Override
    public void addPackage(EventPackage eventPackage) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = DBConnect.getConnection();

            String insertSql = "INSERT INTO event_packages (packageNo, numberOfGuests, foodFor, beveragesFor, tablesChairs, audioFacilities, decorations, budgetRange, foodPartner, decoPartner, tablePartner, audioPartner) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(insertSql);
            statement.setInt(1, eventPackage.getPackageNo());
            statement.setInt(2, eventPackage.getNumberOfGuests());
            statement.setInt(3, eventPackage.getFoodFor());
            statement.setInt(4, eventPackage.getBeveragesFor());
            statement.setInt(5, eventPackage.getTablesChairs());
            statement.setString(6, eventPackage.getAudioFacilities());
            statement.setString(7, eventPackage.getDecorations());
            statement.setFloat(8, eventPackage.getBudgetRange());
            statement.setString(9, eventPackage.getFoodPartner());
            statement.setString(10, eventPackage.getDecoPartner());
            statement.setString(11, eventPackage.getTablesPartner());
            statement.setString(12, eventPackage.getAudioPartner());

            statement.executeUpdate();
            System.out.println("Event package added successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            if (connection != null) {
                connection.close();
            }
            if (statement != null) {
                statement.close();
            }
        }
    }

    @Override
    public List<EventPackage> getAllPackages() throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<EventPackage> packages = new ArrayList<>();

        try {
            connection = DBConnect.getConnection();

            String selectSql = "SELECT * FROM event_packages";
            statement = connection.prepareStatement(selectSql);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int packageNo = resultSet.getInt("packageNo");
                int numberOfGuests = resultSet.getInt("numberOfGuests");
                int foodFor = resultSet.getInt("foodFor");
                int beveragesFor = resultSet.getInt("beveragesFor");
                int tablesChairs = resultSet.getInt("tablesChairs");
                String audioFacilities = resultSet.getString("audioFacilities");
                String decorations = resultSet.getString("decorations");
                float budgetRange = resultSet.getFloat("budgetRange");
                String audioPartner = resultSet.getString("audioPartner");
                String decoPartner = resultSet.getString("decoPartner");
                String foodPartner = resultSet.getString("foodPartner");
                String tablesPartner = resultSet.getString("tablesPartner");

                EventPackage eventPackage = new EventPackage(packageNo, numberOfGuests, foodFor, beveragesFor,
                        tablesChairs, audioFacilities, decorations,
                        budgetRange,foodPartner,decoPartner,audioPartner,tablesPartner);
                packages.add(eventPackage);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            if (connection != null) {
                connection.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (resultSet != null) {
                resultSet.close();
            }
        }

        return packages;
    }
}
