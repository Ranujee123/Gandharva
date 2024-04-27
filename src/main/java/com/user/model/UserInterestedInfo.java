package com.user.model;

/**
 * This class represents the interests and preferences of a user,
 * specifying what they are looking for in other users.
 */
public class UserInterestedInfo {
    private String userId;
    private Integer minAge;
    private Integer maxAge;
    private String religion;
    private String caste;
    private String ethnicity;
    private String province;
    private String qualification;
    private String occupation;
    private String freli;
    private String foccu;

    private String mreli;
    private String moccup;
    private String maritalstatus;
    private String siblings;

    // Constructors
    public UserInterestedInfo() {
    }

    public UserInterestedInfo(String userId, Integer minAge, Integer maxAge, String religion, String caste, String ethnicity, String province, String qualification, String occupation,String freli,String foccu,String mreli,String moccup,String maritalstatus,String siblings) {
        this.userId = userId;
        this.minAge = minAge;
        this.maxAge = maxAge;
        this.religion = religion;
        this.caste = caste;
        this.ethnicity = ethnicity;
        this.province = province;
        this.qualification = qualification;
        this.occupation = occupation;
        this.freli=freli;
        this.foccu=foccu;
        this.mreli=mreli;
        this.moccup=moccup;
        this.maritalstatus=maritalstatus;
        this.siblings=siblings;
    }

    // Getters and Setters
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getMinAge() {
        return minAge;
    }

    public void setMinAge(Integer minAge) {
        this.minAge = minAge;
    }

    public Integer getMaxAge() {
        return maxAge;
    }

    public void setMaxAge(Integer maxAge) {
        this.maxAge = maxAge;
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

    public String getEthnicity() {
        return ethnicity;
    }

    public void setEthnicity(String ethnicity) {
        this.ethnicity = ethnicity;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
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

    public String getFreli() {
        return freli;
    }

    public String getFoccu() {
        return foccu;
    }

    public String getMreli() {
        return mreli;
    }

    public String getMaritalstatus() {
        return maritalstatus;
    }

    public String getMoccup() {
        return moccup;
    }

    public String getSiblings() {
        return siblings;
    }


    public void setSiblings(String siblings) {
        this.siblings = siblings;
    }

    public void setMaritalstatus(String maritalstatus) {
        this.maritalstatus = maritalstatus;
    }

    public void setMoccup(String moccup) {
        this.moccup = moccup;
    }

    public void setMreli(String mreli) {
        this.mreli = mreli;
    }

    public void setFreli(String freli) {
        this.freli = freli;
    }

    public void setFoccu(String foccu) {
        this.foccu = foccu;
    }

    // To String Method
    @Override
    public String toString() {
        return "UserInterestedInfo{" +
                "userId='" + userId + '\'' +
                ", minAge=" + minAge +
                ", maxAge=" + maxAge +
                ", religion='" + religion + '\'' +
                ", caste='" + caste + '\'' +
                ", ethnicity='" + ethnicity + '\'' +
                ", province='" + province + '\'' +
                ", qualification='" + qualification + '\'' +
                ", occupation='" + occupation + '\'' +
                '}';
    }
}
