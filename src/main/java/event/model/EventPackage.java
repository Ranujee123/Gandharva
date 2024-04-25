package event.model;

public class EventPackage {
    private int packageNo;
    private int numberOfGuests;
    private int foodFor;
    private int beveragesFor;
    private int tablesChairs;
    private String audioFacilities;
    private String decorations;
    private String localDJ;
    private String budgetRange;

    public EventPackage(int packageNo, int numberOfGuests, int foodFor, int beveragesFor, int tablesChairs,
                        String audioFacilities, String decorations, String localDJ, String budgetRange) {
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

    public int getPackageNo() {
        return packageNo;
    }

    public void setPackageNo(int packageNo) {
        this.packageNo = packageNo;
    }

    public int getNumberOfGuests() {
        return numberOfGuests;
    }

    public void setNumberOfGuests(int numberOfGuests) {
        this.numberOfGuests = numberOfGuests;
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

    public int getTablesChairs() {
        return tablesChairs;
    }

    public void setTablesChairs(int tablesChairs) {
        this.tablesChairs = tablesChairs;
    }

    public String getAudioFacilities() {
        return audioFacilities;
    }

    public void setAudioFacilities(String audioFacilities) {
        this.audioFacilities = audioFacilities;
    }

    public String getDecorations() {
        return decorations;
    }

    public void setDecorations(String decorations) {
        this.decorations = decorations;
    }

    public String getLocalDJ() {
        return localDJ;
    }

    public void setLocalDJ(String localDJ) {
        this.localDJ = localDJ;
    }

    public String getBudgetRange() {
        return budgetRange;
    }

    public void setBudgetRange(String budgetRange) {
        this.budgetRange = budgetRange;
    }
}
