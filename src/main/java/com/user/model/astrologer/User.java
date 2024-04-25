package com.user.model.astrologer;

import java.time.LocalDate;

public class User extends ParentUser {
    private String nic;
    private LocalDate birthday;
    private byte[] dpphoto;
    private byte[] frontphoto;
    private byte[] backphoto;
    private String gender;
    private int age;

    public User() {}

    public User(String nic, LocalDate birthday) {
        this.nic = nic;
        this.birthday = birthday;
    }

    public User(ParentUser parentUser){
        super(parentUser.getId(), parentUser.getFirstName(), parentUser.getLastName(), parentUser.getUserType(), parentUser.getEmail(),
                parentUser.getPassword(), parentUser.getCountryOfResidence(), parentUser.getDistrict());
    }

    public User(ParentUser parentUser, String nic, LocalDate birthday) {
        super(parentUser.getFirstName(), parentUser.getLastName(), parentUser.getUserType(), parentUser.getEmail(),
                parentUser.getPassword(), parentUser.getCountryOfResidence(), parentUser.getDistrict(), parentUser.getUserImage());
        this.nic = nic;
        this.birthday = birthday;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public byte[] getDpphoto() {
        return dpphoto;
    }

    public void setDpphoto(byte[] dpphoto) {
        this.dpphoto = dpphoto;
    }

    public byte[] getFrontphoto() {
        return frontphoto;
    }

    public void setFrontphoto(byte[] frontphoto) {
        this.frontphoto = frontphoto;
    }

    public byte[] getBackphoto() {
        return backphoto;
    }

    public void setBackphoto(byte[] backphoto) {
        this.backphoto = backphoto;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
