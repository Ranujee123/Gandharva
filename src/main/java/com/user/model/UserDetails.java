package com.user.model;

public class UserDetails {

    private int uID;
    private int qID;
    private int oID;
    private String school;

    public int getuID() {
        return uID;
    }

    public int getqID() {
        return qID;
    }

    public int getoID() {
        return oID;
    }

    public String getSchool() {
        return school;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public void setqID(int qID) {
        this.qID = qID;
    }

    public void setoID(int oID) {
        this.oID = oID;
    }

    public void setSchool(String school) {
        this.school = school;
    }
}
