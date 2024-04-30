package com.user.controller.astrologer;

import com.user.constants.UserType;
import com.user.dao.AuthDao;
import com.user.dao.LoginDAO;
import com.user.model.UserDBUtil;
import com.user.model.astrologer.AllUser;
import com.user.model.astrologer.Login;
import com.user.model.astrologer.ParentUser;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.Objects;

import static com.user.constants.PasswordHashing.obtainSHA;
import static com.user.constants.PasswordHashing.toHexStr;

public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("Astrologer/Astrologer_Login.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/plain");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            password = toHexStr(obtainSHA(password));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        Login login = new Login(email, password);

        try {
            ParentUser loginData = LoginDAO.getLoginData(login);

            assert loginData != null;

            HttpSession session = req.getSession(true);
            session.setAttribute("id", loginData.getId().toString());
            session.setAttribute("firstName", loginData.getFirstName());
            session.setAttribute("lastName", loginData.getLastName());
            session.setAttribute("userType", loginData.getUserType());
            session.setAttribute("loggedInUser", loginData);

            System.out.println(loginData.getId().toString());
            UserType userType = loginData.getUserType();

            AllUser allUser = AuthDao.getUser(loginData.getId().toString());

            System.out.println(allUser.getIsActivated());

            if(allUser != null && allUser.getIsActivated()) {
                if (checkLogin(login, loginData)) {
                    switch (userType) {
                        case GUEST_USER:
                            session.setAttribute("userEmail", loginData.getEmail());
                            session.setAttribute("userId", loginData.getId());
                            session.setAttribute("guestUser", allUser);
                            out.print("0");
                            break;
                        case PREMIUM_USER:
                            session.setAttribute("userEmail", loginData.getEmail());
                            session.setAttribute("userId", loginData.getId());
                            session.setAttribute("premiumUser", allUser);
                            updateProfileCompletionStatus(session, email);
                            out.print("1");
                            break;
                        case STANDARD_USER:
                            session.setAttribute("userEmail", loginData.getEmail());
                            session.setAttribute("userId", loginData.getId());
                            session.setAttribute("standardUser", allUser);
                            updateProfileCompletionStatus(session, email);
                            out.print("2");
                            break;
                        case ASTROLOGER:
                            session.setAttribute("astrologer", allUser);
                            out.print("3");
                            break;
                        case EVENT_PLANNER:
                            session.setAttribute("eventPlanner", allUser);
                            session.setAttribute("userId", loginData.getId().toString());
                            session.setAttribute("firstName",allUser.getFirstName());
                            session.setAttribute("lastName", allUser.getLastName());
                            session.setAttribute("email", loginData.getEmail());
                            out.print("4");
                            break;
                        case ADMIN:
                            session.setAttribute("admin", allUser);
                            out.print("5");
                            break;
                        default:
                            out.print("6");
                            break;
                    }
                } else {
                    out.print("6");
                }
            } else {
                out.print("7");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public boolean checkLogin(Login login_user, ParentUser loginData) {
        if ((Objects.equals(login_user.getEmail(), loginData.getEmail())) && (Objects.equals(login_user.getPassword(), loginData.getPassword()))) {
            return true;
        } else {
            System.out.println("Login incorrect");
            return false;
        }
    }


    private void updateProfileCompletionStatus(HttpSession session, String userEmail) {
        // Assume these methods return true if the respective section is completed
        boolean personalDetailsCompleted = UserDBUtil.isPersonalDetailsCompleted(userEmail);
        boolean qualificationCompleted = UserDBUtil.isQualificationDetailsCompleted(userEmail);
        boolean familyDetailsCompleted = UserDBUtil.isFamilyDetailsCompleted(userEmail);
        boolean interestCompleted = UserDBUtil.isInterestCompleted(userEmail);
        boolean interestedINCompleted = UserDBUtil.isInterestedINCompleted(userEmail);
        boolean interestedINQualCompleted = UserDBUtil.isInterestedINQualCompleted(userEmail);
        boolean interestedINFamDetailsCompleted = UserDBUtil.isinterestedINFamDetailsCompleted(userEmail);

        int completedSteps = (personalDetailsCompleted ? 1 : 0) +
                (qualificationCompleted ? 1 : 0) +
                (familyDetailsCompleted ? 1 : 0) +
                (interestCompleted ? 1 : 0) +
                (interestedINCompleted ? 1 : 0) +
                (interestedINQualCompleted ? 1 : 0) +
                (interestedINFamDetailsCompleted ? 1 : 0);
        int totalSteps = 7;
        int completionPercentage = (completedSteps * 100) / totalSteps;

        session.setAttribute("completedSteps", completedSteps);
        session.setAttribute("totalSteps", totalSteps);
        session.setAttribute("completionPercentage", completionPercentage);
    }

}
