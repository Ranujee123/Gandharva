package com.user.model;

public class ConnectionRequest {
    private int requestId;
    private String fromUserId;
    private String toUserId;
    private String status;
    private String fromUserFullName;
    private String toUserFullName;
    private String oppositeUserFullName;

    // Constructor using IDs and names
    public ConnectionRequest(int requestId, String fromUserId, String toUserId, String status, String fromUserFullName, String toUserFullName) {
        this.requestId = requestId;
        this.fromUserId = fromUserId;
        this.toUserId = toUserId;
        this.status = status;
        this.fromUserFullName = fromUserFullName;
        this.toUserFullName = toUserFullName;
    }

    public ConnectionRequest(int requestId, String fromUserId, String toUserId, String status, String oppositeUserFullName) {
        this.requestId = requestId;
        this.fromUserId = fromUserId;
        this.toUserId = toUserId;
        this.status = status;
        this.oppositeUserFullName = oppositeUserFullName;
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
}
