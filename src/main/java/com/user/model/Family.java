package com.user.model;

public class Family {

    private String fathername;
    private String fatherreli;
    private String mothername;
    private String motherreli;
    private String foccupation;
    private String moccupation;
    private String maritelstatus;
    private String nosiblings;

    public Family(String fathername,String fatherreli,String mothername,String motherreli,String foccupation,String moccupation,String maritelstatus,String nosiblings){
        this.fathername=fathername;
        this.fatherreli=fatherreli;
        this.mothername=mothername;
        this.motherreli= motherreli;
        this.foccupation=foccupation;
        this.moccupation=moccupation;
        this.maritelstatus=maritelstatus;
        this.nosiblings=nosiblings;
    }

    public String getFathername() {
        return fathername;
    }

    public String getFatherreli() {
        return fatherreli;
    }

    public String getMothername() {
        return mothername;
    }

    public String getMotherreli() {
        return motherreli;
    }

    public String getFoccupation() {
        return foccupation;
    }

    public String getMoccupation() {
        return moccupation;
    }

    public String getMaritelstatus() {
        return maritelstatus;
    }

    public String getNosiblings() {
        return nosiblings;
    }
}
