package event.service;

import com.user.model.User;
import event.model.EventUser;

public interface IEventUser {
    public void registerEventUser(EventUser eventUser) throws Exception;
    public boolean loginEventUser(String email, String password) throws Exception;
    public EventUser getUserByEmail(String email) throws Exception;
}
