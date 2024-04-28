package event.service;

import com.user.model.DBConnect;
import event.model.EventUser;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

public class EventUserImpl implements IEventUser {
    @Override
    public void registerEventUser(EventUser eventUser) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DBConnect.getConnection();

            String emailCheckSql = "SELECT COUNT(*) AS count FROM user WHERE email = ?";
            statement = connection.prepareStatement(emailCheckSql);
            statement.setString(1, eventUser.getEmail());
            resultSet = statement.executeQuery();
            resultSet.next();
            int count = resultSet.getInt("count");
            if (count > 0) {
                System.out.println("Email already exists.");
                return;
            }

            String hashedPassword = hashPassword(eventUser.getPassword());

            String insertSql = "INSERT INTO user (id, firstName, lastName, email, userType, password, numberOfCasesHandled, yearsOfExperience, aboutMe, phonenumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(insertSql);
            statement.setString(1, eventUser.getId());
            statement.setString(2, eventUser.getFirstName());
            statement.setString(3, eventUser.getLastName());
            statement.setString(4, eventUser.getEmail());
            statement.setString(5, eventUser.getUserType());
            statement.setString(6, hashedPassword);
            statement.setInt(7, eventUser.getNumberOfEventsHandled());
            statement.setInt(8, eventUser.getYearsOfExperience());
            statement.setString(9, eventUser.getAboutMe());
            statement.setString(10, eventUser.getPhoneNo());

            statement.executeUpdate();
            System.out.println("User registered successfully.");
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
    public boolean loginEventUser(String email, String password) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DBConnect.getConnection();

            String retrievePasswordSql = "SELECT password FROM user WHERE email = ?";
            statement = connection.prepareStatement(retrievePasswordSql);
            statement.setString(1, email);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String hashedPasswordFromDB = resultSet.getString("password");
                String hashedPasswordInput = hashPassword(password);

                if (hashedPasswordFromDB.equals(hashedPasswordInput)) {
                    System.out.println("Login successful.");
                    return true;
                } else {
                    System.out.println("Incorrect email or password.");
                }
            } else {
                System.out.println("Incorrect email or password.");
            }
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
        return false;
    }

    @Override
    public EventUser getUserByEmail(String email) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        EventUser user = null;

        try {
            connection = DBConnect.getConnection();
            String sql = "SELECT id, firstName, lastName, email, userType, aboutMe FROM user WHERE email = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String id = resultSet.getString("id");
                String firstName = resultSet.getString("firstName");
                String lastName = resultSet.getString("lastName");
                String userEmail = resultSet.getString("email");
                String userType = resultSet.getString("userType");
                String aboutMe = resultSet.getString("aboutMe");

                user = new EventUser(id, firstName, lastName, userEmail, userType, aboutMe);
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
        }

        return user;
    }

    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hashedBytes = digest.digest(password.getBytes(java.nio.charset.StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(hashedBytes);
    }
}

