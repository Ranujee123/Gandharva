package com.user.model;

public class AdminDashboardmodels {
    int totalUsers, StanderdUsers, PremiumUsers, EventPlanners,Astrologers;
    int paymentAstrologers, paymentUsers, paymentPremiumUsers,paymentEvents;

    public AdminDashboardmodels() {
    }

    public int getTotalUsers() {
        return totalUsers;
    }

    public void setTotalUsers(int totalUsers) {
        this.totalUsers = totalUsers;
    }

    public int getStanderdUsers() {
        return StanderdUsers;
    }

    public void setStanderdUsers(int standerdUsers) {
        StanderdUsers = standerdUsers;
    }

    public int getPremiumUsers() {
        return PremiumUsers;
    }

    public void setPremiumUsers(int premiumUsers) {
        PremiumUsers = premiumUsers;
    }

    public int getPaymentAstrologers() {
        return paymentAstrologers;
    }

    public void setPaymentAstrologers(int paymentAstrologers) {
        this.paymentAstrologers = paymentAstrologers;
    }

    public int getPaymentUsers() {
        return paymentUsers;
    }

    public void setPaymentUsers(int paymentUsers) {
        this.paymentUsers = paymentUsers;
    }

    public int getPaymentPremiumUsers() {
        return paymentPremiumUsers;
    }

    public void setPaymentPremiumUsers(int paymentPremiumUsers) {
        this.paymentPremiumUsers = paymentPremiumUsers;
    }

    public int getPaymentEvents() {
        return paymentEvents;
    }

    public void setPaymentEvents(int paymentEvents) {
        this.paymentEvents = paymentEvents;
    }

    public int getEventPlanners() {
        return EventPlanners;
    }

    public void setEventPlanners(int eventPlanners) {
        EventPlanners = eventPlanners;
    }

    public int getAstrologers() {
        return Astrologers;
    }

    public void setAstrologers(int astrologers) {
        Astrologers = astrologers;
    }
}
