package com.user.model;

public class ConnectionRequest {
    private int requestId;
    private int fromUserId;
    private int toUserId;
    private String status;
    private java.sql.Timestamp timestamp;
    private String fromUserFirstName;
    private String toUserFirstName;
    private String fromUserLastName;
    private String toUserLastName;


    // Constructor
    public ConnectionRequest(int requestId, int fromUserId, int toUserId, String status, java.sql.Timestamp timestamp) {
        this.requestId = requestId;
        this.fromUserId = fromUserId;
        this.toUserId = toUserId;
        this.status = status;
        this.timestamp = timestamp;
    }

    public ConnectionRequest(int requestId, int fromUserId, int toUserId, String status) {
        this.requestId = requestId;
        this.fromUserId = fromUserId;
        this.toUserId = toUserId;
        this.status = status;

    }
    public ConnectionRequest(int requestId, int fromUserId, int toUserId, String status,
                             String fromUserFirstName, String fromUserLastName) {
        this.requestId = requestId;
        this.fromUserId = fromUserId;
        this.toUserId = toUserId;
        this.status = status;
        this.fromUserFirstName = fromUserFirstName;
        this.fromUserLastName = fromUserLastName;
    }

    // Getters and Setters for user details
    public String getFromUserFullName() {
        return fromUserFirstName + " " + fromUserLastName;
    }

    public String getToUserFullName() {
        return toUserFirstName + " " + toUserLastName;
    }



    // Getters and Setters
    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public int getFromUserId() {
        return fromUserId;
    }

    public void setFromUserId(int fromUserId) {
        this.fromUserId = fromUserId;
    }

    public int getToUserId() {
        return toUserId;
    }

    public void setToUserId(int toUserId) {
        this.toUserId = toUserId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public java.sql.Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(java.sql.Timestamp timestamp) {
        this.timestamp = timestamp;
    }
}

