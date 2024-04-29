package com.user.model;

public class ConnectionRequest {
    private int requestId;
    private String fromUserId;
    private String toUserId ;
    private String status;
    private String fromUserFullName;
    private String toUserFullName;
    private String fromUserEmail;
    private String toUserEmail;
    private String oppositeUserFullName;
    private String oppositeUserEmail;
    private String connectedUserId;
    private String email;
    private String firstName;
    private String lastName;
private String otheruseremail;
    private String userId;
 //   private String fromUserId;
            private String fromFirstName;
            private String fromLastName;
            private String fromEmail;
 //   private String toUserId;
    private String toFirstName;
    private String toLastName;
    private  String toEmail;
    public ConnectionRequest() {
    }

    // Existing constructors
    public ConnectionRequest(String fromUserId, String toUserId, String status, String fromFirstName, String toFirstName) {
        this.fromUserId = fromUserId;
        this.toUserId = toUserId;
        this.status = status;
        this.fromFirstName = fromFirstName;
        this.toFirstName = toFirstName;
    }


    // Constructor using IDs and names
    public ConnectionRequest(String fromUserId, String toUserId, String status, String fromUserFullName) {
        this.requestId = requestId;
        this.fromUserId = fromUserId;
        this.toUserId = toUserId;
        this.status = status;
        this.fromUserFullName = fromUserFullName;
        this.oppositeUserEmail=oppositeUserEmail;
    }

    public ConnectionRequest(String fromUserId, String fromFirstName, String fromLastName, String fromEmail,
                              String toUserId, String toFirstName, String toLastName, String toEmail) {
        this.fromUserId = fromUserId;
        this.fromFirstName = fromFirstName;
        this.fromLastName = fromLastName;
        this.fromEmail = fromEmail;
        this.toUserId = toUserId;
        this.toFirstName = toFirstName;
        this.toLastName = toLastName;
        this.toEmail = toEmail;
    }

    public ConnectionRequest(int requestId, String fromUserId, String toUserId, String status, String fromUserFullName, String toUserFullName) {
        this.requestId = requestId;
        this.fromUserId = fromUserId;
        this.toUserId = toUserId;
        this.status = status;
        this.fromUserFullName = fromUserFullName;
        this.toUserFullName = toUserFullName;

    }

    public void Connection(String connectedUserId, String email, String firstName, String lastName) {
        this.connectedUserId = connectedUserId;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
    }


    public ConnectionRequest(String userId){
       this.userId=userId;

    }

    // Getters and setters as needed
    public int getRequestId() {
        return requestId;
    }

    public String getFromUserId() {
        return fromUserId;
    }

    public String getToUserId() {
        return toUserId;
    }

    public String getStatus() {
        return status;
    }

    public String getFromUserFullName() {
        return fromUserFullName;
    }

    public String getToUserFullName() {
        return toUserFullName;
    }

    public String getOppositeUserFullName() {
        return oppositeUserFullName;
    }
    public String getOppositeUserEmail() {
        return oppositeUserEmail;
    }

    // Optionally add a setter if needed
    public void setOppositeUserEmail(String oppositeUserEmail) {
        this.oppositeUserEmail = oppositeUserEmail;
    }

    public String getFromUserEmail() {
        return fromUserEmail;
    }

    public String getToUserEmail() {
        return toUserEmail;
    }

    public String getEmail() {
        return email;
    }

    public String getLastName() {
        return lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getConnectedUserId() {
        return connectedUserId;
    }

    public String getUserId() {
        return userId;
    }

    public String getFromFirstName() {
        return fromFirstName;
    }

    public String getFromEmail() {
        return fromEmail;
    }

    public String getToEmail() {
        return toEmail;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
