package event.service;

import event.model.EventNotification;

import java.util.List;

public interface IEventNotification {
    public List<EventNotification> getPendingEvents() throws Exception;
    public List<EventNotification> getReservationEvents() throws Exception;
    public int getTotalEvents(String id) throws Exception;
    public void updateReservationStatus(int id, String status) throws Exception;
}
