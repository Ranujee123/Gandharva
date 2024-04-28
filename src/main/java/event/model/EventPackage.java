package event.model;

public class EventPackage {
    private int packageNo;
    private int numberOfGuests;
    private int foodFor;
    private int beveragesFor;
    private int tablesChairs;
    private String audioFacilities;
    private String decorations;
    private String foodPartner;
    private String decoPartner;
    private String audioPartner;
    private String tablesPartner;
    private float budgetRange;

    public EventPackage(int packageNo, int numberOfGuests, int foodFor, int beveragesFor, int tablesChairs,
                        String audioFacilities, String decorations, float budgetRange, String foodPartner, String decoPartner, String audioPartner, String tablesPartner) {
        this.packageNo = packageNo;
        this.numberOfGuests = numberOfGuests;
        this.foodFor = foodFor;
        this.beveragesFor = beveragesFor;
        this.tablesChairs = tablesChairs;
        this.audioFacilities = audioFacilities;
        this.decorations = decorations;
        this.budgetRange = budgetRange;
        this.tablesPartner = tablesPartner;
        this.decoPartner = decoPartner;
        this.audioPartner = audioPartner;
        this.foodPartner = foodPartner;
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

    public float getBudgetRange() {
        return budgetRange;
    }

    public void setBudgetRange(float budgetRange) {
        this.budgetRange = budgetRange;
    }

    public String getFoodPartner() {
        return foodPartner;
    }

    public void setFoodPartner(String foodPartner) {
        this.foodPartner = foodPartner;
    }

    public String getDecoPartner() {
        return decoPartner;
    }

    public void setDecoPartner(String decoPartner) {
        this.decoPartner = decoPartner;
    }

    public String getAudioPartner() {
        return audioPartner;
    }

    public void setAudioPartner(String audioPartner) {
        this.audioPartner = audioPartner;
    }

    public String getTablesPartner() {
        return tablesPartner;
    }

    public void setTablesPartner(String tablesPartner) {
        this.tablesPartner = tablesPartner;
    }
}
