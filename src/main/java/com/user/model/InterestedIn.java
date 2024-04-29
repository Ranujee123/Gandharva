package com.user.model;

public class InterestedIn {
    private int uID;
    private int aID;
    private int minAge;
    private int maxAge;
    private String gender;
    private String religion;
    private String caste;
    private String nationality;
    private String country;

    // Constructor that initializes all fields
    public InterestedIn(  int minAge, int maxAge, String gender, String religion, String caste, String nationality, String country) {

        this.minAge = minAge;
        this.maxAge = maxAge;
        this.gender = gender;
        this.religion = religion;
        this.caste = caste;
        this.nationality = nationality;
        this.country = country;
    }

    // Getters and setters
    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public int getaID() {
        return aID;
    }

    public void setaID(int aID) {
        this.aID = aID;
    }

    public int getMinAge() {
        return minAge;
    }

    public void setMinAge(int minAge) {
        this.minAge = minAge;
    }

    public int getMaxAge() {
        return maxAge;
    }

    public void setMaxAge(int maxAge) {
        this.maxAge = maxAge;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
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

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
