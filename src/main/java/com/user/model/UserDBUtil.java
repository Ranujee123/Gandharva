package com.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDBUtil {

    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet resultSet = null;
    private static boolean isSuccess;

    public static List<User> validate(String email, String password) {
        ArrayList<User> users = new ArrayList<>();
        try {
            Connection con = DBConnect.getConnection();
            // Adjust the SQL to include a JOIN with the country table to fetch the countryName
            String sql = "SELECT u.*, c.country AS countryName FROM user u JOIN country c ON u.cID = c.cID WHERE u.email = ? AND u.password = ?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String fname = resultSet.getString("fname");
                String lname = resultSet.getString("lname");
                String bday = resultSet.getString("bday");
                int cID = resultSet.getInt("cID");
                String emailU = resultSet.getString("email");
                String passwordU = resultSet.getString("password");
                int gID = resultSet.getInt("gID");
                String countryName = resultSet.getString("countryName"); // Fetch the country name

                User u = new User(fname, lname, bday, cID, emailU, passwordU, gID, countryName);
                users.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }


    public static int getgenderIdByName(String gender) throws Exception {
        Connection con = DBConnect.getConnection();
        String sql = "SELECT gID FROM gender WHERE gender = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setString(1, gender);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("gID");
                }
            }
        }
        return -1; // Handle the case when no oID is found
    }


    public static List<String> getAllGender() {
        List<String> gender = new ArrayList<>();
        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement()) {
            String sql = "SELECT gender FROM gender";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                gender.add(rs.getString("gender"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return gender;
    }
    public static int getCountryIdByName(String country) throws Exception {
        Connection con = DBConnect.getConnection();
        String sql = "SELECT cID FROM country WHERE country = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setString(1, country);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("cID");
                }
            }
        }
        return -1; // Handle the case when no oID is found
    }
    public static List<String> getAllCountry() {
        List<String> country = new ArrayList<>();
        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement()) {
            String sql = "SELECT country FROM country";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                country.add(rs.getString("country"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return country;
    }


    public static boolean insertUser(String fname, String lname, String bday,int cID, String email,String frontphoto,String backphoto, String password, int gID) {
        boolean isSuccess = false;


        try {

            con = DBConnect.getConnection();
            String sql = "insert into user(fname, lname, bday, cID, email, frontphoto,backphoto, password,gID) values(?, ?, ?, ?, ?, ?, ?,?,?)";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setString(1, fname);
                preparedStatement.setString(2, lname);
                preparedStatement.setString(3, bday);

                preparedStatement.setString(4, String.valueOf(cID));
                preparedStatement.setString(5, email);
                preparedStatement.setString(6, frontphoto);
                preparedStatement.setString(7, backphoto);// Add the photo ID path
                preparedStatement.setString(8, password);
                preparedStatement.setString(9, String.valueOf(gID));


                int rowsAffected = preparedStatement.executeUpdate();
                isSuccess = rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }


    public static boolean updateUser(String fname, String lname, String bday, String country, String email, String password) {
        boolean isSuccess = false;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "update user set fname='" + fname + "', lname='" + lname + "', bday='" + bday + "', country='" + country + "', email='" + email + "',password='" + password +  "' where email='" + email + "'";
            int resultSet = stmt.executeUpdate(sql);


            if (resultSet > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }


    public static List<User> getUserDetails(String email) {
        List<User> user = new ArrayList<>();
        try {
            Connection con = DBConnect.getConnection();
            String sql = "SELECT u.*, c.country AS countryName FROM user u JOIN country c ON u.cID = c.cID WHERE u.email=?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String fname = resultSet.getString("fname");
                String lname = resultSet.getString("lname");
                String bday = resultSet.getString("bday");
                int cID = resultSet.getInt("cID");
                String emailU = resultSet.getString("email");
                String passwordU = resultSet.getString("password");
                int gID = resultSet.getInt("gID");
                String countryName = resultSet.getString("countryName"); // Fetch the country name

                User u = new User(fname, lname, bday, cID, emailU, passwordU,  gID, countryName);
                user.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }


    public static boolean deleteUser(String email) {

        //int convId = Integer.parseInt(id);

        try {

            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "delete from user where email='" + email + "'";
            int rs = stmt.executeUpdate(sql);

            if (rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    public static int getUserIdByEmail(String email) throws Exception {
        Connection con = DBConnect.getConnection();
        String sql = "SELECT uID FROM user WHERE email = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setString(1, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("uID");
                }
            }
        }
        return -1; // Handle the case when no uID is found
    }

    public static int getQualificationIdByName(String qualification) throws Exception {
        Connection con = DBConnect.getConnection();
        String sql = "SELECT qID FROM qualification WHERE qualification = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setString(1, qualification);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("qID");
                }
            }
        }
        return -1; // Handle the case when no qID is found
    }

    public static int getOccupationIdByName(String occupation) throws Exception {
        Connection con = DBConnect.getConnection();
        String sql = "SELECT oID FROM occupation WHERE occupation = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setString(1, occupation);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("oID");
                }
            }
        }
        return -1; // Handle the case when no oID is found
    }

    public static boolean saveDetailsToDatabase(int uID, int qID, int oID, String school) throws Exception {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        try {
            con = DBConnect.getConnection();
            String sql = "INSERT INTO userdetails (uID, qID, oID, school) VALUES (?, ?, ?, ?)";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, uID);
            preparedStatement.setInt(2, qID);
            preparedStatement.setInt(3, oID);
            preparedStatement.setString(4, school);
            int result = preparedStatement.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error in saveDetailsToDatabase: " + e.getMessage());
            return false;
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    public static boolean saveFamilyDetailsToDatabase(String userEmail, String freli, String foccu,
                                                       String mreli, String moccup, String maritalstatus, String siblings) {
        try {
            int uID = getUserIdByEmail(userEmail);
            if (uID == -1) {
                return false; // User ID not found
            }

            Connection con = DBConnect.getConnection();
            String sql = "INSERT INTO fdetails (uID, fathername, freli, foccu, mothername, mreli, moccup, maritalstatus, siblings) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, uID);
                preparedStatement.setString(2, freli);
                preparedStatement.setString(3, foccu);
                preparedStatement.setString(4, mreli);
                preparedStatement.setString(5, moccup);
                preparedStatement.setString(6, maritalstatus);
                preparedStatement.setString(7, siblings);
                int result = preparedStatement.executeUpdate();
                return result > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error saving family details: " + e.getMessage());
            return false;
        }
    }


    public static List<String> getAllQualifications() {
        List<String> qualifications = new ArrayList<>();
        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement()) {
            String sql = "SELECT qualification FROM qualification";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                qualifications.add(rs.getString("qualification"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return qualifications;
    }

    public static List<String> getAllOccupations() {
        List<String> occupations = new ArrayList<>();
        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement()) {
            String sql = "SELECT occupation FROM occupation";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                occupations.add(rs.getString("occupation"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return occupations;
    }


    public static boolean isQualificationDetailsCompleted(String userEmail) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            con = DBConnect.getConnection();
            String sql = "SELECT COUNT(*) FROM userdetails WHERE uID = (SELECT uID FROM user WHERE email = ?)";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, userEmail);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public static boolean isFamilyDetailsCompleted(String userEmail) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            con = DBConnect.getConnection();
            String sql = "SELECT COUNT(*) FROM fdetails WHERE uID = (SELECT uID FROM user WHERE email = ?)";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, userEmail);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }


//interest

    public static List<String> getAllpersonality() {
        List<String> personality = new ArrayList<>();
        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement()) {
            String sql = "SELECT personality FROM personality";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                personality.add(rs.getString("personality"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return personality;
    }


    public static boolean isInterestCompleted(String userEmail) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            con = DBConnect.getConnection();
            String sql = "SELECT COUNT(*) FROM uinterest WHERE uID = (SELECT uID FROM user WHERE email = ?)";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, userEmail);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public static int getPersonalityIdByName(String personality) throws Exception {
        Connection con = DBConnect.getConnection();
        String sql = "SELECT pID FROM personality WHERE personality = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {

            preparedStatement.setString(1, personality);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("pID");
                }
            }
        }
        return -1; // Handle the case when no oID is found
    }


    public static boolean saveInterestDetails(int uID, String interests, int pID) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        try {
            con = DBConnect.getConnection();
            String sql = "INSERT INTO uinterest (uID, interests, pID) VALUES (?, ?, ?)";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, uID);
            preparedStatement.setString(2, interests);
            preparedStatement.setInt(3, pID);
            int result = preparedStatement.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error in saveInterestDetails: " + e.getMessage());
            return false;
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


