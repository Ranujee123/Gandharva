<%@ page import="com.user.model.User" %>
<%@ page import="com.user.model.UserDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String userEmail = (String) session.getAttribute("userEmail");
User user = null;

if (userEmail != null) {
	List<User> userDetails = UserDBUtil.getUserDetails(userEmail);
	if (userDetails != null && !userDetails.isEmpty()) {
		user = userDetails.get(0);
		session.setAttribute("user", user);
	}
} else {
	response.sendRedirect("login.jsp");
	return;
}
String profileImagePath = UserDBUtil.getProfileImagePath(userEmail); // Fetch image path (default or user's)
%>

<%
    String base64Image = null;
    String firstName = "Not";
    String lastName = "Applicable";
    if (session.getAttribute("id") == null) {
        response.sendRedirect("login");
    } else {
        //  String userEmail = (String) session.getAttribute("userEmail");
//        AllUser astrologer = (AllUser) session.getAttribute("astrologer");
        byte[] blobData = user.getDpphoto();

        base64Image = Base64.getEncoder().encodeToString(blobData);
        //  firstName = astrologer.getFirstName();
        //   lastName = astrologer.getLastName();
    }
%>

<!DOCTYPE html>
<html>

<head>
<title>User profile</title>
<link rel="stylesheet" type="text/css" href="u_myprofile.css">
<style>
.profile-image{
    width: 100px;  /* or any other dimensions */
    height: 100px; /* height must be equal to the width for a perfect circle */
    border-radius: 50%; /* this makes the image round */
    object-fit: cover;
}
</style>

<script src="js/nic-utils.js"></script>
<script>
        document.addEventListener('DOMContentLoaded', function() {
            fetch('fetchRequestStatusCount')  // Ensure the URL matches the servlet mapping
                .then(response => response.json())
                .then(data => {
                    document.getElementById('newRequestsCount').textContent = data[0];
                    document.getElementById('pendingRequestsCount').textContent = data[1];
                    document.getElementById('acceptedRequestsCount').textContent = data[2];
                })
                .catch(error => console.error('Error fetching data:', error));
        });
    </script>
</head>

<body style="margin: 0;">




<div class="main-content">
    <form action="UpdateUserServlet" method="post">
        <div class="profile-details">
            <% if (user != null) { %>

<%--            <img src="<%= profileImagePath %>" alt="Profile Image" class="profile-image-editable">--%>
            <img src="data:image/png;base64, <%= base64Image != null ? base64Image : "" %>" alt="User Image" class="profile-image">

<div class="profile-info">
            <p>Name: <span><%= user.getfirstName() %></span> <span><%= user.getlastName() %></span></p>

					<p>
						Email:
						<%=user.getEmail()%></p>

         <p> Province:  <%= user.getProvince() != null ? user.getProvince() : "Not specified" %></p>
    <p>Verification Status:
        <% if (user.getIsVerified() == 1) { %>
        <i class="fas fa-check-circle" style="color: green;"></i> Verified
        <% } else if (user.getIsVerified() == 0) { %>
        <i class="fas fa-exclamation-circle" style="color: orange;"></i> Pending Verification
        <% } else { %>
        <i class="fas fa-times-circle" style="color: red;"></i> Not Verified
        <% } %>
    </p>

    <!-- Displaying the Verification Status -->

            <!-- Add other fields as needed -->
            <% } %>
        </div>

        </div>

			<div class="cards-container">
				<div class="card">
					<div class="card-text">New Connections</div>
					<span id="newRequestsCount">0</span>
				</div>
				<div class="card">
					<div class="card-text">Pending Requests</div>
					<span id="pendingRequestsCount">0</span>

            </div>
            <div class="card">
                <div class="card-text">
                    Total Connected Profiles
                </div>
                <span id="acceptedRequestsCount">0</span>

				</div>
			</div>

			<%
			if (!user.getUserType().equals("GUEST_USER")) {
				Integer completedSteps = (Integer) session.getAttribute("completedSteps");
				Integer totalSteps = 7;
				if (completedSteps != null && completedSteps >= totalSteps) {
					// Profile is fully completed, don't display completion bar or Add Profile Details button
			%>
			<p class="completion-text">Your profile is fully completed.</p>
			<%
			} else {
			if (completedSteps == null) {
				completedSteps = 0;
			}
			int stepsLeft = totalSteps - completedSteps;
			%>
			<div class="completion-bar">
				<div class="completion-fill"
					style="width: <%=((double) completedSteps / totalSteps) * 100%>%;"></div>
			</div>
			<p class="completion-text">
				You have
				<%=stepsLeft%>
				steps left to complete your profile.
			</p>
			<div class="button">
				<a href="ProfileCompletionServlet">Add Profile Details</a>
			</div>
			<%
			}
			}
			%>

			<div class="button">
				<div class="dashboard-options">
					<ul>
						<li><a href="editProfile.jsp">Update my data</a></li>
						<li><a href="cpassword.jsp">Change Password</a></li>
						<li><a href="pricing.jsp">Change Plan</a></li>
						<li><a href="deleteuserprofile.jsp">Deactivate Account</a></li>
					</ul>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
