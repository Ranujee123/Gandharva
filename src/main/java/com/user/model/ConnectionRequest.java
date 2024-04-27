package com.user.model;

public class ConnectionRequest {
    private int requestId;
    private String fromUserId;
    private String toUserId;
    private String status;
    private String fromUserFullName;
    private String toUserFullName;
    private String fromUserEmail;
    private String toUserEmail;
    private String oppositeUserFullName;
    private String oppositeUserEmail;

    // Constructor using IDs and names
    public ConnectionRequest(int requestId, String fromUserId, String toUserId, String status, String fromUserFullName, String toUserFullName,String oppositeUserEmail) {
        this.requestId = requestId;
        this.fromUserId = fromUserId;
        this.toUserId = toUserId;
        this.status = status;
        this.fromUserFullName = fromUserFullName;
        this.oppositeUserEmail=oppositeUserEmail;
    }



    public ConnectionRequest(int requestId, String fromUserId, String toUserId, String status, String fromUserFullName, String toUserFullName) {
        this.requestId = requestId;
        this.fromUserId = fromUserId;
        this.toUserId = toUserId;
        this.status = status;
        this.fromUserFullName = fromUserFullName;
        this.toUserFullName = toUserFullName;

    }


    public ConnectionRequest(String oppositeUserEmail){
        this.oppositeUserEmail=oppositeUserEmail;

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
}
