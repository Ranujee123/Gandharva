<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserDBUtil" %><%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-02-17
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="Final_Sidebar.jsp"/>


<%

    List<String> province = UserDBUtil.getAllProvince();
    List<String> occupations = UserDBUtil.getAllOccupations();
    List<String> qualifications = UserDBUtil.getAllQualifications();
    List<String> ages= UserDBUtil.getAge();
%>

<%
String userType = (String) session.getAttribute("userEmail");
%>

<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="u_dashboard.css">
    <link rel="stylesheet" href="styles/main.css">
    <script>
        function validateAgeRange() {
            var ageFrom = document.getElementById('age').value;
            var ageTo = document.getElementById('ageto').value;
            if (parseInt(ageFrom) > parseInt(ageTo)) {
                alert('Age From should be less than or equal to Age To.');
                return false;
            }
            return true;
        }
    </script>

    <script>
        function validateAgeRange() {
            var ageFrom = document.getElementById('minAge').value;
            var ageTo = document.getElementById('maxAge').value;

            // Convert input values to integers
            var from = parseInt(ageFrom);
            var to = parseInt(ageTo);


            // Check if the ages are within the allowed range and 'Age From' is less than or equal to 'Age To'
            if (from < 18 || to < 18 || from > to) {
                alert('Please ensure that both ages are greater than 18, and that Age From is less than or equal to Age To.');
                return false; // Prevent form submission if the conditions are not met
            }

            return true; // Allow form submission if all checks are passed
        }
    </script>



    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Select all elements that contain last names
            const lastNameElements = document.querySelectorAll('.lastName');

            lastNameElements.forEach(function(element) {
                // Get the full last name from data-lastName attribute
                const lastName = element.getAttribute('data-lastName');
                if (lastName && lastName.length > 0) {
                    // Extract the first letter and convert to uppercase
                    const firstLetter = lastName[0].toUpperCase();
                    // Update the text of the span to only show the capitalized first letter
                    element.textContent = firstLetter + '.';
                }
            });
        });
    </script>


