package com.user.model;

public class ConnectionRequest {
    private int requestId;
    private String fromUserId;
    private String toUserId;
    private String status;
    private java.sql.Timestamp timestamp;
    private String fromUserFirstName;
    private String toUserFirstName;
    private String fromUserLastName;
    private String toUserLastName;

    private int pendingRequests;
    private int acceptedRequests;

    // Constructors
    public ConnectionRequest(int requestId, String fromUserId, String toUserId, String status) {
        this.requestId = requestId;
        this.fromUserId = fromUserId;
        this.toUserId = toUserId;
        this.status = status;
    }

    public ConnectionRequest(int requestId, String fromUserId, String toUserId, String status, java.sql.Timestamp timestamp) {
        this.requestId = requestId;
        this.fromUserId = fromUserId;
        this.toUserId = toUserId;
        this.status = status;
        this.timestamp = timestamp;
    }

    public ConnectionRequest(int requestId, String fromUserId, String toUserId, String status,
                             String fromUserFirstName, String fromUserLastName, java.sql.Timestamp timestamp) {
        this.requestId = requestId;
        this.fromUserId = fromUserId;
        this.toUserId = toUserId;
        this.status = status;
        this.fromUserFirstName = fromUserFirstName;
        this.fromUserLastName = fromUserLastName;
        this.timestamp = timestamp;
    }

    public ConnectionRequest(int pendingRequests, int acceptedRequests){
        this.pendingRequests = pendingRequests;
        this.acceptedRequests = acceptedRequests;
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

    public String getFromUserId() {
        return fromUserId;
    }

    public void setFromUserId(String fromUserId) {
        this.fromUserId = fromUserId;
    }

    public String getToUserId() {
        return toUserId;
    }

    public void setToUserId(String toUserId) {
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

    public int getAcceptedRequests() {
        return acceptedRequests;
    }

    public int getPendingRequests() {
        return pendingRequests;
    }
}
