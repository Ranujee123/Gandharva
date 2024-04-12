package com.user.model;
import java.sql.*;


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
            String sql = "SELECT u.*, p.province AS provinceName FROM user u JOIN province p ON u.pID = p.pID WHERE u.email = ? AND u.password = ?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String fname = resultSet.getString("fname");
                String lname = resultSet.getString("lname");
                String idNumber = resultSet.getString("idNumber");
                int pID = resultSet.getInt("pID");
                String emailU = resultSet.getString("email");
                // String passwordU = resultSet.getString("password"); // Typically not needed once validated
                //  String gender = resultSet.getString("gender");
                String dob = resultSet.getString("dob");
                String provinceName = resultSet.getString("provinceName");
                int age = resultSet.getInt("age"); // Assuming age is stored as an integer in the database

                // Assuming you have updated the User constructor to include 'gender' and 'age' as parameters
                User u = new User(fname, lname, idNumber, pID, emailU, dob, provinceName, age);
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

    public static int getProvinceIdByName(String province) throws Exception {
        Connection con = DBConnect.getConnection();
        String sql = "SELECT pID FROM province WHERE province = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setString(1, province);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("pID");
                }
            }
        }
        return -1; // Handle the case when no oID is found
    }

    public static List<String> getAllProvince() {
        List<String> province = new ArrayList<>();
        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement()) {
            String sql = "SELECT province FROM province";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                province.add(rs.getString("province"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return province;
    }


    public static boolean insertUser(String fname, String lname, String idNumber, int pID, String email, String frontphoto, String backphoto, String password, String gender, String dob, int age) {
        boolean isSuccess = false;


        try {

            con = DBConnect.getConnection();
            String sql = "insert into user(fname, lname, idNumber, pID, email, frontphoto,backphoto, password,gender,dob,age) values(?, ?, ?, ?, ?, ?, ?,?,?,?,?)";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setString(1, fname);
                preparedStatement.setString(2, lname);
                preparedStatement.setString(3, idNumber);

                preparedStatement.setString(4, String.valueOf(pID));
                preparedStatement.setString(5, email);
                preparedStatement.setString(6, frontphoto);
                preparedStatement.setString(7, backphoto);// Add the photo ID path
                preparedStatement.setString(8, password);
                preparedStatement.setString(9, gender);
                preparedStatement.setString(10, dob);
             // preparedStatement.setString(11,age);
                 preparedStatement.setString(11, String.valueOf(age));

                int rowsAffected = preparedStatement.executeUpdate();
                isSuccess = rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }


    public static boolean updateUser(String fname, String lname, String idNumber, String provinceName, String email) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBConnect.getConnection();
            // Get the pID for the given province name
            String provinceQuery = "SELECT pID FROM province WHERE province = ?";
            pstmt = con.prepareStatement(provinceQuery);
            pstmt.setString(1, provinceName);
            ResultSet rs = pstmt.executeQuery();
            int pID = -1;
            if (rs.next()) {
                pID = rs.getInt("pID");
            }
            pstmt.close(); // Close the PreparedStatement to reuse the variable

            if (pID != -1) {
                // Update the user with the new country ID
                String sql = "UPDATE user SET fname=?, lname=?, idNumber=?, pID=? WHERE email=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, fname);
                pstmt.setString(2, lname);
                pstmt.setString(3, idNumber);
                pstmt.setInt(4, pID);
                pstmt.setString(5, email);

                int rowsAffected = pstmt.executeUpdate();
                isSuccess = rowsAffected > 0;
            } else {
                System.out.println("Province not found for name: " + provinceName);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }

    public static List<User> getUserDetails(String email) {
        List<User> users = new ArrayList<>();
        try (Connection con = DBConnect.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement("SELECT u.*, p.province AS provinceName FROM user u JOIN province p ON u.pID = p.pID WHERE u.email=?")) {

            preparedStatement.setString(1, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    String fname = resultSet.getString("fname");
                    String lname = resultSet.getString("lname");
                    String idNumber = resultSet.getString("idNumber");
                    int pID = resultSet.getInt("pID");
                    String emailU = resultSet.getString("email");
                    String dob = resultSet.getString("dob");
                    String provinceName = resultSet.getString("provinceName");
                    int age = resultSet.getInt("age");
                    User user = new User(fname, lname, idNumber, pID, emailU, dob, provinceName, age);
                    users.add(user);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
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


    public static boolean savePersonalDetailsToDatabase(String userEmail, String ethnicity, String religion,
                                                        String status, String height, String foodpreferences, String drinking, String smoking, String diffabled, String dpphoto) {
        try {
            int uID = getUserIdByEmail(userEmail);
            if (uID == -1) {
                return false; // User ID not found
            }

            Connection con = DBConnect.getConnection();
            String sql = "INSERT INTO u_pdetails (uID,  ethnicity, religion,  status, height, foodpreferences,drinking, smoking,diffabled,dpphoto) VALUES (?, ?, ?, ?, ?, ?, ?,?,?,?)";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, uID);
                preparedStatement.setString(2, ethnicity);
                preparedStatement.setString(3, religion);
                preparedStatement.setString(4, status);
                preparedStatement.setString(5, height);
                preparedStatement.setString(6, foodpreferences);
                preparedStatement.setString(7, drinking);
                preparedStatement.setString(8, smoking);
                preparedStatement.setString(9, diffabled);
                preparedStatement.setString(10, dpphoto);
                int result = preparedStatement.executeUpdate();
                return result > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error saving personal details: " + e.getMessage());
            return false;
        }
    }


    public static boolean isPersonalDetailsCompleted(String userEmail) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            con = DBConnect.getConnection();
            String sql = "SELECT COUNT(*) FROM u_pdetails WHERE uID = (SELECT uID FROM user WHERE email = ?)";
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
                                                      String mreli, String moccup, String maritalstatus, int siblings) {
        try {
            int uID = getUserIdByEmail(userEmail);
            if (uID == -1) {
                return false; // User ID not found
            }

            Connection con = DBConnect.getConnection();
            String sql = "INSERT INTO fdetails (uID,  freli, foccu,  mreli, moccup, maritalstatus, siblings) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, uID);
                preparedStatement.setString(2, freli);
                preparedStatement.setString(3, foccu);
                preparedStatement.setString(4, mreli);
                preparedStatement.setString(5, moccup);
                preparedStatement.setString(6, maritalstatus);
                preparedStatement.setInt(7, siblings);
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

    public static boolean saveinterestedINQualToDatabase(int uID, int oID, int qID) throws Exception {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        try {
            con = DBConnect.getConnection();
            String sql = "INSERT INTO interestedINQual (uID, oID,  qID) VALUES (?, ?, ?)";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, uID);
            preparedStatement.setInt(2, oID);
            preparedStatement.setInt(3, qID);
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


    public static List<User> getFilteredUsers(String userEmail, String ageFrom, String ageTo, String province, String ethnicity, String religion, String status, String height, String eduQuali, String occupation, String diffabled) {
        List<User> userList = new ArrayList<>();
        try {
            Connection con = DBConnect.getConnection(); // Ensure you have a method DBConnect.getConnection() that returns a valid connection
            StringBuilder queryBuilder = new StringBuilder();
            queryBuilder.append("SELECT u.fname, u.lname, u.email, u.age, p.province AS provinceName, pd.ethnicity, pd.religion, pd.status, pd.height, q.qualification AS qualificationName, o.occupation AS occupationName, pd.diffabled ");
            queryBuilder.append("FROM user u ");
            queryBuilder.append("JOIN province p ON u.pID = p.pID ");
            queryBuilder.append("JOIN u_pdetails pd ON u.uID = pd.uID ");
            queryBuilder.append("JOIN userdetails ud ON u.uID = ud.uID ");
            queryBuilder.append("JOIN qualification q ON ud.qID = q.qID ");
            queryBuilder.append("JOIN occupation o ON ud.oID = o.oID ");
            queryBuilder.append("WHERE u.email != ? ");

            List<Object> parameters = new ArrayList<>();
            parameters.add(userEmail); // Add the email to the parameters list

            // Dynamic filtering based on provided filters
            if (ageFrom != null && !ageFrom.isEmpty() && ageTo != null && !ageTo.isEmpty()) {
                queryBuilder.append("AND u.age BETWEEN ? AND ? ");
                parameters.add(Integer.parseInt(ageFrom));
                parameters.add(Integer.parseInt(ageTo));
            }
            if (province != null && !province.isEmpty()) {
                queryBuilder.append("AND p.province = ? ");
                parameters.add(province);
            }
            if (ethnicity != null && !ethnicity.isEmpty()) {
                queryBuilder.append("AND pd.ethnicity = ? ");
                parameters.add(ethnicity);
            }
            if (religion != null && !religion.isEmpty()) {
                queryBuilder.append("AND pd.religion = ? ");
                parameters.add(religion);
            }
            if (status != null && !status.isEmpty()) {
                queryBuilder.append("AND pd.status = ? ");
                parameters.add(status);
            }
            if (height != null && !height.isEmpty()) {
                queryBuilder.append("AND pd.height = ? ");
                parameters.add(height);
            }
            if (eduQuali != null && !eduQuali.isEmpty()) {
                queryBuilder.append("AND q.qualification = ? ");
                parameters.add(eduQuali);
            }
            if (occupation != null && !occupation.isEmpty()) {
                queryBuilder.append("AND o.occupation = ? ");
                parameters.add(occupation);
            }
            if (diffabled != null && !diffabled.isEmpty()) {
                queryBuilder.append("AND pd.diffabled = ? ");
                parameters.add(diffabled);
            }

            PreparedStatement pst = con.prepareStatement(queryBuilder.toString());

            System.out.println("Executing query: " + queryBuilder.toString());
            System.out.println("With parameters: " + parameters);


            // Set the parameters for the prepared statement
            for (int i = 0; i < parameters.size(); i++) {
                pst.setObject(i + 1, parameters.get(i));
            }

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                User user = new User(
                        rs.getString("fname"),
                        rs.getString("lname"),
                        rs.getString("email"),
                        rs.getInt("age"),
                        rs.getString("provinceName"),
                        rs.getString("ethnicity"),
                        rs.getString("religion"),
                        rs.getString("status"),
                        rs.getString("height"),
                        rs.getString("qualificationName"),
                        rs.getString("occupationName"),
                        rs.getString("diffabled")
                );
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }


    public static String getProfileImagePath(String userEmail) {
        String defaultImagePath = "DP/defaultDP.jpeg"; // Path to the default image
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement("SELECT dpphoto FROM u_pdetails WHERE uID = (SELECT uID FROM user WHERE email = ?)")) {
            pstmt.setString(1, userEmail);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next() && rs.getString("dpphoto") != null && !rs.getString("dpphoto").trim().isEmpty()) {
                    return "DP/" + rs.getString("dpphoto"); // Return the user's profile photo if available
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return defaultImagePath; // Return default image path if none found or error occurs
    }


}
