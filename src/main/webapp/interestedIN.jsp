
<%--
Created by IntelliJ IDEA.
User: ranu
Date: 2023-11-02
Time: 09:20
To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.user.model.DBConnect" %>
<%@ page import="com.user.model.User" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>

<%
    List<String> ages = UserDBUtil.getAge();

%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Inline CSS styling */
        body {
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #f0f0f0;
        }

        .container {
            display: flex;
            flex: 1;
        }


        .main-content {
            flex: 1;
            padding: 20px;
            text-align: center;
            margin: auto;
            max-width: 600px;

        }

        .form-container input, .form-container textarea, .form-container select {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
        }

        .form-container button {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        .completion-bar {
            width: 100%;
            height: 20px;
            background-color: #ddd;
            margin-top: 20px;
        }

        .completion-fill {
            height: 100%;
            background-color: #4CAF50;
        }

        .completion-text {
            margin-top: 10px;
        }


        .error {
            color: red;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="container">

    <div class="sidebar">
        <div class="profile">
            <img src="images/background.jpg" alt="Profile Image" class="profile-image">
            <p class="profile-name">John Doe</p>
        </div>
        <ul class="sidebar-menu">
            <li><a href="u_myprofile.jsp"><button>My Profile</button></a></li>
            <li><button>Connections</button></li>
            <li><button>Chat</button></li>
            <li><button>Notifications</button></li>
            <li class="dropdown">
                <button>Request Service &#9662;</button>
                <div class="dropdown-content">
                    <button>Astrology Service</button>
                    <button>Event Planner Service</button>
                </div>
            </li>
        </ul>
    </div>


    <div class="main-content">
        <h1>Who are you interested in ?</h1>
        <div class="form-container">
            <form action="interestin" method="post">
                <label>Age range :</label>
                <select name="age" required>
                    <option value=""></option>

                        <% for (String age : ages) { %>
                        <option><%= age %></option>
                        <% } %>
                    </select>

                <label>Gender:</label>
                <select name="gender">
                    <option value=""></option>
                    <option value="male">Male</option>
                    <option value="Female">Female</option>

                    <!-- Add more options as needed -->
                </select><br>


                <label> Religion:</label>
                <select name="Religion">
                    <option value=""></option>
                    <option value="Hindu">Hindu</option>
                    <option value="Christian">Christian</option>
                    <option value="Muslim">Muslim</option>
                    <!-- Add more options as needed -->
                </select><br>

                <label> Caste:</label>
                <select name="caste">
                    <option value=""></option>
                    <option value="Radala">Radala</option>
                    <option value="Govigama">Govigama</option>
                    <option value="Bathgama">Bathgama</option>
                    <option value="Deva">Deva</option>
                    <option value="Nekathi">Nekathi</option>
                    <option value="Bodhivansha">Bodhivansha</option>
                    <option value="Rajaka">Rajaka</option>
                    <option value="kumbal">Kumbal</option>
                    <option value="Hunu">Hunu</option>
                    <option value="Durava"> Durava</option>
                    <option value="Karava">Karava</option>
                    <option value="Salagama">Salagama</option>
                    <option value="Navandanna"> Navandanna</option>
                    <!-- Add more options as needed -->
                </select><br>


                <label> Nationality:</label>
                <select name="nationality">
                    <option value=""></option>
                    <option value="srilankan">Sri Lanakan</option>
                    <option value="american">American</option>
                    <option value="canadian"> Candian</option>
                    <!-- Add more options as needed -->
                </select><br>

                <label> Country of residence:</label>
                <select name="country">
                    <option value=""></option>
                    <option value="srilanka">Sri Lanaka</option>
                    <option value="america">America</option>
                    <option value="canada"> Canda</option>
                    <!-- Add more options as needed -->
                </select><br>




                <div class="completion-bar">
                    <div class="completion-fill" style="width: 70%;"></div> <!-- Adjust the width based on completion -->
                </div>
                <p class="completion-text">3 out of 6 steps left to complete your profile</p>

                <!-- Proceed button -->
                <button type="submit" name="action" value="proceed">Proceed</button>

                <!-- Save Progress button -->
                <button type="submit" formaction="ProfileCompletionServlet" name="action" value="save">Save Progress</button>
            </form>
        </div>



        </form>
    </div>
</div>
</div>

</div>

</body>
</html>
