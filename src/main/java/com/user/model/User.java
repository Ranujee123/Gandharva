package com.user.model;
public class User {
    private String fname;
    private String lname;
    private String idNumber;
    private int pID;
    private String email;
    private String dpphoto;
    private String password;
    private String gender;
    private String dob;
    private String provinceName;
    private int age;
    private String ethnicity;
    private String religion;
    private String status;
    private String height;
    private String qualificationName;
    private String occupationName;
    private String diffabled;
   private int minAge;
   private int maxAge;

private static int Id;
    // Constructor
    public User(String fname, String lname, String idNumber, int pID, String email,String dpphoto, String dob, String provinceName, int age) {
        this.fname = fname;
        this.lname = lname;
        this.idNumber = idNumber;
        this.pID = pID;
        this.email = email;
        this.dpphoto=dpphoto;
        this.dob = dob;
        this.provinceName = provinceName;
        this.age = age;
    }

    public User(String fname, String lname, String email, int age, String provinceName, String ethnicity, String religion, String status, String height, String qualificationName, String occupationName, String diffabled) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.age = age;
        this.provinceName = provinceName;
        this.ethnicity = ethnicity;
        this.religion = religion;
        this.status = status;
        this.height = height;
        this.qualificationName = qualificationName;
        this.occupationName = occupationName;
        this.diffabled = diffabled;

    }
    public User(String fname, String lname, String email, String province,String ethnicity, String religion,String status,String height,String qualification,String occupation,String diffabled) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.provinceName = province;
        this.ethnicity = ethnicity;
        this.religion = religion;
        this.status=status;
        this.height=height;
        this.qualificationName=qualification;
        this.occupationName=occupation;
        this.diffabled=diffabled;


    }

    public String getReligion() {
        return religion;
    }

    public String getDiffabled() {
        return diffabled;
    }

    public String getEthnicity() {
        return ethnicity;
    }

    public String getHeight() {
        return height;
    }

    public String getOccupationName() {
        return occupationName;
    }

    public String getQualificationName() {
        return qualificationName;
    }

    public String getStatus() {
        return status;
    }

    // Getter and Setter for fname
    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    // Getter and Setter for lname
    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    // Getter and Setter for idNumber
    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    // Getter and Setter for pID
    public int getPID() {
        return pID;
    }

    public void setPID(int pID) {
        this.pID = pID;
    }

    // Getter and Setter for email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Getter and Setter for password (Note: be cautious about where and how you use this)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // Getter and Setter for gender
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    // Getter and Setter for dob
    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    // Getter and Setter for provinceName
    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    // Getter and Setter for age
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }


    public void setDpphoto(String dpphoto) {
        this.dpphoto = dpphoto;
    }

    public String getDpphoto() {
        return dpphoto;
    }

    public static int getId() {
        return Id;
    }
}
