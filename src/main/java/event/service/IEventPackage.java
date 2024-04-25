package event.service;

import event.model.EventPackage;

import java.util.List;

public interface IEventPackage {
    void addPackage(EventPackage eventPackage) throws Exception;
    List<EventPackage> getAllPackages() throws Exception;
}
