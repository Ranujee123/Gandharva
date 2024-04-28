package event.service;

import event.model.EventPartner;

import java.util.List;
import java.util.Map;

public interface IEventPartnerService {
    public void addPartner(EventPartner eventPartner) throws Exception;
    public List<EventPartner> getPartnersByType(String type) throws Exception;
    public Map<String, List<EventPartner>> getAllPartnersGroupByType() throws Exception;
}
