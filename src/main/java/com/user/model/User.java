package com.user.model;
public class User {
    private  String interests;
    private String id;
    private String maritalStatus;
    private String firstName;
    private String lastName;
    private String nic;
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
    private String phonenumber;
    private String personalitytype;
   private int isVerified;
  private String phoneNumber;

   private String userType;








    public User(String firstName, String lastName, String nic, String province, String phonenumber, byte[] dpphoto, String email, String dob, int age, int isVerified) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.nic = nic;
        this.province = province;
        this.phonenumber = phonenumber;
        this.dpphoto = dpphoto;
        this.email = email;
        this.dob = dob;
        this.age = age;
        this.isVerified = isVerified;
    }



    public User(String firstName, String lastName, String nic, String province,String phonenumber, String email, String dob, int age,int isVerified) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.nic = nic;
        this.province = province;
        this.phonenumber=phonenumber;
        this.email = email;
        this.dpphoto = dpphoto;
        this.dob = dob;
        this.age = age;
        this.isVerified=isVerified;
    }


    //editprofile (userDetails)
    public User(String firstName, String lastName, String nic, String province,String phonenumber, String email, String dob, int age) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.nic = nic;
        this.province = province;
        this.phonenumber=phonenumber;
        this.email = email;
        this.dpphoto = dpphoto;
        this.dob = dob;
        this.age = age;

    }

    //update userfamily info
    public User(String freli, String foccu, String mreli, String moccup, String maritalstatus,  int siblings) {
        this.freli = freli;
        this.foccu = foccu;
        this.mreli = mreli;
        this.moccup = moccup;
        this.maritalstatus = maritalstatus;
        this.siblings = siblings;

    }


    /* Constructor
    public User(String firstName, String lastName, String nic, String pID, String email,String dpphoto, String dob, String provinceName, int age) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.nic = nic;
        this.pID = pID;
        this.email = email;
        this.dpphoto=dpphoto;
        this.dob = dob;
        this.provinceName = provinceName;
        this.age = age;
    }
*/

    //display filter box card method constructor
    public User(String firstName, String lastName, String email, String province, String ethnicity,String religion, String caste, String status, String height, String foodpreferences, String drinking, String smoking, String qualification, String occupation, String diffabled, String personalitytype,int age,String gender)
    {

        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.province = province;
        this.ethnicity = ethnicity;
        this.religion = religion;
        this.caste=caste;
        this.status = status;
        this.height = height;
        this.foodpreferences=foodpreferences;
        this.drinking=drinking;
        this.smoking=smoking;
        this.qualification = qualification;
        this.occupation = occupation;
        this.diffabled = diffabled;
        this.personalitytype=personalitytype;
        this.age=age;
        this.gender=gender;


    }


    /*
        public User(String firstName, String lastName, String email, int age, String provinceName, String ethnicity, String religion, String status, String height, String qualificationName, String occupationName, String diffabled) {
            this.firstName = firstName;
            this.lastName = lastName;
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


    //
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


    public User(String firstName, String lastName, String email, String province, String ethnicity, String religion, String status, String height, String foodpreferences, String drinking, String smoking, String qualification, String occupation, String diffabled) {
        this.firstName = firstName;
        this.lastName = lastName;
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

    //user viewmore
    public User(String firstName, String lastName, String email, String province, String ethnicity, String religion, String status, String height, String foodpreferences, String drinking, String smoking, String qualification, String occupation, String diffabled, int age, String freli, String mreli, String foccu, String moccup, String maritalstatus, int siblings) {
        this.firstName = firstName;
        this.lastName = lastName;
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

    public User(String firstName, String lastName, String email, String province, String ethnicity, String religion, String status, String height, String foodpreferences, String drinking, String smoking, String qualification, String occupation, String diffabled, int age, String freli, String mreli, String foccu, String moccup, String maritalstatus, int siblings,String gender,String userType) {
        this.firstName = firstName;
        this.lastName = lastName;
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
        this.gender=gender;
        this.userType=userType;

    }


//updatepersonalInfo
    public User(String firstName, String lastName, String email, String province, String ethnicity, String religion,
                String status, String height, String foodpreferences, String drinking, String smoking,
                String qualification, String occupation, String diffabled, int age, String freli, String mreli,
                String foccu, String moccup, String maritalStatus, int siblings, int isVerified, String userType,String dob,String phonenumber,byte[] dpphoto) {
        this.firstName = firstName;
        this.lastName = lastName;
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
        this.mreli = mreli;
        this.foccu = foccu;
        this.moccup = moccup;
        this.maritalStatus = maritalStatus;
        this.siblings = siblings;
        this.isVerified = isVerified;
        this.userType=userType;
        this.dob=dob;
        this.phonenumber=phonenumber;
        this.dpphoto=dpphoto;
    }

//updateuserdetails
    public User(String id, String ethnicity, String religion, String caste, String status, String height,
                String foodPreferences, String drinking, String smoking, String diffabled) {
        this.id = id;
        this.ethnicity = ethnicity;
        this.religion = religion;
        this.caste = caste;
        this.status = status;
        this.height = height;
        this.foodPreferences = foodPreferences;
        this.drinking = drinking;
        this.smoking = smoking;
        this.diffabled = diffabled;
    }


    public User(String email, String ethnicity, String religion, String caste, String status,
                String height, String foodPreferences, String drinking, String smoking,
                String diffabled, String qualification, String occupation, String school) {
        this.email = email;
        this.ethnicity = ethnicity;
        this.religion = religion;
        this.caste = caste;
        this.status = status;
        this.height = height;
        this.foodPreferences = foodPreferences;
        this.drinking = drinking;
        this.smoking = smoking;
        this.diffabled = diffabled;
        this.qualification = qualification;
        this.occupation = occupation;
        this.school = school;
    }
//update interest\

    public User(String id, String interests, String personalitytype) {
        this.id = id;
        this.interests = interests;
        this.personalitytype = personalitytype;
    }

    // Constructor for updateinterestedinfamily details
    public User(String id, String freli, String foccu, String mreli, String moccup, String maritalStatus, int siblings) {
        this.id = id;
        this.freli = freli;
        this.foccu = foccu;
        this.mreli = mreli;
        this.moccup = moccup;
        this.maritalStatus = maritalStatus;
        this.siblings = siblings;
    }



    // Constructor for updateinterestedIN
    public User(String id, int minAge, int maxAge, String religion, String caste, String ethnicity, String province) {
        this.id = id;
        this.minAge = minAge;
        this.maxAge = maxAge;
        this.religion = religion;
        this.caste = caste;
        this.ethnicity = ethnicity;
        this.province = province;
    }

    // Constructor for qualification details
    public User(String id, String qualification, String occupation, String school) {
        this.id = id;
        this.qualification = qualification;
        this.occupation = occupation;
        this.school = school;
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

    // Getter and Setter for firstName
    public String getfirstName() {
        return firstName;
    }

    public void setfirstName(String firstName) {
        this.firstName = firstName;
    }

    // Getter and Setter for lastName
    public String getlastName() {
        return lastName;
    }

    public void setlastName(String lastName) {
        this.lastName = lastName;
    }

    // Getter and Setter for nic
    public String getnic() {
        return nic;
    }

    public void setnic(String nic) {
        this.nic = nic;
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

    public String getPhonenumber() {
        return phonenumber;
    }

    public String getSchool() {
        return school;
    }


    public int getIsVerified() {
        return isVerified;
    }

    public String getPersonalitytype() {
        return personalitytype;
    }

    public void setPersonalitytype(String personalitytype) {
        this.personalitytype = personalitytype;
    }


    public String getInterests() {
        return interests;
    }

    public void setInterests(String interests) {
        this.interests = interests;
    }

    public int getMinAge() {
        return minAge;
    }

    public int getMaxAge() {
        return maxAge;
    }

    public String getUserType() {
        return userType;
    }

    public void setDpphoto(byte[] dpphoto) {
        this.dpphoto = dpphoto;
    }
}
