<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="Final_Sidebar.jsp" />

<!DOCTYPE html>
<html>

<head>
<title>Send Request</title>
<script src="js/Status.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="styles/main.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<style>
	.container {
		margin-left: 100px;
		margin-top: 50px;
	}

	.button {
		padding: 10px 15px;
		border-radius: 5px;
		cursor: pointer;
		color: white;
		font-weight: bold;
		text-transform: uppercase;
		border: none;
		background-color: #273B4A;
	}

	.topic {
		text-align: justify-all;
		/* margin-left: 300px; */
	}

	input {
		width: 100%;
		padding: 12px 20px;
		margin: 8px 0;
		display: inline-block;
		border: 1px solid #ccc;
		box-sizing: border-box;
		border-radius: 10px;
	}

	label {
		font-weight: bold;
	}

	.profile-image {
		border-radius: 50%;
		width: 100px;
		height: 100px;
		margin-right: 20px;
	}
</style>
</head>

<body>
	<div class="container">
		<% if (request.getAttribute("errorMessage") !=null) { %>
			<div class="errorMsg">
				<%=request.getAttribute("errorMessage").toString()%>
			</div>
		<% } %>
		<% if (request.getAttribute("successMessage") !=null) { %>
			<div class="successMsg">
				<%=request.getAttribute("successMessage").toString()%>
			</div>
		<% } %>
		<div class="topic">
			<img alt="User Image" src="${userImage}" class="profile-image" />
			<h2>${astrologer.firstName} ${astrologer.lastName}</h2>
			<p>${astrologer.email}</p>
			<br>
		</div>
		<form action="SendAstroReq?id=${astrologer.userID}" method="post" enctype="multipart/form-data" id="save">
			<!-- <label for="horoscope">Horoscope Image:</label> 
			<input type="file" id="horoscope" name="horoscope" accept="image/*" required> 
			<br>
			<br> 
			
			<label for="horoscopeSecond">Second Horoscope Image:</label> 
			<input type="file" id="horoscopeSecond" name="horoscopeSecond" accept="image/*" required>
			<br>
			<br>  -->
			
			<label for="horoscopeSecond">Need this before:</label> 
			<input type="date" id="deadline" name="deadline"><br>
			<br> 
			
			<input type="submit" value="Submit Request" class="button">
		
		</form>
	</div>
</body>

</html>