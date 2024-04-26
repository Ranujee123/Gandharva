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
    private UUID Link_Id;
    private String payment_reason;

    public Payment() {}

    public Payment(Date paymentDate, Time paymentTime, double paymentAmount, String paymentStatus, String cusFirstName, String cusLastName, String cusAddress, String cusCity, byte[] statement, UUID userId, UUID Link_Id, String payment_reason) {
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
        this.Link_Id = Link_Id;
        this.payment_reason = payment_reason;
    }

    public Payment(UUID id, Date paymentDate, Time paymentTime, double paymentAmount, String paymentStatus, String cusFirstName, String cusLastName, String cusAddress, String cusCity, byte[] statement, UUID userId, UUID Link_Id, String payment_reason) {
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
        this.Link_Id = Link_Id;
        this.payment_reason = payment_reason;
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

    public Time getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(Time paymentTime) {
        this.paymentTime = paymentTime;
    }

    public UUID getLink_Id() {
        return Link_Id;
    }

    public void setLink_Id(UUID link_Id) {
        Link_Id = link_Id;
    }

    public String getPayment_reason() {
        return payment_reason;
    }

    public void setPayment_reason(String payment_reason) {
        this.payment_reason = payment_reason;
    }
}
