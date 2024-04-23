package com.user.model;
import java.sql.*;


import java.sql.Date;
import java.util.*;
import java.util.stream.Stream;

public class UserDBUtil {

    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet resultSet = null;
    private static boolean isSuccess;

    public static List<User> validate(String email, String password) {
        ArrayList<User> users = new ArrayList<>();
        try {
            Connection con = DBConnect.getConnection();
            String sql = "SELECT fname, lname, idNumber, province, email, dob, age FROM user WHERE email = ? AND password = ?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String fname = resultSet.getString("fname");
                String lname = resultSet.getString("lname");
                String idNumber = resultSet.getString("idNumber");
                String province = resultSet.getString("province");
                String emailU = resultSet.getString("email");
                String dob = resultSet.getString("dob");
                int age = resultSet.getInt("age"); // Assuming age is stored as an integer in the database

                User u = new User(fname, lname, idNumber, province, emailU, dob, age);
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

    public static boolean isEmailRegistered(String email) {
        // Implementation to check email in the database
        // Assume you have a connection and SQL statement prepared
        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM user WHERE email = ?")) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
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


    public static boolean insertUser(String fname, String lname, String idNumber, String province, String email, byte[] frontPhoto, byte[] backPhoto, String password, String gender, String dob, int age) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBConnect.getConnection();
            String sql = "INSERT INTO user (fname, lname, idNumber, province, email, frontphoto, backphoto, password, gender, dob, age) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, fname);
            pstmt.setString(2, lname);
            pstmt.setString(3, idNumber);
            pstmt.setString(4, province);
            pstmt.setString(5, email);
            pstmt.setBytes(6, frontPhoto);
            pstmt.setBytes(7, backPhoto);
            pstmt.setString(8, password);
            pstmt.setString(9, gender);
            pstmt.setString(10, dob);
            pstmt.setInt(11, age);

            int rowsAffected = pstmt.executeUpdate();
            isSuccess = rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }


    public static boolean updateUser(String fname, String lname, String idNumber, String province, byte[] dpphoto, String email) {
        String sql = "UPDATE user SET fname=?, lname=?, idNumber=?, province=?, dpphoto=? WHERE email=?";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, fname);
            pstmt.setString(2, lname);
            pstmt.setString(3, idNumber);
            pstmt.setString(4, province);
            pstmt.setBytes(5, dpphoto);
            pstmt.setString(6, email);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public static List<User> getUserDetails(String email) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT fname, lname, idNumber, province, email, dpphoto, dob, age FROM user WHERE email = ?";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String idNumber = rs.getString("idNumber");
                String provinceName = rs.getString("province");
                String emailU = rs.getString("email");
                byte[] dpphoto = rs.getBytes("dpphoto");
                String dob = rs.getString("dob");
                int age = rs.getInt("age");

                users.add(new User(fname, lname, idNumber, provinceName, emailU, dob, age));
            }
        } catch (SQLException e) {
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


    public static boolean savePersonalDetailsToDatabase(String userEmail, String ethnicity, String religion,String caste,
                                                        String status, String height, String foodpreferences, String drinking, String smoking, String diffabled) {
        try {
            int uID = getUserIdByEmail(userEmail);
            if (uID == -1) {
                return false; // User ID not found
            }

            Connection con = DBConnect.getConnection();
            String sql = "INSERT INTO userInfo (uID,  ethnicity, religion, caste, status, height, foodpreferences,drinking, smoking,diffabled) VALUES (?, ?,?, ?, ?, ?, ?, ?,?,?)";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, uID);
                preparedStatement.setString(2, ethnicity);
                preparedStatement.setString(3, religion);
                preparedStatement.setString(4, caste);
                preparedStatement.setString(5, status);
                preparedStatement.setString(6, height);
                preparedStatement.setString(7, foodpreferences);
                preparedStatement.setString(8, drinking);
                preparedStatement.setString(9, smoking);
                preparedStatement.setString(10, diffabled);

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
        String sql = "SELECT ui.ethnicity, ui.religion, ui.caste, ui.status, ui.height, ui.foodpreferences, ui.drinking, ui.smoking, ui.diffabled FROM userInfo ui WHERE ui.uID = (SELECT uID FROM user WHERE email = ?)";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, userEmail);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Stream.of(rs.getString("ethnicity"), rs.getString("religion"), rs.getString("caste"), rs.getString("status"), rs.getString("height"), rs.getString("foodpreferences"), rs.getString("drinking"), rs.getString("smoking"), rs.getString("diffabled"))
                            .allMatch(Objects::nonNull);  // Check if all fields are not null
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
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

    public static boolean saveDetailsToDatabase(int uID, String qualification, String occupation, String school) throws Exception {
        if (uID == -1) {
            return false; // Invalid user ID
        }

        List<String> fieldsToUpdate = new ArrayList<>();
        List<Object> params = new ArrayList<>();

        if (qualification != null) {
            fieldsToUpdate.add("qualification = ?");
            params.add(qualification);
        }
        if (occupation != null) {
            fieldsToUpdate.add("occupation = ?");
            params.add(occupation);
        }
        if (school != null) {
            fieldsToUpdate.add("school = ?");
            params.add(school);
        }

        if (fieldsToUpdate.isEmpty()) {
            return false; // Nothing to update
        }

        String sql = "UPDATE userInfo SET " + String.join(", ", fieldsToUpdate) + " WHERE uID = ?";
        params.add(uID); // Add uID as the last parameter for the WHERE clause

        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(i + 1, params.get(i));
            }
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }


        public static boolean saveFamilyDetailsToDatabase(int uID, String freli, String foccu,
                                                      String mreli, String moccup, String maritalstatus, int siblings) {
            try {
                if (uID == -1) {
                    return false; // User ID not found
                }

                List<String> fieldsToUpdate = new ArrayList<>();
                List<Object> params = new ArrayList<>();

                if (freli != null) {
                    fieldsToUpdate.add("freli = ?");
                    params.add(freli);
                }
                if (foccu != null) {
                    fieldsToUpdate.add("foccu = ?");
                    params.add(foccu);
                }
                if (mreli != null) {
                    fieldsToUpdate.add("mreli = ?");
                    params.add(mreli);
                }
                if (moccup != null) {
                    fieldsToUpdate.add("moccup = ?");
                    params.add(moccup);
                }
                if (maritalstatus != null) {
                    fieldsToUpdate.add("maritalstatus = ?");
                    params.add(maritalstatus);
                }
                fieldsToUpdate.add("siblings = ?");
                params.add(siblings);

                if (fieldsToUpdate.isEmpty()) {
                    return false; // Nothing to update
                }

                String sql = "UPDATE userInfo SET " + String.join(", ", fieldsToUpdate) + " WHERE uID = ?";
                params.add(uID); // Add uID as the last parameter for the WHERE clause

                try (Connection con = DBConnect.getConnection();
                     PreparedStatement pstmt = con.prepareStatement(sql)) {
                    for (int i = 0; i < params.size(); i++) {
                        pstmt.setObject(i + 1, params.get(i));
                    }
                    int rowsAffected = pstmt.executeUpdate();
                    return rowsAffected > 0;
                } catch (SQLException e) {
                    System.err.println("SQL Error: " + e.getMessage());
                    e.printStackTrace();
                    return false;
                }

            } catch (Exception e) {
                throw new RuntimeException(e);
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
        String sql = "SELECT ui.ethnicity, ui.religion, ui.caste, ui.status, ui.height, ui.foodpreferences, ui.drinking, ui.smoking, ui.diffabled, ui.qualification, ui.occupation, ui.school FROM userInfo ui WHERE ui.uID = (SELECT uID FROM user WHERE email = ?)";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, userEmail);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Stream.of(rs.getString("ethnicity"), rs.getString("religion"), rs.getString("caste"), rs.getString("status"), rs.getString("height"), rs.getString("foodpreferences"), rs.getString("drinking"), rs.getString("smoking"), rs.getString("diffabled"), rs.getString("qualification"), rs.getString("occupation"), rs.getString("school"))
                            .allMatch(Objects::nonNull);  // Check if all fields are not null
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean isFamilyDetailsCompleted(String userEmail) {
        String sql = "SELECT ui.ethnicity, ui.religion, ui.caste, ui.status, ui.height, ui.foodpreferences, ui.drinking, ui.smoking, ui.diffabled, ui.qualification, ui.occupation, ui.school ,ui.freli, ui.foccu, ui.mreli,ui.moccup,ui.maritalstatus,ui.siblings FROM userInfo ui WHERE ui.uID = (SELECT uID FROM user WHERE email = ?)";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, userEmail);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Stream.of(rs.getString("ethnicity"), rs.getString("religion"), rs.getString("caste"), rs.getString("status"), rs.getString("height"), rs.getString("foodpreferences"), rs.getString("drinking"), rs.getString("smoking"), rs.getString("diffabled"), rs.getString("qualification"), rs.getString("occupation"), rs.getString("school"), rs.getString("freli"), rs.getString("foccu"), rs.getString("mreli"), rs.getString("moccup"), rs.getString("maritalstatus"), rs.getInt("siblings"))
                            .allMatch(Objects::nonNull);  // Check if all fields are not null
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
        String sql = "SELECT ui.interests, ui.personalityID FROM userInfo ui WHERE ui.uID = (SELECT uID FROM user WHERE email = ?)";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, userEmail);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Stream.of(rs.getString("interests"), rs.getInt("personalityID"))
                            .allMatch(Objects::nonNull);  // Check if all fields are not null
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static int getPersonalityIdByName(String personality) throws Exception {
        Connection con = DBConnect.getConnection();
        String sql = "SELECT personalityID FROM personality WHERE personality = ?";
        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {

            preparedStatement.setString(1, personality);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("personalityID");
                }
            }
        }
        return -1; // Handle the case when no oID is found
    }


    public static boolean saveInterestDetails(int uID, String interests, int personalityID) {

            if (uID <= 0) {
                System.out.println("Invalid user ID.");
                return false; // Check for valid user ID
            }

            List<String> fieldsToUpdate = new ArrayList<>();
            List<Object> params = new ArrayList<>();

            if (interests != null) {
                fieldsToUpdate.add("interests = ?");
                params.add(interests);
            }

        fieldsToUpdate.add("personalityID = ?");
        params.add(personalityID);


        if (fieldsToUpdate.isEmpty()) {
                System.out.println("No updates specified.");
                return false; // Nothing to update
            }

            String sql = "UPDATE userInfo SET " + String.join(", ", fieldsToUpdate) + " WHERE uID = ?";
            params.add(uID); // Add uID as the last parameter for the WHERE clause

            try (Connection con = DBConnect.getConnection();
                 PreparedStatement pstmt = con.prepareStatement(sql)) {
                for (int i = 0; i < params.size(); i++) {
                    pstmt.setObject(i + 1, params.get(i));
                }
                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    System.out.println("Interest details updated successfully.");
                    return true;
                } else {
                    System.out.println("No records updated, check the data provided or the user ID.");
                    return false;
                }
            } catch (SQLException e) {
                System.err.println("SQL Error during interest details update: " + e.getMessage());
                e.printStackTrace();
                return false;
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
    public static boolean saveInterestedInDetails(int uID,int minAge,int maxAge, String religion, String caste, String ethnicity, String province) throws Exception {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        try {
            con = DBConnect.getConnection();
            String sql = "INSERT INTO userinterestedIfo (uID, minAge,maxAge,religion, caste, ethnicity, province) VALUES (  ?, ?, ?, ?, ?,?,?)";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, uID);
            preparedStatement.setInt(2, minAge);
            preparedStatement.setInt(3, maxAge);
            preparedStatement.setString(4, religion);
            preparedStatement.setString(5, caste);
            preparedStatement.setString(6, ethnicity);
            preparedStatement.setString(7, province);
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
        String sql = "SELECT minAge, maxAge, religion, caste, ethnicity, province FROM userinterestedIfo WHERE uID = (SELECT uID FROM user WHERE email = ?)";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, userEmail);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    // Check if all specific fields are not null, indicating that the 'Interested In' details are complete.
                    return Stream.of(
                            rs.getObject("minAge"),
                            rs.getObject("maxAge"),
                            rs.getString("religion"),
                            rs.getString("caste"),
                            rs.getString("ethnicity"),
                            rs.getString("province")
                    ).noneMatch(Objects::isNull);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    //inteersted IN qualification

    public static boolean saveinterestedINQualToDatabase(int uID, String occupation, String qualification) throws Exception {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        try {
            con = DBConnect.getConnection();
            List<String> fieldsToUpdate = new ArrayList<>();
            List<Object> params = new ArrayList<>();

            if (occupation != null) {
                fieldsToUpdate.add("occupation = ?");
                params.add(occupation);
            }
            if (qualification != null) {
                fieldsToUpdate.add("qualification = ?");
                params.add(qualification);
            }

            if (fieldsToUpdate.isEmpty()) {
                return false; // Nothing to update
            }

            String sql = "UPDATE userinterestedIfo SET " + String.join(", ", fieldsToUpdate) + " WHERE uID = ?";
            params.add(uID); // Add uID as the last parameter for the WHERE clause

            preparedStatement = con.prepareStatement(sql);
            for (int i = 0; i < params.size(); i++) {
                preparedStatement.setObject(i + 1, params.get(i));
            }

            int result = preparedStatement.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public static boolean isInterestedINQualCompleted(String userEmail) {
        String sql = "SELECT occupation, qualification FROM userinterestedIfo WHERE uID = (SELECT uID FROM user WHERE email = ?)";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, userEmail);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    // Check if all specific fields are not null, indicating that the 'Interested In' details are complete.
                    return Stream.of(
                            rs.getObject("occupation"),
                            rs.getObject("qualification")
                    ).noneMatch(Objects::isNull);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


// interestedIn family details

    public static boolean saveinterestedINFamDetailsToDatabase(int uID, String freli, String foccu,
                                                               String mreli, String moccup, String maritalstatus, int siblings) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        try {
            if (uID == -1) {
                return false; // User ID not found
            }

            con = DBConnect.getConnection();
            List<String> fieldsToUpdate = new ArrayList<>();
            List<Object> params = new ArrayList<>();

            if (freli != null) {
                fieldsToUpdate.add("freli = ?");
                params.add(freli);
            }
            if (foccu != null) {
                fieldsToUpdate.add("foccu = ?");
                params.add(foccu);
            }
            if (mreli != null) {
                fieldsToUpdate.add("mreli = ?");
                params.add(mreli);
            }
            if (moccup != null) {
                fieldsToUpdate.add("moccup = ?");
                params.add(moccup);
            }
            if (maritalstatus != null) {
                fieldsToUpdate.add("maritalstatus = ?");
                params.add(maritalstatus);
            }
            fieldsToUpdate.add("siblings = ?");
            params.add(siblings);

            if (fieldsToUpdate.isEmpty()) {
                return false; // Nothing to update
            }

            String sql = "UPDATE userinterestedIfo SET " + String.join(", ", fieldsToUpdate) + " WHERE uID = ?";
            params.add(uID); // Add uID as the last parameter for the WHERE clause

            preparedStatement = con.prepareStatement(sql);
            for (int i = 0; i < params.size(); i++) {
                preparedStatement.setObject(i + 1, params.get(i));
            }

            int result = preparedStatement.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public static boolean isinterestedINFamDetailsCompleted(String userEmail) {
        String sql = "SELECT freli, foccu, mreli, moccup, maritalstatus,siblings FROM userinterestedIfo WHERE uID = (SELECT uID FROM user WHERE email = ?)";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, userEmail);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    // Check if all specific fields are not null, indicating that the 'Interested In' details are complete.
                    return Stream.of(
                            rs.getObject("freli"),
                            rs.getObject("foccu"),
                            rs.getString("mreli"),
                            rs.getString("moccup"),
                            rs.getString("maritalstatus"),
                            rs.getString("siblings")
                    ).noneMatch(Objects::isNull);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public static String getProfileImagePath(String userEmail) {
        String defaultImagePath = "DP/defaultDP.jpeg"; // Path to the default image
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement("SELECT dpphoto FROM user WHERE email = ?")) {
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


    /*  public static List<User> getUsersByProvince(String province) {
          List<User> users = new ArrayList<>();
          try (Connection con = DBConnect.getConnection();
               PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM user JOIN province ON user.pID = province.pID WHERE province.province = ?")) {

              preparedStatement.setString(1, province);
              ResultSet resultSet = preparedStatement.executeQuery();

              while (resultSet.next()) {
                  // Assuming you have a constructor that suits this data structure
                  User user = new User(
                          resultSet.getString("fname"),
                          resultSet.getString("lname"),
                          resultSet.getString("email"),
                          resultSet.getString("province"));
                  users.add(user);
              }
          } catch (SQLException e) {
              e.printStackTrace();
          }
          return users;
      }
  */
    public static List<User> getFilteredUsers(String province, String ethnicity, String religion, String status, String height, String foodpreferences, String drinking, String smoking, String qualification, String occupation, String diffabled, String userEmail) {
        List<User> users = new ArrayList<>();
        StringBuilder query = new StringBuilder();
        query.append("SELECT u.fname, u.lname, u.email, u.province, ui.ethnicity, ui.religion, ui.status, ui.height,ui.foodpreferences,ui.drinking,ui.smoking, ui.qualification, ui.occupation, ui.diffabled, ");
        query.append("((CASE WHEN u.province = ? THEN 1 ELSE 0 END) + ");
        query.append("(CASE WHEN ui.ethnicity = ? THEN 1 ELSE 0 END) + ");
        query.append("(CASE WHEN ui.religion = ? THEN 1 ELSE 0 END) + ");
        query.append("(CASE WHEN ui.status = ? THEN 1 ELSE 0 END) + ");
        query.append("(CASE WHEN ui.height = ? THEN 1 ELSE 0 END) + ");
        query.append("(CASE WHEN ui.foodpreferences = ? THEN 1 ELSE 0 END) + ");
        query.append("(CASE WHEN ui.drinking = ? THEN 1 ELSE 0 END) + ");
        query.append("(CASE WHEN ui.smoking = ? THEN 1 ELSE 0 END) + ");
        query.append("(CASE WHEN ui.qualification = ? THEN 1 ELSE 0 END) + ");
        query.append("(CASE WHEN ui.occupation = ? THEN 1 ELSE 0 END) + ");
        query.append("(CASE WHEN ui.diffabled = ? THEN 1 ELSE 0 END)) AS relevance ");
        query.append("FROM user u ");
        query.append("LEFT JOIN userInfo ui ON u.uID = ui.uID ");
        query.append("WHERE u.email <> ? ");
        query.append("AND (u.province = ? OR ui.ethnicity = ? OR ui.religion = ? OR ui.status=? OR ui.height=? OR ui.foodpreferences=? OR ui.drinking=? OR ui.smoking=? OR ui.qualification=? OR ui.occupation=? OR ui.diffabled=?) ");
        query.append("ORDER BY relevance DESC");

        List<String> parameters = new ArrayList<>();
// Add parameters for relevance scoring
        parameters.add(province);
        parameters.add(ethnicity);
        parameters.add(religion);
        parameters.add(status);
        parameters.add(height);
        parameters.add(foodpreferences);
        parameters.add(drinking);
        parameters.add(smoking);
        parameters.add(qualification);
        parameters.add(occupation);
        parameters.add(diffabled);

// Add user email for exclusion in WHERE clause
        parameters.add(userEmail);

// Add parameters again for filtering conditions in WHERE clause
        parameters.add(province);
        parameters.add(ethnicity);
        parameters.add(religion);
        parameters.add(status);
        parameters.add(height);
        parameters.add(foodpreferences);
        parameters.add(drinking);
        parameters.add(smoking);
        parameters.add(qualification);
        parameters.add(occupation);
        parameters.add(diffabled);

        System.out.println("Executing SQL: " + query.toString());
        System.out.println("With parameters: " + parameters);


        try (Connection con = DBConnect.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement(query.toString())) {
            for (int i = 0; i < parameters.size(); i++) {
                preparedStatement.setString(i + 1, parameters.get(i));
            }

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User(
                        resultSet.getString("fname"),
                        resultSet.getString("lname"),
                        resultSet.getString("email"),
                        resultSet.getString("province"),
                        resultSet.getString("ethnicity"),
                        resultSet.getString("religion"),
                        resultSet.getString("status"),
                        resultSet.getString("height"),
                        resultSet.getString("foodpreferences"),
                        resultSet.getString("drinking"),
                        resultSet.getString("smoking"),
                        resultSet.getString("qualification"),
                        resultSet.getString("occupation"),
                        resultSet.getString("diffabled")
                );
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL Error: " + e.getMessage());
        }
        return users;
    }


    public static Optional<User> getUserByEmail(String email) {

        try (Connection con = DBConnect.getConnection()) {
            String sql = "SELECT u.fname, u.lname, u.email, u.province, ui.ethnicity, ui.religion, ui.status, ui.height,ui.foodpreferences,ui.drinking,ui.smoking, ui.qualification, ui.occupation, ui.diffabled, u.age, ui.freli, ui.mreli, ui.foccu, ui.moccup,ui.maritalstatus, ui.siblings FROM user u LEFT JOIN userInfo ui ON u.uID = ui.uID  WHERE u.email = ?";


            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                User user = new User(
                        rs.getString("fname"),
                        rs.getString("lname"),
                        rs.getString("email"),
                        rs.getString("province"),
                        rs.getString("ethnicity"),
                        rs.getString("religion"),
                        rs.getString("status"),
                        rs.getString("height"),
                        rs.getString("foodpreferences"),
                        rs.getString("drinking"),
                        rs.getString("smoking"),
                        rs.getString("qualification"),
                        rs.getString("occupation"),
                        rs.getString("diffabled"),
                        rs.getInt("age"),
                        rs.getString("freli"),
                        rs.getString("mreli"),
                        rs.getString("foccu"),
                        rs.getString("moccup"),
                        rs.getString("maritalstatus"),
                        rs.getInt("siblings")
                        //  rs.getInt("age")
                );
                return Optional.of(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }


    public static boolean addConnectionRequest(String fromUserId, String toUserId) {
        try (Connection con = DBConnect.getConnection()) {
            String sql = "INSERT INTO connection_requests (from_user_id, to_user_id, status, timestamp) VALUES (?, ?,?, NOW())";
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setString(1, fromUserId);
                stmt.setString(2, toUserId);
                stmt.setString(3,RequestType.PENDING.name());
                int rowsAffected = stmt.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // Method to check if a connection request is already pending
    public static boolean isConnectionRequestPending(int fromUserId, int toUserId) {
        try (Connection con = DBConnect.getConnection()) {
            String sql = "SELECT count(*) FROM connection_requests WHERE from_user_id = ? AND to_user_id = ? AND status = 'pending'";
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setInt(1, fromUserId);
                stmt.setInt(2, toUserId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }





    public static List<ConnectionRequest> getConnectionRequestStatus(int userId) throws SQLException {
        List<ConnectionRequest> requests = new ArrayList<>();
        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM connection_requests WHERE from_user_id = ? OR to_user_id = ?")) {
            ps.setInt(1, userId);
            ps.setInt(2, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ConnectionRequest request = new ConnectionRequest(
                            rs.getInt("request_id"),
                            rs.getInt("from_user_id"),
                            rs.getInt("to_user_id"),
                            rs.getString("status")
                    );
                    requests.add(request);
                }
            }
        }
        return requests;
    }

    public static List<ConnectionRequest> getPendingReq(int userId) throws SQLException {
        List<ConnectionRequest> requests = new ArrayList<>();
        String sql = "SELECT * from connection_requests cr WHERE from_user_id=? AND cr.status='PENDING'";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                ConnectionRequest request = new ConnectionRequest(
                        rs.getInt("request_id"),
                        rs.getInt("from_user_id"),
                        rs.getInt("to_user_id"),
                        rs.getString("status")
                );
                requests.add(request);
            }
        }
        return requests;
    }


//Sending horoscope and resquest to astrologer
    public static boolean insertNewRequest(int userId, byte[] horoscope, byte[] horoscopeSecond) throws SQLException {
        String sql = "INSERT INTO request (id,startDate, horoscope, horoscopeSecond, status, userId) VALUES (?,?, ?, ?, ?, ?)";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, UUID.randomUUID().toString());// Generate UUID for id
            statement.setDate(2, new Date(System.currentTimeMillis())); // Use current time for startDate
            if (horoscope != null) {
                statement.setBytes(3, horoscope);
            } else {
                statement.setNull(3, Types.BLOB); // Set NULL if horoscope is null
            }
            if (horoscopeSecond != null) {
                statement.setBytes(4, horoscopeSecond);
            } else {
                statement.setNull(4, Types.BLOB); // Set NULL if horoscopeSecond is null
            }
            statement.setString(5, RequestType.PENDING.name()); // Assuming RequestType is an enum and PENDING is a status
            statement.setInt(6, userId); // Set userId

            int result = statement.executeUpdate();
            return result > 0;
        } catch (SQLException ex) {
            System.err.println("Error during database operation: " + ex.getMessage());
            ex.printStackTrace();
            throw ex;
        }
    }


    public static int countPendingRequests(int userId) throws SQLException {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM connection_requests WHERE from_user_id = ? AND status = 'PENDING'";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        }
        return count;
    }

    public static int countAcceptedRequests(int userId) throws SQLException {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM connection_requests WHERE to_user_id = ? AND status = 'ACCEPTED'";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        }
        return count;
    }

    public static int countNewRequests(int userId) throws SQLException {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM connection_requests " +
                "WHERE to_user_id = ? AND status = 'PENDING' " +
                "AND timestamp >= NOW() - INTERVAL 12 HOUR"; // Adjust this line for different SQL dialects

        // Use try-with-resources to manage database connections and statements
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt(1);  // Get the count from the first column of the ResultSet
                }
            }
        } catch (SQLException e) {
            System.err.println("Error counting new requests: " + e.getMessage());
            throw e;  // Rethrow the exception after logging it
        }
        return count;
    }



    public static boolean updateUserInfo(int uID, String ethnicity, String religion, String caste, String status, String height, String qualification, String school, String occupation, String foodPreferences, String drinking, String smoking, String diffabled) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBConnect.getConnection();

            StringBuilder sql = new StringBuilder("UPDATE userInfo SET ");
            List<String> updates = new ArrayList<>();
            List<Object> params = new ArrayList<>();

            if (ethnicity != null) { updates.add("ethnicity = ?"); params.add(ethnicity); }
            if (religion != null) { updates.add("religion = ?"); params.add(religion); }
            if (caste != null) { updates.add("caste = ?"); params.add(caste); }
            if (status != null) { updates.add("status = ?"); params.add(status); }
            if (height != null) { updates.add("height = ?"); params.add(height); }
            if (qualification != null) { updates.add("qualification = ?"); params.add(qualification); }
            if (school != null) { updates.add("school = ?"); params.add(school); }
            if (occupation != null) { updates.add("occupation = ?"); params.add(occupation); }
            if (foodPreferences != null) { updates.add("foodPreferences = ?"); params.add(foodPreferences); }
            if (drinking != null) { updates.add("drinking = ?"); params.add(drinking); }
            if (smoking != null) { updates.add("smoking = ?"); params.add(smoking); }
            if (diffabled != null) { updates.add("diffabled = ?"); params.add(diffabled); }

            if (updates.isEmpty()) {
                return false; // No update is needed if no fields are changed
            }

            sql.append(String.join(", ", updates));
            sql.append(" WHERE uID = ?");
            params.add(uID); // Add uID as the last parameter

            pstmt = con.prepareStatement(sql.toString());

            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(i + 1, params.get(i));
            }

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public static List<User> getUserInfo(int uID) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT ethnicity, religion, caste, status, height, qualification, school,occupation, foodpreferences, drinking, smoking, diffabled FROM userInfo WHERE uID = ?";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, uID);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String ethnicity = rs.getString("ethnicity");
                String religion = rs.getString("religion");
                String caste = rs.getString("caste");
                String status = rs.getString("status");
                String height = rs.getString("height");
                String qualification = rs.getString("qualification");
                String school = rs.getString("school");
                String occupation = rs.getString("occupation");
                String foodpreferences = rs.getString("foodPreferences");
                String drinking = rs.getString("drinking");
                String smoking = rs.getString("smoking");
                String diffabled = rs.getString("diffabled");

                // Ensure the order of parameters in the User constructor matches these assignments
                User user = new User(ethnicity, religion, caste, status, height, qualification, school,occupation, foodpreferences, drinking, smoking, diffabled);
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }



}