//interested IN

    public static List<String> getAge() {
        List<String> age = new ArrayList<>();
        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement()) {
            String sql = "SELECT age FROM age";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                age.add(rs.getString("age"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return age;
    }




    public static int getAgeIdByName(String age) throws Exception {
        Connection con = DBConnect.getConnection();
        String sql = "SELECT aID FROM age WHERE age = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setString(1, age);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("aID");
                }
            }
        }
        return -1; // Handle the case when no oID is found
    }


    // Method to save interested in details to the database
    public static boolean saveInterestedInDetails(int uID, int aID, String gender, String religion, String caste, String nationality, String country) throws Exception {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        try {
            con = DBConnect.getConnection();
            String sql = "INSERT INTO interestedIn (uID, aID, gender, religion, caste, nationality, country) VALUES (?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, uID);
            preparedStatement.setInt(2, aID);
            preparedStatement.setString(3, gender);
            preparedStatement.setString(4, religion);
            preparedStatement.setString(5, caste);
            preparedStatement.setString(6, nationality);
            preparedStatement.setString(7, country);
            int result = preparedStatement.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (preparedStatement != null) preparedStatement.close();
            if (con != null) con.close();
        }
    }


    public static boolean isInterestedINCompleted(String userEmail) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            con = DBConnect.getConnection();
            String sql = "SELECT COUNT(*) FROM interestedIn WHERE uID = (SELECT uID FROM user WHERE email = ?)";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, userEmail);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }


    //inteersted IN qualification

    public static boolean saveinterestedINQualToDatabase(int uID, String school, int oID, int qID) throws Exception {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        try {
            con = DBConnect.getConnection();
            String sql = "INSERT INTO interestedINQual (uID,school, oID,  qID) VALUES (?, ?, ?, ?)";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, uID);
            preparedStatement.setString(2, school);
            preparedStatement.setInt(3, oID);
            preparedStatement.setInt(4, qID);
            int result = preparedStatement.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error in saveDetailsToDatabase: " + e.getMessage());
            return false;
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static boolean isInterestedINQualCompleted(String userEmail) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            con = DBConnect.getConnection();
            String sql = "SELECT COUNT(*) FROM interestedINQual WHERE uID = (SELECT uID FROM user WHERE email = ?)";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, userEmail);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

// interestedIn family details

    public static boolean saveinterestedINFamDetailsToDatabase(String userEmail, String freli, String foccu,
                                                       String mreli, String moccup, String maritalstatus, String siblings) {
        try {
            int uID = getUserIdByEmail(userEmail);
            if (uID == -1) {
                return false; // User ID not found
            }

            Connection con = DBConnect.getConnection();
            String sql = "INSERT INTO interestedinfam (uID, freli, foccu, mreli, moccup, maritalstatus, siblings) VALUES ( ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, uID);
                preparedStatement.setString(2, freli);
                preparedStatement.setString(3, foccu);
                preparedStatement.setString(4, mreli);
                preparedStatement.setString(5, moccup);
                preparedStatement.setString(6, maritalstatus);
                preparedStatement.setString(7, siblings);
                int result = preparedStatement.executeUpdate();
                return result > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error saving family details: " + e.getMessage());
            return false;
        }
    }


    public static boolean isinterestedINFamDetailsCompleted(String userEmail) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            con = DBConnect.getConnection();
            String sql = "SELECT COUNT(*) FROM interestedinfam WHERE uID = (SELECT uID FROM user WHERE email = ?)";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, userEmail);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }



}