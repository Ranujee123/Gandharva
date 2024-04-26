
<%--
Created by IntelliJ IDEA.
User: ranu
Date: 2023-11-02
Time: 09:20
To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="logoutbutton.jsp"/>
<c:import url="Final_Sidebar.jsp"/>


<%
    List<String> ages = UserDBUtil.getAge();

%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="u_styles.css">
    <script src="js/validate.js"></script>
    <style>
        /* Inline CSS styling */
        body {
            margin: 0;
            display: flex;
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

        .form-container .button {
            background-color: #4CAF50; /* Green background */
            color: white; /* White text */
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
            border: none;
        }
    </style>

    <script>
        function validateAgeRange() {
            var ageFrom = document.getElementById('minAge').value;
            var ageTo = document.getElementById('maxAge').value;

            // Convert input values to integers
            var from = parseInt(ageFrom);
            var to = parseInt(ageTo);

            // Check if the values are numeric
            if (isNaN(from) || isNaN(to)) {
                alert('Please enter valid numeric ages.');
                return false; // Prevent form submission on non-numeric input
            }

            // Check if the ages are within the allowed range and 'Age From' is less than or equal to 'Age To'
            if ((from < 18 || from > 60 || to < 18 || to > 60) || (from > to)) {
                alert('Please ensure that both ages are between 18 and 60, and that Age From is less than or equal to Age To.');
                return false; // Prevent form submission if the conditions are not met
            }

            return true; // Allow form submission if all checks are passed
        }

    </script>

    <script>
        function showOtherInput() {
            console.log("Dropdown changed"); // Check if function is called
            var select = document.getElementById('caste');
            var otherInput = document.getElementById('other_caste');
            if (select.value === "Other") { // Ensure the comparison is correct
                otherInput.style.display = 'block';
            } else {
                otherInput.style.display = 'none';
            }
        }

    </script>



</head>
<body>

<div class="container">



    <div class="main-content">
        <h1>Who are you interested in ?</h1>
        <div class="form-container">
            <form action="interestin" method="post">
             <!--   <label>Age range :</label>
                <select name="age" required>
                    <option value=""></option>

                        <% for (String age : ages) { %>
                        <option><%= age %></option>
                        <% } %>
                    </select>-->
                <label for="minAge" >Age From:</label>
                <input type="number" id="minAge" name="minAge" min="18" max="60" onsubmit="return validateAgeRange()" required>
                <span id="age-error" style="color: red;"></span>

                <label for="maxAge">To:</label>
                <input type="number" id="maxAge" name="maxAge" min="18" max="60" onsubmit="return validateAgeRange()" required>
                <span id="ageto-error" style="color: red;"></span>



                <!--  <label>Gender:</label>
                  <select name="gender">
                      <option value=""></option>
                      <option value="male">Male</option>
                      <option value="Female">Female</option>

                       Add more options as needed
                </select><br>-->

                <label> Ethnicity:</label>
                <select name="ethnicity" required>
                        <option value=""> </option>
                        <option value="Burger">Burger</option>
                        <option value="Muslim">Muslim</option>
                        <option value="Sinhalese">Sinhalese</option>
                        <option value="Tamil">Tamil</option>
                        <option value="Other">Other</option>
                    </select>


                    <label> Religion:</label>
                <select name="religion" required>
                    <option value=""> </option>
                    <option value="Atheists">Atheists</option>
                    <option value="Buddhist">Buddhist</option>
                    <option value="Catholic">Catholic</option>
                    <option value="Christian">Christian</option>
                    <option value="Hindu">Hindu</option>
                    <option value="Islam">Islam</option>
                    <option value="Other">Other</option>
                </select>
                <br>

                <label> Caste:</label>
                <select name="caste" id="caste"  onchange="showOtherInput()" required>
                    <option value=""></option>
                    <option value="Bathgama">Bathgama</option>
                    <option value="Bodhivansha">Bodhivansha</option>
                    <option value="Deva">Deva</option>
                    <option value="Durava">Durava</option>
                    <option value="Govigama">Govigama</option>
                    <option value="Hunu">Hunu</option>
                    <option value="Karava">Karava</option>
                    <option value="kumbal">Kumbal</option>
                    <option value="Navandanna">Navandanna</option>
                    <option value="Nekathi">Nekathi</option>
                    <option value="Rajaka">Rajaka</option>
                    <option value="Radala">Radala</option>
                    <option value="Salagama">Salagama</option>
                    <option value="Other">Other</option>
                </select>
                <input type="text" name="other_caste" id="other_caste" style="display:none;" placeholder="Specify your caste">



                <label> District:</label>
                <select name="province">
                    <option value=""></option>
                    <option value="Ampara">Ampara</option>
                    <option value="Anuradhapura">Anuradhapura</option>
                    <option value="Badulla">Badulla</option>
                    <option value="Batticaloa">Batticaloa</option>
                    <option value="Colombo">Colombo</option>
                    <option value="Galle">Galle</option>
                    <option value="Gampaha">Gampaha</option>
                    <option value="Hambantota">Hambantota</option>
                    <option value="Jaffna">Jaffna</option>
                    <option value="Kalutara"> Kalutara</option>
                    <option value="Kandy">Kandy</option>
                    <option value="Kegalle">Kegalle</option>
                    <option value="Kilinochchi">Kilinochchi</option>
                    <option value="Kurunegala"> Kurunegala</option>
                    <option value="Mannar">Mannar</option>
                    <option value="Matale">Matale</option>
                    <option value="Matara">Matara</option>
                    <option value="Monaragala">Monaragala</option>
                    <option value="Mullaitivu">Mullaitivu</option>
                    <option value="Nuwara Eliya"> Nuwara Eliya</option>
                    <option value="Polonnaruwa">Polonnaruwa</option>
                    <option value="Puttalam">Puttalam</option>
                    <option value="Ratnapura"> Ratnapura</option>
                    <option value="Trincomalee">Trincomalee</option>
                    <option value="Vavuniya">Vavuniya</option>
                </select><br>



                <div class="completion-bar">
                    <div class="completion-fill" style="width: 71%;"></div> <!-- Adjust the width based on completion -->
                </div>
                <p class="completion-text">3 out of 7 steps left to complete your profile</p>

                <!-- Proceed button -->
                <button type="submit" name="action" value="proceed" class="form-container button">Save & Next</button>

                <!-- Save Progress button -->
                <!-- Link styled as a button to directly navigate to 'u_myprofile.jsp' -->
                <a href="u_myprofile.jsp" class="form-container button">Back to Profile</a>

            </form>

        </div>



        </form>
    </div>
</div>
</div>

</div>

</body>
</html>
