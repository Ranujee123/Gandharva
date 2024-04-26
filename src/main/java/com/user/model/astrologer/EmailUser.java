package com.user.model.astrologer;

public class EmailUser {
    private String firstName;
    private String latName;
    private String email;
    private String code;

    public EmailUser() {
    }

    public EmailUser(String firstName, String latName, String email, String code) {
        this.firstName = firstName;
        this.latName = latName;
        this.email = email;
        this.code = code;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLatName() {
        return latName;
    }

    public void setLatName(String latName) {
        this.latName = latName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