</head>
<body>
<div class="main-container">
    <!-- Sidebar Navigation -->

    <!-- Main Content Section -->
    <div class="main-content">
        <!-- Filter Section -->
        <div class="filter-section">

            <div class="filter-section">
                <form action="Filter" method="post"> <!-- Replace 'your_servlet_url' with the URL to your servlet handling the filter logic -->

                    <label for="minAge" >Age From:</label>
                    <input type="number" id="minAge" name="minAge" min="18"  onchange="validateAgeRange()" required>
                    <span id="age-error" style="color: red;"></span>

                    <label for="maxAge">To:</label>
                    <input type="number" id="maxAge" name="maxAge" min="18"  onchange="validateAgeRange()" required>
                    <span id="ageto-error" style="color: red;"></span>



                    <label>District<span ></span>:</label>
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
                    </select>



                    <label>Ethnicity:</label>
                    <select name="ethnicity" >
                        <option value=""> </option>
                        <option value="Burger">Burger</option>
                        <option value="Muslim">Muslim</option>
                        <option value="Sinhalese">Sinhalese</option>
                        <option value="Tamil">Tamil</option>
                        <option value="Other">Other</option>
                    </select>

                    <label>Religion:</label>
                    <select name="religion" >
                        <option value=""> </option>
                        <option value="Atheists">Atheists</option>
                        <option value="Buddhist">Buddhist</option>
                        <option value="Catholic">Catholic</option>
                        <option value="Christian">Christian</option>
                        <option value="Hindu">Hindu</option>
                        <option value="Islam">Islam</option>
                        <option value="Other">Other</option>
                    </select>

                    <label>Caste:</label>
                    <select name="caste">
                        <option value="">Select Caste</option>
                        <option value="Bathgama">Bathgama</option>
                        <option value="Bodhivansha">Bodhivansha</option>
                        <option value="Deva">Deva</option>
                        <option value="Durava">Durava</option>
                        <option value="Govigama">Govigama</option>
                        <option value="Hunu">Hunu</option>
                        <option value="Karava">Karava</option>
                        <option value="Kumbal">Kumbal</option>
                        <option value="Navandanna">Navandanna</option>
                        <option value="Nekathi">Nekathi</option>
                        <option value="Rajaka">Rajaka</option>
                        <option value="Radala">Radala</option>
                        <option value="Salagama">Salagama</option>
                        <option value="Other">Other</option>
                    </select>

                    <label>Civil Status :</label>
                    <select name="status" >
                        <option value=""> </option>
                        <option value="Divorced">Divorced</option>
                        <option value="Nevermarried">Never Married</option>
                        <option value="Seperated">Separated</option>
                        <option value="Widowed">Widowed</option>
                        <option value="Other">Other</option>
                    </select>

                    <label>Height :</label>
                    <select name="height" >
                        <option value=""> </option>
                        <% for (int i = 4; i <= 7; i++) {
                            for (int j = 0; j < 12; j++) {
                                String height = i + "ft " + j + "in";
                        %>
                        <option value="<%= height %>"><%= height %></option>
                        <%
                                }
                            }
                        %>
                    </select>

                    <label>Minimum Education Qualification:</label>
                    <select name="qualification" >
                        <option value=""></option>
                        <option value="Phd or Post Doctoral">Phd or Post Doctoral </option>
                        <option value="Master's Degree or Equivalent">Master's Degree or Equivalent</option>
                        <option value="Post Graduate Diploma">Post Graduate Diploma</option>
                        <option value="Bachelor's Degree or Equivalent">Bachelor's Degree or Equivalent</option>
                        <option value="Undergraduate">Undergraduate</option>
                        <option value="Professional Qualification">Professional Qualification</option>
                        <option value="Diploma">Diploma</option>
                        <option value="Up to GCE A/L">Up to GCE A/L</option>
                        <option value="Up to GCE O/L">Up to GCE O/L</option>
                        <option value="Other">Other</option>

                    </select>


                    <label> Occupation :</label>
                    <select name="occupation">
                        <option value=""></option>
                        <option value="Accountant">Accountant </option>
                        <option value="Architect">Architect</option>
                        <option value="Banker">Banker</option>
                        <option value="Business Owner">Business Owner</option>
                        <option value="Chef">Chef</option>
                        <option value="Doctor">Doctor</option>
                        <option value="Driver">Driver</option>
                        <option value="Engineer">Engineer</option>
                        <option value="Farmer">Farmer</option>
                        <option value="Governmet Service">Governmet Service</option>
                        <option value="Graphic Designer">Graphic Designer</option>
                        <option value="Hotelier">Hotelier </option>
                        <option value="House Wife">House Wife</option>
                        <option value="IT Professional">IT Professional</option>
                        <option value="Lawyer">Lawyer </option>
                        <option value="Lecturer">Lecturer</option>
                        <option value="Manager">Manager</option>
                        <option value="Medical Professional">Medical Professional</option>
                        <option value="Military">Military</option>
                        <option value="Not Employed">Not Employed</option>
                        <option value="Nurse"> Nurse</option>
                        <option value="Police Officer">Police Officer</option>
                        <option value="Quantity Surveyor">Quantity Surveyor</option>
                        <option value="Researcher">Researcher</option>
                        <option value="Sales Executive">Sales Executive</option>
                        <option value="Self Employed">Self Employed</option>
                        <option value="Surveyor">Surveyor</option>
                        <option value="Teacher">Teacher </option>
                        <option value="Technician">Technician</option>
                        <option value="Other">Other</option>
                    </select>

                    <label>Food Preference:</label>
                    <select name="foodpreferences" >
                        <option value=""> </option>
                        <option value="Vegetarian">Vegetarian</option>
                        <option value="Non-Vegetarian">Non-Vegetarian</option>
                        <option value="Vegan">Vegan</option>
                    </select>

                    <label>Drinking:</label>
                    <select name="drinking" >
                        <option value=""> </option>
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                        <option value="Occationally">Occationally</option>
                    </select>

                    <label>Smoking :</label>
                    <select name="smoking" >
                        <option value=""> </option>
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                    </select>

                    <label>Differently Abled :</label>
                    <select name="diffabled" >
                        <option value=""> </option>
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                    </select>

                    <label>Enter your personality type:</label>
                    <select name="personalitytype" >
                        <option value=""></option>
                        <option value="ENTJ">ENTJ </option>
                        <option value="INFP">INFP</option>
                        <option value="ENFJ">ENFJ</option>
                        <option value="ESFP">ESFP</option>
                        <option value="ISFP">ISFP</option>
                        <option value="ENTP">ENTP</option>
                        <option value="INTJ">INTJ</option>
                        <option value="ENFP">ENFP</option>
                        <option value="ESTJ">ESTJ</option>
                        <option value="ISTJ">ISTJ</option>
                        <option value="INFJ">INFJ</option>
                        <option value="INTP">INTP </option>
                        <option value="ESFJ">ESFJ</option>
                        <option value="ESTP">ESTP</option>
                        <option value="ISTP">ISTP</option>
                        <option value="ISFJ">ISFJ</option>

                    </select>

                    <!-- Add more filters here up to 10 different filters as per your requirement -->

                    <!-- Add more filters here up to 10 different filters as per your requirement -->

                    <!-- if userType.equals("GUEST_USER") disable the button -->
                    ${userType.equals("GUEST_USER") ? '<button type="submit" class="filter-button" disabled>Filter</button>' : '<button type="submit" class="filter-button">Filter</button>'}

                    <button type="reset" class="clear-button">Clear</button>
                </form>
            </div>

            <!-- Display filtered users securely using c:out to prevent XSS -->
            <div class="profiles-section">

                <c:if test="${not empty filteredUsers}">
                    <c:forEach items="${filteredUsers}" var="user">
                        <div class="profile-card">


                            <h2><c:out value="${user.firstName}"/> <span class="lastName" data-lastName="<c:out value='${user.lastName}'/>"></span></h2>
                            <div class="profile-details-grid">
                                <div class="profile-detail">
                                    <p>Age: <c:out value="${user.age}"/></p>
                                </div>
                                <div class="profile-detail">
                                    <p>Province: <c:out value="${user.province}"/></p>
                                </div>
                                <div class="profile-detail">
                                    <p>Ethnicity: <c:out value="${user.ethnicity}"/></p>
                                </div>
                                <div class="profile-detail">
                                    <p>Religion: <c:out value=" ${user.religion}"/></p>
                                </div>
                                <div class="profile-detail">
                                    <p>Caste: <c:out value="${user.caste}"/></p>
                                </div>
                                <div class="profile-detail">
                                    <p>Occupation: <c:out value="${user.occupation}"/></p>
                                </div>
                            </div>

                            <input type="hidden" name="email" value="<c:out value='${user.email}'/>">
                            <div class="button-container">
                                <!--    <button class="connect-button">Connect</button>
                                    <button class="reject-button">Reject</button>-->
                                <form action="moredetails" method="post">
                                    <input type="hidden" name="email" value="${user.email}"/>
                                    <button type="submit" class="connect-button">View More</button>
                                </form>

                            </div>

                        </div>
                    </c:forEach>
                </c:if>

                <c:if test="${empty filteredUsers}">
                    <p>No users found matching your criteria.</p>
                            ${userType.equals("GUEST_USER") ? '
                            <p class="warnMsg" style="width: 100%; text-align: center; font-size: large; margin-top: 50px;">
                                You need to upgrade to use this feature.
                            </p>' : ''}
                </c:if>

            </div>
        </div>
    </div>

</body>
</html>