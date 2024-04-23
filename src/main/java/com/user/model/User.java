package com.user.model;
public class User {
    private String fname;
    private String lname;
    private String idNumber;
    private int pID;
    private String province;

    private String email;

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

    private String foodpreferences;
    private String drinking;
    private String smoking;
    private String aboutme;
    private String freli;
    private String foccu;
    private String mreli;
    private String moccup;
    private String maritalstatus;
    private int siblings;
    int uID;
    byte[] dpphoto;
    private int personalityID;
    private String occupation;
    // private String province;
    private String qualification;
    private String caste;

    private String foodPreferences;
    private static int Id;
    private String school;

    public User(String fname, String lname, String idNumber, String province, String email, String dob, int age) {
        this.fname = fname;
        this.lname = lname;
        this.idNumber = idNumber;
        this.province = province;
        this.email = email;
        this.dpphoto = dpphoto;
        this.dob = dob;
        this.age = age;
    }


    /* Constructor
    public User(String fname, String lname, String idNumber, String pID, String email,String dpphoto, String dob, String provinceName, int age) {
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
*/
    public User(String fname, String lname, String email, String province, String ethnicity, String religion, String status, String height, String qualification, String occupation) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.age = age;
        this.province = province;
        this.ethnicity = ethnicity;
        this.religion = religion;
        this.status = status;
        this.height = height;
        this.qualification = qualification;
        this.occupation = occupation;
        this.diffabled = diffabled;

    }

    /*
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
    */
    public User(String ethnicity, String religion, String caste, String status,
                String height, String qualification,String school, String occupation,
                String foodpreferences, String drinking, String smoking,
                String diffabled) {
        this.ethnicity = ethnicity;
        this.religion = religion;
        this.caste = caste;
        this.status = status;
        this.height = height;
        this.qualification = qualification;
        this.school=school;
        this.occupation = occupation;
        this.foodpreferences = foodpreferences;
        this.drinking = drinking;
        this.smoking = smoking;
        this.diffabled = diffabled;
    }


    public User(String fname, String lname, String email, String province, String ethnicity, String religion, String status, String height, String foodpreferences, String drinking, String smoking, String qualification, String occupation, String diffabled) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.province = province;
        this.ethnicity = ethnicity;
        this.religion = religion;
        this.status = status;
        this.height = height;
        this.foodpreferences = foodpreferences;
        this.drinking = drinking;
        this.smoking = smoking;
        this.qualification = qualification;
        this.occupation = occupation;
        this.diffabled = diffabled;


    }


    public User(String fname, String lname, String email, String province, String ethnicity, String religion, String status, String height, String foodpreferences, String drinking, String smoking, String qualification, String occupation, String diffabled, int age, String freli, String mreli, String foccu, String moccup, String maritalstatus, int siblings) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.province = province;
        this.ethnicity = ethnicity;
        this.religion = religion;
        this.status = status;
        this.height = height;
        this.foodpreferences = foodpreferences;
        this.drinking = drinking;
        this.smoking = smoking;
        this.qualification = qualification;
        this.occupation = occupation;
        this.diffabled = diffabled;
        this.age = age;
        this.freli = freli;
        this.foccu = foccu;
        this.mreli = mreli;
        this.moccup = moccup;
        this.maritalstatus = maritalstatus;
        this.siblings = siblings;

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
   /* public String getProvinceName() {
        return provinceName;
    }


    */
/*
    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }


 */

    // Getter and Setter for age
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }


    public static int getId() {
        return Id;
    }

    public String getFoodpreferences() {
        return foodpreferences;
    }

    public String getDrinking() {
        return drinking;
    }

    public String getSmoking() {
        return smoking;
    }

    public String getMoccup() {
        return moccup;
    }

    public String getMaritalstatus() {
        return maritalstatus;
    }

    public String getMreli() {
        return mreli;
    }

    public String getFoccu() {
        return foccu;
    }

    public String getFreli() {
        return freli;
    }

    public int getSiblings() {
        return siblings;
    }

    public int getuID() {
        return uID;
    }

    public byte[] getDpphoto() {
        return dpphoto;
    }

    public String getOccupation() {
        return occupation;
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

    public String getCaste() {
        return caste;
    }

    public void setCaste(String caste) {
        this.caste = caste;
    }

    public String getFoodPreferences() {
        return foodPreferences;
    }

    public String getSchool() {
        return school;
    }
}
