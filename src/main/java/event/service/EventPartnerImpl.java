package event.service;

import com.user.model.DBConnect;
import event.model.EventPartner;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;

public class EventPartnerImpl implements IEventPartnerService{

    @Override
    public void addPartner(EventPartner eventPartner) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = DBConnect.getConnection();

            String insertSql = "INSERT INTO event_partners (partnerName, partnerType) VALUES (?, ?)";
            statement = connection.prepareStatement(insertSql);
            statement.setString(1, eventPartner.getPartnerName());
            statement.setString(2, eventPartner.getPartnerType());

            statement.executeUpdate();
            System.out.println("Partner added successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                connection.close();
            }
            if (statement != null) {
                statement.close();
            }
        }
    }

    @Override
    public List<EventPartner> getPartnersByType(String type) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<EventPartner> partners = new ArrayList<>();

        try {
            connection = DBConnect.getConnection();

            String selectSql = "SELECT * FROM event_partners WHERE partnerType = ?";
            statement = connection.prepareStatement(selectSql);
            statement.setString(1, type);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String partnerName = resultSet.getString("partnerName");
                String partnerType = resultSet.getString("partnerType");

                EventPartner eventPartner = new EventPartner(partnerName, partnerType);
                partners.add(eventPartner);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
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

        return partners;
    }

    @Override
    public Map<String, List<EventPartner>> getAllPartnersGroupByType() throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Map<String, List<EventPartner>> partnersByType = new HashMap<>();

        try {
            connection = DBConnect.getConnection();

            String selectSql = "SELECT * FROM event_partners";
            statement = connection.prepareStatement(selectSql);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String partnerName = resultSet.getString("partnerName");
                String partnerType = resultSet.getString("partnerType");

                EventPartner eventPartner = new EventPartner(partnerName, partnerType);

                if (!partnersByType.containsKey(partnerType)) {
                    partnersByType.put(partnerType, new ArrayList<>());
                }
                partnersByType.get(partnerType).add(eventPartner);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
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

        return partnersByType;
    }
}
