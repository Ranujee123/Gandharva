package com.user.model.astrologer;

import java.sql.Date;
import java.sql.Time;
import java.util.UUID;

public class Payment {
    private UUID id;
    private Date paymentDate;
    private Time paymentTime;
//    private String paymentMethod;
//    private Date previousExpireDate;
//    private String currency;
    private double paymentAmount;
//    private String authorizationToken;
    private String paymentStatus;
    private String cusFirstName;
    private String cusLastName;
    private String cusAddress;
    private String cusCity;
    private byte[] statement;
//    private Date newExpireDate;
    private UUID userId;
    private UUID requestId;

    public Payment() {}

    public Payment(Date paymentDate, Time paymentTime, double paymentAmount, String paymentStatus, String cusFirstName, String cusLastName, String cusAddress, String cusCity, byte[] statement, UUID userId, UUID requestId) {
        this.id = UUID.randomUUID();
        this.paymentDate = paymentDate;
        this.paymentTime = paymentTime;
        this.paymentAmount = paymentAmount;
        this.paymentStatus = paymentStatus;
        this.cusFirstName = cusFirstName;
        this.cusLastName = cusLastName;
        this.cusAddress = cusAddress;
        this.cusCity = cusCity;
        this.statement = statement;
        this.userId = userId;
        this.requestId = requestId;
    }

    public Payment(UUID id, Date paymentDate, Time paymentTime, double paymentAmount, String paymentStatus, String cusFirstName, String cusLastName, String cusAddress, String cusCity, byte[] statement, UUID userId, UUID requestId) {
        this.id = id;
        this.paymentDate = paymentDate;
        this.paymentTime = paymentTime;
        this.paymentAmount = paymentAmount;
        this.paymentStatus = paymentStatus;
        this.cusFirstName = cusFirstName;
        this.cusLastName = cusLastName;
        this.cusAddress = cusAddress;
        this.cusCity = cusCity;
        this.statement = statement;
        this.userId = userId;
        this.requestId = requestId;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public double getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(double paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getCusFirstName() {
        return cusFirstName;
    }

    public void setCusFirstName(String cusFirstName) {
        this.cusFirstName = cusFirstName;
    }

    public String getCusLastName() {
        return cusLastName;
    }

    public void setCusLastName(String cusLastName) {
        this.cusLastName = cusLastName;
    }

    public String getCusAddress() {
        return cusAddress;
    }

    public void setCusAddress(String cusAddress) {
        this.cusAddress = cusAddress;
    }

    public String getCusCity() {
        return cusCity;
    }

    public void setCusCity(String cusCity) {
        this.cusCity = cusCity;
    }

    public byte[] getStatement() {
        return statement;
    }

    public void setStatement(byte[] statement) {
        this.statement = statement;
    }

    public UUID getUserId() {
        return userId;
    }

    public void setUserId(UUID userId) {
        this.userId = userId;
    }

    public UUID getRequestId() {
        return requestId;
    }

    public void setRequestId(UUID requestId) {
        this.requestId = requestId;
    }

    public Time getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(Time paymentTime) {
        this.paymentTime = paymentTime;
    }
}
