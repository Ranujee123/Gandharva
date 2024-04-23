package com.user.model;

public class InterestedIn {
    private int uID;
    private int aID;
    private String gender;
    private String religion;
    private String caste;
    private String nationality;
    private String country;



    public int getuID() {
        return uID;
    }

    public int getaID() {
        return aID;
    }

    public String getGender() {
        return gender;
    }

    public String getCaste() {
        return caste;
    }

    public String getReligion() {
        return religion;
    }

    public String getNationality() {
        return nationality;
    }

    public String getCountry() {
        return country;
    }


    public void setuID(int uID) {
        this.uID = uID;
    }

    public void setaID(int aID) {
        this.aID = aID;
    }

    public void setCaste(String caste) {
        this.caste = caste;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }
}
