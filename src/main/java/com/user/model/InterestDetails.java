package com.user.model;

public class InterestDetails {
    private int uID;
    private String interests;
    private int pID;

    public int getuID() {
        return uID;
    }

    public int getpID() {
        return pID;
    }

    public String getInterests() {
        return interests;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public void setInterests(String interests) {
        this.interests = interests;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }
}
