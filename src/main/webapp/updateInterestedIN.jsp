<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-28
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="logoutbutton.jsp"/>
<c:import url="Final_Sidebar.jsp"/>


<%
  List<String> ages = UserDBUtil.getAge();

%>

<%

  String userEmail = (String) session.getAttribute("userEmail");
  User user = null;

  if (userEmail != null) {
    String id=UserDBUtil.getUserIdByEmail(userEmail);
    List<User> getinterestedindetails = UserDBUtil.getInterestedInforUpdate(id);
    if (getinterestedindetails != null && !getinterestedindetails.isEmpty()) {
      user = getinterestedindetails.get(0);
    }
  }

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
      <form action="updateinterestedIN" method="post">
        <!--   <label>Age range :</label>
                <select name="age" required>
                    <option value=""></option>

                        <% for (String age : ages) { %>
                        <option><%= age %></option>
                        <% } %>
                    </select>-->
        <label for="minAge" >Age From:</label>
        <input type="number" id="minAge" name="minAge" min="18" max="60" onsubmit="return validateAgeRange()"  value="<%= user != null ? user.getMinAge() : "" %>" required>
        <span id="age-error" style="color: red;"></span>

        <label for="maxAge">To:</label>
        <input type="number" id="maxAge" name="maxAge" min="18" max="60" onsubmit="return validateAgeRange()"  value="<%= user != null ? user.getMaxAge() : "" %>" required>
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
          <option value=""></option>
          <option value="Burger" <%= "Burger".equals(user.getEthnicity()) ? "selected" : "" %>>Burger</option>
          <option value="Muslim" <%= "Muslim".equals(user.getEthnicity()) ? "selected" : "" %>>Muslim</option>
          <option value="Sinhalese" <%= "Sinhalese".equals(user.getEthnicity()) ? "selected" : "" %>>Sinhalese</option>
          <option value="Tamil" <%= "Tamil".equals(user.getEthnicity()) ? "selected" : "" %>>Tamil</option>
          <option value="Other" <%= "Other".equals(user.getEthnicity()) ? "selected" : "" %>>Other</option>
        </select>


        <label> Religion:</label>
        <select name="religion" required>
          <option value=""></option>
          <option value="Atheists" <%= "Atheists".equalsIgnoreCase(user.getReligion()) ? "selected" : "" %>>Atheists</option>
          <option value="Buddhist" <%= "Buddhist".equalsIgnoreCase(user.getReligion()) ? "selected" : "" %>>Buddhist</option>
          <option value="Catholic" <%= "Catholic".equalsIgnoreCase(user.getReligion()) ? "selected" : "" %>>Catholic</option>
          <option value="Christian" <%= "Christian".equalsIgnoreCase(user.getReligion()) ? "selected" : "" %>>Christian</option>
          <option value="Hindu" <%= "Hindu".equalsIgnoreCase(user.getReligion()) ? "selected" : "" %>>Hindu</option>
          <option value="Islam" <%= "Islam".equalsIgnoreCase(user.getReligion()) ? "selected" : "" %>>Islam</option>
          <option value="Other" <%= "Other".equalsIgnoreCase(user.getReligion()) ? "selected" : "" %>>Other</option>
        </select>

        <br>

        <label> Caste:</label>
        <select name="caste" id="caste"  onchange="showOtherInput()" required>
          <option value=""></option>
          <option value="Bathgama" <%= "Bathgama".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Bathgama</option>
          <option value="Bodhivansha" <%= "Bodhivansha".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Bodhivansha</option>
          <option value="Deva" <%= "Deva".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Deva</option>
          <option value="Durava" <%= "Durava".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Durava</option>
          <option value="Govigama" <%= "Govigama".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Govigama</option>
          <option value="Hunu" <%= "Hunu".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Hunu</option>
          <option value="Karava" <%= "Karava".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Karava</option>
          <option value="Kumbal" <%= "Kumbal".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Kumbal</option>
          <option value="Navandanna" <%= "Navandanna".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Navandanna</option>
          <option value="Nekathi" <%= "Nekathi".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Nekathi</option>
          <option value="Rajaka" <%= "Rajaka".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Rajaka</option>
          <option value="Radala" <%= "Radala".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Radala</option>
          <option value="Salagama" <%= "Salagama".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Salagama</option>
          <option value="Other" <%= "Other".equalsIgnoreCase(user.getCaste()) ? "selected" : "" %>>Other</option>
        </select>ther</option>
        <input type="text" name="other_caste" id="other_caste" style="display:none;" placeholder="Specify your caste">



        <label> District:</label>
        <select name="province">
          <option value=""></option>
          <option value="Ampara" <%= "Ampara".equals(user.getProvince()) ? "selected" : "" %>>Ampara</option>
          <option value="Anuradhapura" <%= "Anuradhapura".equals(user.getProvince()) ? "selected" : "" %>>Anuradhapura</option>
          <option value="Badulla" <%= "Badulla".equals(user.getProvince()) ? "selected" : "" %>>Badulla</option>
          <option value="Batticaloa" <%= "Batticaloa".equals(user.getProvince()) ? "selected" : "" %>>Batticaloa</option>
          <option value="Colombo" <%= "Colombo".equals(user.getProvince()) ? "selected" : "" %>>Colombo</option>
          <option value="Galle" <%= "Galle".equals(user.getProvince()) ? "selected" : "" %>>Galle</option>
          <option value="Gampaha" <%= "Gampaha".equals(user.getProvince()) ? "selected" : "" %>>Gampaha</option>
          <option value="Hambantota" <%= "Hambantota".equals(user.getProvince()) ? "selected" : "" %>>Hambantota</option>
          <option value="Jaffna" <%= "Jaffna".equals(user.getProvince()) ? "selected" : "" %>>Jaffna</option>
          <option value="Kalutara" <%= "Kalutara".equals(user.getProvince()) ? "selected" : "" %>>Kalutara</option>
          <option value="Kandy" <%= "Kandy".equals(user.getProvince()) ? "selected" : "" %>>Kandy</option>
          <option value="Kegalle" <%= "Kegalle".equals(user.getProvince()) ? "selected" : "" %>>Kegalle</option>
          <option value="Kilinochchi" <%= "Kilinochchi".equals(user.getProvince()) ? "selected" : "" %>>Kilinochchi</option>
          <option value="Kurunegala" <%= "Kurunegala".equals(user.getProvince()) ? "selected" : "" %>>Kurunegala</option>
          <option value="Mannar" <%= "Mannar".equals(user.getProvince()) ? "selected" : "" %>>Mannar</option>
          <option value="Matale" <%= "Matale".equals(user.getProvince()) ? "selected" : "" %>>Matale</option>
          <option value="Matara" <%= "Matara".equals(user.getProvince()) ? "selected" : "" %>>Matara</option>
          <option value="Monaragala" <%= "Monaragala".equals(user.getProvince()) ? "selected" : "" %>>Monaragala</option>
          <option value="Mullaitivu" <%= "Mullaitivu".equals(user.getProvince()) ? "selected" : "" %>>Mullaitivu</option>
          <option value="Nuwara Eliya" <%= "Nuwara Eliya".equals(user.getProvince()) ? "selected" : "" %>>Nuwara Eliya</option>
          <option value="Polonnaruwa" <%= "Polonnaruwa".equals(user.getProvince()) ? "selected" : "" %>>Polonnaruwa</option>
          <option value="Puttalam" <%= "Puttalam".equals(user.getProvince()) ? "selected" : "" %>>Puttalam</option>
          <option value="Ratnapura" <%= "Ratnapura".equals(user.getProvince()) ? "selected" : "" %>>Ratnapura</option>
          <option value="Trincomalee" <%= "Trincomalee".equals(user.getProvince()) ? "selected" : "" %>>Trincomalee</option>
          <option value="Vavuniya" <%= "Vavuniya".equals(user.getProvince()) ? "selected" : "" %>>Vavuniya</option>
        </select><br>




        <!-- Proceed button -->
        <button type="submit" name="action" value="proceed" class="form-container button">Save & Next</button>



      </form>

    </div>



    </form>
  </div>
</div>
</div>

</div>

</body>
</html>