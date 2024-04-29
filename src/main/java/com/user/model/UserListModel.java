package com.user.model;
import java.sql.Date;


public class UserListModel {
    private String id;
    private String firstName;
    private String lastName;
    private String email;
    private String userType;
    private String countryOfResidence;
    private String district;
    private String nic;
    private Date birthday;
    private int numberOfCasesHandled;
    private int yearsOfExperience;
    private String certificateFileUpload;
    private String brFileUpload;
    private byte[] userImage;
    private String base64Image;
    private  String status;
    private String backphoto;
    private String frontphoto;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getBackphoto() {
        return backphoto;
    }

    public void setBackphoto(String backphoto) {
        this.backphoto = backphoto;
    }

    public String getFrontphoto() {
        return frontphoto;
    }

    public void setFrontphoto(String frontphoto) {
        this.frontphoto = frontphoto;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getCountryOfResidence() {
        return countryOfResidence;
    }

    public void setCountryOfResidence(String countryOfResidence) {
        this.countryOfResidence = countryOfResidence;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public int getNumberOfCasesHandled() {
        return numberOfCasesHandled;
    }

    public void setNumberOfCasesHandled(int numberOfCasesHandled) {
        this.numberOfCasesHandled = numberOfCasesHandled;
    }

    public int getYearsOfExperience() {
        return yearsOfExperience;
    }

    public void setYearsOfExperience(int yearsOfExperience) {
        this.yearsOfExperience = yearsOfExperience;
    }

    public String getCertificateFileUpload() {
        return certificateFileUpload;
    }

    public void setCertificateFileUpload(String certificateFileUpload) {
        this.certificateFileUpload = certificateFileUpload;
    }

    public String getBrFileUpload() {
        return brFileUpload;
    }

    public void setBrFileUpload(String brFileUpload) {
        this.brFileUpload = brFileUpload;
    }

    public byte[] getUserImage() {
        return userImage;
    }

    public void setUserImage(byte[] userImage) {
        this.userImage = userImage;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }

    public String getBase64Image() {
        return base64Image;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getStat() {
        return status;
    }

    public void setStat(String status) {
        this.status = status;
    }
}
