package com.user.model;

public class EventPlannerRequest {
	private int id;
	private int foodFor;
	private int beveragesFor;
	private String foodBevSupplier;
	private int tablesChairs;
	private String tablesChairsSupplier;
	private String audioSupplier;
	private String decorationsSupplier;
	private String djSupplier;
	private String budgetRange;
	private String userId;
	private String eventPlannerId;
	private String requestStatus;
	private String paymentStatus;
	private String requestedDate;

	public EventPlannerRequest() {
		super();
	}

	public EventPlannerRequest(int foodFor, int beveragesFor, String foodBevSupplier, int tablesChairs,
			String tablesChairsSupplier, String audioSupplier, String decorationsSupplier, String djSupplier,
			String budgetRange, String userId, String eventPlannerId, String requestStatus, String paymentStatus,
			String requestedDate) {
		super();
		this.foodFor = foodFor;
		this.beveragesFor = beveragesFor;
		this.foodBevSupplier = foodBevSupplier;
		this.tablesChairs = tablesChairs;
		this.tablesChairsSupplier = tablesChairsSupplier;
		this.audioSupplier = audioSupplier;
		this.decorationsSupplier = decorationsSupplier;
		this.djSupplier = djSupplier;
		this.budgetRange = budgetRange;
		this.userId = userId;
		this.eventPlannerId = eventPlannerId;
		this.requestStatus = requestStatus;
		this.paymentStatus = paymentStatus;
		this.requestedDate = requestedDate;
	}

	public EventPlannerRequest(int id, int foodFor, int beveragesFor, String foodBevSupplier, int tablesChairs,
			String tablesChairsSupplier, String audioSupplier, String decorationsSupplier, String djSupplier,
			String budgetRange, String userId, String eventPlannerId, String requestStatus, String paymentStatus,
			String requestedDate) {
		super();
		this.id = id;
		this.foodFor = foodFor;
		this.beveragesFor = beveragesFor;
		this.foodBevSupplier = foodBevSupplier;
		this.tablesChairs = tablesChairs;
		this.tablesChairsSupplier = tablesChairsSupplier;
		this.audioSupplier = audioSupplier;
		this.decorationsSupplier = decorationsSupplier;
		this.djSupplier = djSupplier;
		this.budgetRange = budgetRange;
		this.userId = userId;
		this.eventPlannerId = eventPlannerId;
		this.requestStatus = requestStatus;
		this.paymentStatus = paymentStatus;
		this.requestedDate = requestedDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFoodFor() {
		return foodFor;
	}

	public void setFoodFor(int foodFor) {
		this.foodFor = foodFor;
	}

	public int getBeveragesFor() {
		return beveragesFor;
	}

	public void setBeveragesFor(int beveragesFor) {
		this.beveragesFor = beveragesFor;
	}

	public String getFoodBevSupplier() {
		return foodBevSupplier;
	}

	public void setFoodBevSupplier(String foodBevSupplier) {
		this.foodBevSupplier = foodBevSupplier;
	}

	public int getTablesChairs() {
		return tablesChairs;
	}

	public void setTablesChairs(int tablesChairs) {
		this.tablesChairs = tablesChairs;
	}

	public String getTablesChairsSupplier() {
		return tablesChairsSupplier;
	}

	public void setTablesChairsSupplier(String tablesChairsSupplier) {
		this.tablesChairsSupplier = tablesChairsSupplier;
	}

	public String getAudioSupplier() {
		return audioSupplier;
	}

	public void setAudioSupplier(String audioSupplier) {
		this.audioSupplier = audioSupplier;
	}

	public String getDecorationsSupplier() {
		return decorationsSupplier;
	}

	public void setDecorationsSupplier(String decorationsSupplier) {
		this.decorationsSupplier = decorationsSupplier;
	}

	public String getDjSupplier() {
		return djSupplier;
	}

	public void setDjSupplier(String djSupplier) {
		this.djSupplier = djSupplier;
	}

	public String getBudgetRange() {
		return budgetRange;
	}

	public void setBudgetRange(String budgetRange) {
		this.budgetRange = budgetRange;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEventPlannerId() {
		return eventPlannerId;
	}

	public void setEventPlannerId(String eventPlannerId) {
		this.eventPlannerId = eventPlannerId;
	}

	public String getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getRequestedDate() {
		return requestedDate;
	}

	public void setRequestedDate(String requestedDate) {
		this.requestedDate = requestedDate;
	}

}