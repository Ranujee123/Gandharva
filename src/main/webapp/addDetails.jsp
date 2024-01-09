<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-11-03
  Time: 01:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>User Dashboard</title>
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



        .dropdown-content button {
            width: 100%;
            padding: 10px;
            text-align: left;
            background-color: transparent;
            border: none;
            color: #fff;
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
            <p class="profile-name">Vidhara Ranujee</p>
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
        <h1>Qualifications</h1>
        <div class="form-container">
            <form action="qul " method="post">
                <label>School / College:</label>
                <input type="text" name="school" required><br>



                <label>Heighest Education Qualification:</label>
                <select name="eduquali" required>
                    <option value=""></option>
                    <option value="O/L's">O/L's</option>
                    <option value="A/L's">A/L's</option>
                    <option value="MSc">MSc</option>
                    <option value="PhD">PhD</option>
                    <!-- Add more options as needed -->
                </select><br>


                <label>Occupation :</label>
                <select name="occupation" required>
                    <option value=""></option>
                    <option value="accountant">Accountant</option>
                    <option value="architect">Architect</option>
                    <option value="banker">Banker</option>
                    <option value="bussiness">Business Owner</option>
                    <option value="chef">Chef</option>
                    <option value="doctor">Doctor</option>
                    <option value="driver">Driver</option>
                    <option value="engineer">Engineer</option>
                    <option value="farmer">Farmer</option>
                    <option value="government">Governmet Service</option>
                    <option value="graphic designer">Graphic Designer</option>
                    <option value="hotelier">Hotelier</option>
                    <option value="house wife">House Wife</option>
                    <option value="it">IT Professional</option>
                    <option value="lawyer">Lawyer</option>
                    <option value="lecturer">Lecturer</option>
                    <option value="manager">Manager</option>
                    <option value="medical">Medical Professional</option>
                    <option value="military">Military</option>
                    <option value="unemployed">Not Employed</option>
                    <option value="nurse">Nurse</option>
                    <option value="police">Police Officer</option>
                    <option value="qs">Quantity Surveyor</option>
                    <option value="researcher">Researcher</option>
                    <option value="salesExecutive">Sales Executive</option>
                    <option value="selfEmployed">Self Employed</option>
                    <option value="surveyor">Surveyor</option>
                    <option value="teacher">Teacher</option>
                    <option value="technician">Technician</option>
                    <option value="other">Other</option>
                    <!-- Add more options as needed -->
                </select><br>




                <div class="completion-bar">
                    <div class="completion-fill" style="width: 28%;"></div> <!-- Adjust the width based on completion -->
                </div>
                <p class="completion-text">2 out of 7 is completed</p>

                <button type="submit">Save Progress</button>
                <a href="NextPageServlet"><button type="button">Proceed</button></a>
            </form>
        </div>



        </form>
    </div>
</div>
</div>

</div>

</body>
</html>
