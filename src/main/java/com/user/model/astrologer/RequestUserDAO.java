package com.user.model.astrologer;

import com.user.constants.RequestType;
import com.user.constants.UserType;

import java.sql.Date;
import java.util.UUID;

public class RequestUserDAO extends Request{
    private String firstName;
    private String lastName;
    private String email;
    private UserType userType;

    public RequestUserDAO() {}

    public RequestUserDAO(String firstName, String lastName, String email, UserType userType) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.userType = userType;
    }

    public RequestUserDAO(Date startDate, Date deadline, byte[] horoscope, RequestType status, String comments, String feedback, UUID userId, UUID astrologerId, String firstName, String lastName, String email, UserType userType) {
        super(startDate, deadline, horoscope, status, comments, feedback, userId, astrologerId);
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.userType = userType;
    }

    public RequestUserDAO(UUID id, Date startDate, Date deadline, byte[] horoscope, RequestType status, String comments, String feedback, UUID userId, UUID astrologerId, byte[] horoscopeSecond, byte[] feedbackImage, String firstName, String lastName, String email, UserType userType) {
        super(id, startDate, deadline, horoscope, status, comments, feedback, userId, astrologerId, horoscopeSecond, feedbackImage);
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.userType = userType;
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

    public UserType getUserType() {
        return userType;
    }

    public void setUserType(UserType userType) {
        this.userType = userType;
    }
}
