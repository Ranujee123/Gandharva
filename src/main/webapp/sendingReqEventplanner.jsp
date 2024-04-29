<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="Final_Sidebar.jsp" />

<!DOCTYPE html>
<html>

<head>
	<title>Send Request</title>
	<script src="js/Status.js"></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
	<link rel="stylesheet" href="styles/modal.css">
	<link rel="stylesheet" href="styles/main.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<style>
		.container {
			display: flex;
			flex-direction: row;
			margin-left: 50px;
			margin-top: 50px;
			padding-bottom: 50px;
			gap: 20px;
		}

		.left-container {
			width: 30%;
		}

		.right-container {
			max-width: 800px;
		}

		.image-container {
			padding: 20px;
			text-align: center;
		}

		.contact-details {
			background-color: #D9D9D9;
			border-radius: 10px;
			padding: 20px;
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

		.profile-image {
			border-radius: 50%;
			width: 100px;
			height: 100px;
			margin-right: 20px;
		}

		.plans {
			display: flex;
			gap: 10px;
			overflow-x: scroll;
		}

		.plan-container {
			color: white;
			background-color: #273B4A;
			border-radius: 10px;
			padding: 30px;
			flex-wrap: wrap;
			min-width: 200px;
		}

		.plan-name {
			text-align: center;
		}

		.select-btn {
			text-align: center;
			align-self: center;
			color: white;
			background-color: #273B4A;
			border: 1px solid white;
			border-radius: 10px;
			padding: 10px;
			margin-top: 20px;
		}
		
		input {
			width: 200px;
			padding: 8px 20px;
			margin: 8px 0;
			display: inline-block;
			border: 1px solid #ccc;
			box-sizing: border-box;
			border-radius: 10px;
		}

		label {
			font-weight: bold;
		}

		select {
			width: 200px;
			padding: 8px 20px;
			margin: 8px 0;
			display: inline-block;
			border: 1px solid #ccc;
			box-sizing: border-box;
			border-radius: 10px;
		}
		
		.submit-btn {
			padding: 10px 15px;
			border-radius: 5px;
			cursor: pointer;
			color: white;
			font-weight: bold;
			text-transform: uppercase;
			border: none;
			background-color: #273B4A;
		}
		
		.form {
			/* width: 60%; */
			display: flex;
			flex-direction: column;
		}
		
		.form-item {
			display: flex;
			justify-content: space-between;
			align-items: center;
		}				
	</style>
</head>

<body>
	<div class="container">
		<div class="topic left-container">
			<div class="image-container">
				<img alt="User Image" src="${userImage}" class="profile-image" />
				<h2>${userData.firstName} ${userData.lastName}</h2>
			</div>

			<div class="contact-details">
				<p>About me</p><br />
				<div>Contact Details</div>
				<p>Email: ${userData.email}</p>
				<p>Contact: ${userData.phonenumber}</p>
				<br>
			</div>
		</div>
		<div class="right-container">
			<%
			if (request.getAttribute("errorMessage") != null) {
			%>
			<div class="errorMsg"><%=request.getAttribute("errorMessage").toString()%></div>
			<%
			}
			%>
			<%
			if (request.getAttribute("successMessage") != null) {
			%>
			<div class="successMsg"><%=request.getAttribute("successMessage").toString()%></div>
			<%
			}
			%>
			<div class="plans">

				<c:forEach var="p" items="${packages}">
					<div class="plan-container">
						<div class="plan-name">Plan ${p.packageNo}</div>
						<div class="plan-description">
							<ul>
								<li>Number of guests: ${p.numberOfGuests}</li>
								<li>Food for: ${p.foodFor}</li>
								<li>Beverages for: ${p.beveragesFor}</li>
								<li>Tables & Chairs: ${p.tablesChairs}</li>
								<li>Audio facilities: ${p.audioFacilities}</li>
								<li>Decorations: ${p.decorations}</li>
								<li>Local DJ: ${p.localDJ}</li>
								<li>Budget range: ${p.budgetRange}</li>
							</ul>

							<button type="button" class="select-btn" onclick="selectPlan(
							'${p.numberOfGuests}',
							'${p.foodFor}',
							'${p.beveragesFor}',
							'${p.tablesChairs}',
							'${p.audioFacilities}',
							'${p.decorations}',
							'${p.localDJ}',
							'${p.budgetRange}'
							)">
								Select Package</button>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<br/>
			<button type="button" id="costomizePlanBtn" class="button" onclick="showForm()">Customize Package</button>

			<br />
			<div id="reqForm" class="modal">
				<div class="modal-content">
					<span class="close">&times;</span>
					<form action="SendEventReq?id=${userData.userID}" method="post" class="form">
						<h3>Customize package</h3>
						<div class="form-item">
						<label for="numberOfGuests">Number of guests: </label>
						<input type="text" id="numberOfGuests" name="numberOfGuests" required />
						</div>
						
						<div class="form-item">
						<label for="foodFor">Food for: </label>
						<input type="text" id="foodFor" name="foodFor" required />
						</div>
						
						<div class="form-item">
						<label for="beveragesFor">Beverages for: </label>
						<input type="text" id="beveragesFor" name="beveragesFor" required />
						</div>
						
						<div class="form-item">
						<label for="foodBevSupplier">Food & Beverage Supplier</label>
						<select name="foodBevSupplier" id="foodBevSupplier">
						<option value="Not Applicable">Not Applicable</option>
						<option value="Perera and Sons">Perera and Sons</option>
						<option value="Fab">Fab</option>
						<option value="Dons">Dons</option>
						</select>
						</div>
						
						<div class="form-item">
						<label for="tablesChairs">Tables & Chairs: </label>
						<select name="tablesChairs" id="tablesChairs" onchange="changeTableChairs()">
						<option value="Yes">Yes</option>
						<option value="No">No</option>
						</select>
						</div>
						
						<div class="form-item">
						<label for="tablesChairsSupplier">Tables & Chairs Supplier</label>
						<select name="tablesChairsSupplier" id="tablesChairsSupplier">
						<option value="Not Applicable">Not Applicable</option>
						<option value="pns">Gamage events</option>
						<option value="fab">Hewage events</option>
						</select>
						</div>
						
						<div class="form-item">
						<label for="audioFacilities">Audio facilities: </label>
						<select name="audioFacilities" id="audioFacilities" onchange="changeAudioFacilities()">
						<option value="Yes">Yes</option>
						<option value="No">No</option>
						</select>
						</div>
						
						<div class="form-item">
						<label for="localDJ">Local DJ: </label>
						<select name="localDJ" id="localDJ" onchange="changeAudioFacilities()">
						<option value="Yes">Yes</option>
						<option value="No">No</option>
						</select>
						</div>
						
						<div class="form-item">
						<label for="audioSupplier">Audio Supplier</label>
						<select name="audioSupplier" id="audioSupplier">
						<option value="Not Applicable">Not Applicable</option>
						<option value="DJ koli">DJ koli</option>
						<option value="DJ mass">DJ mass</option>
						</select>
						</div>
						
						<div class="form-item">
						<label for="decorations">Decorations: </label>
						<select name="decorations" id="decorations" onchange="changeDecorations()">
						<option value="Yes">Yes</option>
						<option value="No">No</option>
						</select>
						</div>
						
						<div class="form-item">
						<label for="decorationsSupplier">Decorations Supplier</label>
						<select name="decorationsSupplier" id="decorationsSupplier">
						<option value="Not Applicable">Not Applicable</option>
						<option value="Lassana flora">Lassana flora</option>
						<option value="Ceylon flora">Ceylon flora</option>
						</select>
						</div>
						<br />
						<button type="submit" class="submit-btn">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	// hide reqForm
	document.getElementById('reqForm').style.display = 'none';

	// function to show form
	function showForm() {
		document.getElementById('reqForm').style.display = 'block';
		document.getElementById('costomizePlanBtn').style.display = 'none';
	}
	
	// function to close form
	document.getElementsByClassName('close')[0].onclick = function() {
		document.getElementById('reqForm').style.display = 'none';
		document.getElementById('costomizePlanBtn').style.display = 'block';
	}

	function changeTableChairs() {
		const tablesChairs = document.getElementById('tablesChairs').value;
		const tablesChairsSupplier = document.getElementById('tablesChairsSupplier');

		// disable supplier if tablesChairs is No
		if(tablesChairs === 'No') {
			// set supplier to Not Applicable
			tablesChairsSupplier.value = 'Not Applicable';
			tablesChairsSupplier.disabled = true;
		} else {
			tablesChairsSupplier.disabled = false;
		}
	}

	function changeAudioFacilities() {
		const audioFacilities = document.getElementById('audioFacilities').value;
		const localDJ = document.getElementById('localDJ').value;
		const audioSupplier = document.getElementById('audioSupplier');

		// disable audio supplier if audioFacilities and localDJ are No
		if(audioFacilities === 'No' && localDJ === 'No') {
			// set supplier to Not Applicable
			audioSupplier.value = 'Not Applicable';
			audioSupplier.disabled = true;
		} else {
			audioSupplier.disabled = false;
		}
	}

	function changeDecorations() {
		const decorations = document.getElementById('decorations').value;
		const decorationsSupplier = document.getElementById('decorationsSupplier');

		// disable supplier if decorations is No
		if(decorations === 'No') {
			// set supplier to Not Applicable
			decorationsSupplier.value = 'Not Applicable';
			decorationsSupplier.disabled = true;
		} else {
			decorationsSupplier.disabled = false;
		}
	}
	
	// select plan
	function selectPlan(numberOfGuests, foodFor, beveragesFor, tablesChairs, audioFacilities, decorations, localDJ, budgetRange) {
		// show reqForm
		showForm();

		// get int value of tableChairs
		const tablesChairsInt = parseInt(tablesChairs);
		if(tablesChairsInt > 0) {
			tablesChairs = "Yes";
		} else {
			tablesChairs = "No";
		}
		
		document.getElementById('numberOfGuests').value = numberOfGuests;
		document.getElementById('foodFor').value = foodFor;
		document.getElementById('beveragesFor').value = beveragesFor;
		document.getElementById('tablesChairs').value = tablesChairs;
		document.getElementById('audioFacilities').value = audioFacilities;
		document.getElementById('decorations').value = decorations;
		document.getElementById('localDJ').value = localDJ;

		changeTableChairs();
		changeAudioFacilities();
		changeDecorations();
	}
</script>

</html>