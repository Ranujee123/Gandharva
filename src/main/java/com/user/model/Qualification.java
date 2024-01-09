package com.user.model;



public class Qualification {
    private String school;
    private String eduquali;
    private String occupation;
    private String about;


    public Qualification(String school, String eduquali,String occupation,String about){
        this.school=school;
        this.eduquali=eduquali;
        this.occupation=occupation;
        this.about=about;
    }

    public String getSchool() {
        return school;
    }

    public String getEduquali() {
        return eduquali;
    }

    public String getOccupation() {
        return occupation;
    }

    public String getAbout() {
        return about;
    }
}
