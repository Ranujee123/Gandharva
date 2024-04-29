package event.model;

public class EventNotification {
    int id;
    String requestStatus;
    String paymentStatus;
    String requestedDate;
    String customer;
    String email;
    int foodFor;
    int beveragesFor;
    int tablesChairs;
    String budgetRange;

    public EventNotification () {

    }

    public EventNotification(int id, String requestStatus, String paymentStatus, String requestedDate, String customer, String email, int foodFor, int beveragesFor, int tablesChairs, String budgetRange) {
        this.id = id;
        this.requestStatus = requestStatus;
        this.paymentStatus = paymentStatus;
        this.requestedDate = requestedDate;
        this.customer = customer;
        this.email = email;
        this.foodFor = foodFor;
        this.beveragesFor = beveragesFor;
        this.tablesChairs = tablesChairs;
        this.budgetRange = budgetRange;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRequestStatus() {
        return requestStatus;
    }

    public void setRequestStatus(String requestStatus) {
        this.requestStatus = requestStatus;
    }

    public String getRequestedDate() {
        return requestedDate;
    }

    public void setRequestedDate(String requestedDate) {
        this.requestedDate = requestedDate;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getBudgetRange() {
        return budgetRange;
    }

    public void setBudgetRange(String budgetRange) {
        this.budgetRange = budgetRange;
    }
}
