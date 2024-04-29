package event.model;

public class EventPartner {
    String partnerName;
    String partnerType;

    public EventPartner(String partnerName, String partnerType) {
        this.partnerName = partnerName;
        this.partnerType = partnerType;
    }

    public String getPartnerName() {
        return partnerName;
    }

    public void setPartnerName(String partnerName) {
        this.partnerName = partnerName;
    }

    public String getPartnerType() {
        return partnerType;
    }

    public void setPartnerType(String partnerType) {
        this.partnerType = partnerType;
    }
}
