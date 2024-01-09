<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-12-04
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
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
      <form action="lookingfor" method="post">
          <label style="display: inline-block;">Age :</label>
          <div style="display: inline-block;">
              <select name="ageFrom">
                  <option value=""></option>
                  <% for (int i = 18; i <= 60; i++) { %>
                  <option value="<%= i %>"><%= i %></option>
                  <% } %>
              </select>
          </div>
          <span style="margin: 0 5px;">TO</span>
          <div style="display: inline-block;">
              <select name="ageTo">
                  <option value=""></option>
                  <% for (int i = 18; i <= 60; i++) { %>
                  <option value="<%= i %>"><%= i %></option>
                  <% } %>
              </select>
          </div><br>


          <label>Gender:</label>
          <select name="gender">
              <option value=""></option>
              <option value="Male">Male</option>
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

          <label>Castes:</label>
          <select name="castes">
              <option value=""></option>
              <option value="Radala">Radala</option>
              <option value="Govigama">Govigama</option>
              <option value="Bathgama">Bathgama</option>
              <option value="Deva">Deva</option>
              <option value="Nekathi">Nekathi</option>
              <option value="Bodhivansha">Bodhivansha</option>
              <option value="Rajaka">Rajaka</option>
              <option value="Kumbal">Kumbal</option>
              <option value="Hunu">Hunu</option>
              <option value="Durava">Durava</option>
              <option value="Karava">Karava</option>
              <option value="Salagama">Salagama</option>
              <option value="Navandanna">Navandanna</option>
              <option value="Christian">Christian</option>
              <option value="Muslim">Muslim</option>
              <!-- Add more options as needed -->
          </select><br>

          <label>Country of residence:</label>
          <select name="country">
              <option value=""></option>
              <option value="Afghanistan">Afghanistan</option>
              <option value="Albania">Albania</option>
              <option value="Algeria">Algeria</option>
              <option value="Andorra">Andorra</option>
              <option value="Angola">Angola</option>
              <option value="Antigua and Barbuda">Antigua and Barbuda</option>
              <option value="Argentina">Argentina</option>
              <option value="Armenia">Armenia</option>
              <option value="Australia">Australia</option>
              <option value="Austria">Austria</option>
              <option value="Austrian Empire*">Austrian Empire*</option>
              <option value="Azerbaijan">Azerbaijan</option>
              <option value="Baden*">Baden*</option>
              <option value="Bahamas, The">Bahamas, The</option>
              <option value="Bahrain">Bahrain</option>
              <option value="Bangladesh">Bangladesh</option>
              <option value="Barbados">Barbados</option>
              <option value="Bavaria*">Bavaria*</option>
              <option value="Belarus">Belarus</option>
              <option value="Belgium">Belgium</option>
              <option value="Belize">Belize</option>
              <option value="Benin (Dahomey)">Benin (Dahomey)</option>
              <option value="Bolivia">Bolivia</option>
              <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
              <option value="Botswana">Botswana</option>
              <option value="Brazil">Brazil</option>
              <option value="Brunei">Brunei</option>
              <option value="Brunswick and Lüneburg">Brunswick and Lüneburg</option>
              <option value="Bulgaria">Bulgaria</option>
              <option value="Burkina Faso (Upper Volta)">Burkina Faso (Upper Volta)</option>
              <option value="Burma">Burma</option>
              <option value="Burundi">Burundi</option>
              <option value="Cabo Verde">Cabo Verde</option>
              <option value="Cambodia">Cambodia</option>
              <option value="Cameroon">Cameroon</option>
              <option value="Canada">Canada</option>
              <option value="Cayman Islands, The">Cayman Islands, The</option>
              <option value="Central African Republic">Central African Republic
              <!-- Add more options as needed -->
          </select><br>


        <div class="completion-bar">
          <div class="completion-fill" style="width: 71%;"></div> <!-- Adjust the width based on completion -->
        </div>
        <p class="completion-text">5 out of 7 is completed</p>

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

