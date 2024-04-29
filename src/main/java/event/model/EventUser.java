package event.model;

public class EventUser {
    private String id;
    private String firstName;
    private String lastName;
    private String email;
    private String userType;
    private String password;
    private String aboutMe;
    private String phoneNo;
    private int numberOfEventsHandled;
    private int yearsOfExperience;

    public EventUser(String id, String firstName, String lastName, String email, String userType, String password, int numberOfCasesHandled, int yearsOfExperience, String aboutMe, String phoneNo) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.userType = userType;
        this.password = password;
        this.numberOfEventsHandled = numberOfCasesHandled;
        this.yearsOfExperience = yearsOfExperience;
        this.aboutMe = aboutMe;
        this.phoneNo = phoneNo;
    }

    public EventUser(String id, String firstName, String lastName, String email, String userType, String aboutMe) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.userType = userType;
        this.aboutMe = aboutMe;
    }

    public EventUser(String id, String firstName, String lastName, String aboutMe) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.aboutMe = aboutMe;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getNumberOfEventsHandled() {
        return numberOfEventsHandled;
    }

    public void setNumberOfEventsHandled(int numberOfEventsHandled) {
        this.numberOfEventsHandled = numberOfEventsHandled;
    }

    public int getYearsOfExperience() {
        return yearsOfExperience;
    }

    public void setYearsOfExperience(int yearsOfExperience) {
        this.yearsOfExperience = yearsOfExperience;
    }

    public String getAboutMe() {
        return aboutMe;
    }

    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }
}
