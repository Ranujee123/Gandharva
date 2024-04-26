package com.user.model;

/**
 * This class represents the filtering criteria for querying users based on various attributes.
 */
public class UserFilterCriteria {
    private String province;
    private String ethnicity;
    private String religion;
    private String caste;
    private String status;
    private String height;
    private String foodPreferences;
    private String drinking;
    private String smoking;
    private String qualification;
    private String occupation;
    private String diffabled;
    private String personalityType;
    private String userEmail;  // To exclude current user from results

    // Constructors
    public UserFilterCriteria() {
    }

    // Constructor with all parameters
    public UserFilterCriteria(String province, String ethnicity, String religion, String caste, String status,
                              String height, String foodPreferences, String drinking, String smoking,
                              String qualification, String occupation, String diffabled, String personalityType, String userEmail) {
        this.province = province;
        this.ethnicity = ethnicity;
        this.religion = religion;
        this.caste = caste;
        this.status = status;
        this.height = height;
        this.foodPreferences = foodPreferences;
        this.drinking = drinking;
        this.smoking = smoking;
        this.qualification = qualification;
        this.occupation = occupation;
        this.diffabled = diffabled;
        this.personalityType = personalityType;
        this.userEmail = userEmail;
    }

    // Getters and Setters
    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getEthnicity() {
        return ethnicity;
    }

    public void setEthnicity(String ethnicity) {
        this.ethnicity = ethnicity;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getCaste() {
        return caste;
    }

    public void setCaste(String caste) {
        this.caste = caste;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getFoodPreferences() {
        return foodPreferences;
    }

    public void setFoodPreferences(String foodPreferences) {
        this.foodPreferences = foodPreferences;
    }

    public String getDrinking() {
        return drinking;
    }

    public void setDrinking(String drinking) {
        this.drinking = drinking;
    }

    public String getSmoking() {
        return smoking;
    }

    public void setSmoking(String smoking) {
        this.smoking = smoking;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getDiffabled() {
        return diffabled;
    }

    public void setDiffabled(String diffabled) {
        this.diffabled = diffabled;
    }

    public String getPersonalityType() {
        return personalityType;
    }

    public void setPersonalityType(String personalityType) {
        this.personalityType = personalityType;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
}
