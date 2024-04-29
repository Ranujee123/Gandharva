package com.user.model;

public class EventPackage {
	private int id;
	private int packageNo;
	private int numberOfGuests;
	private int foodFor;
	private int beveragesFor;
	private int tablesChairs;
	private String audioFacilities;
	private String decorations;
	private String localDJ;
	private String budgetRange;
	
	public EventPackage() {
		
	}
	
	public EventPackage(int id, int packageNo, int numberOfGuests, int foodFor, int beveragesFor, int tablesChairs,
			String audioFacilities, String decorations, String localDJ, String budgetRange) {
		this.id = id;
		this.packageNo = packageNo;
		this.numberOfGuests = numberOfGuests;
		this.foodFor = foodFor;
		this.beveragesFor = beveragesFor;
		this.tablesChairs = tablesChairs;
		this.audioFacilities = audioFacilities;
		this.decorations = decorations;
		this.localDJ = localDJ;
		this.budgetRange = budgetRange;
	}

	public int getId() {
		return id;
	}

	public int getPackageNo() {
		return packageNo;
	}

	public int getNumberOfGuests() {
		return numberOfGuests;
	}

	public int getFoodFor() {
		return foodFor;
	}

	public int getBeveragesFor() {
		return beveragesFor;
	}

	public int getTablesChairs() {
		return tablesChairs;
	}

	public String getAudioFacilities() {
		return audioFacilities;
	}

	public String getDecorations() {
		return decorations;
	}

	public String getLocalDJ() {
		return localDJ;
	}

	public String getBudgetRange() {
		return budgetRange;
	}
	
}