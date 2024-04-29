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
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>
<script type="text/javascript" src="https://www.payhere.lk/lib/payhere.js"></script>

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
			<div class="errorMsg" id="errorMsg">
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
		<form action="SendHoroscope?id=${requestId}" method="post" enctype="multipart/form-data" id="save">
			<label for="horoscope">Horoscope Image:</label> 
			<input type="file" id="horoscope" name="horoscope" accept="image/*" required> 
			<br>
			<br> 
			
			<label for="horoscopeSecond">Second Horoscope Image:</label> 
			<input type="file" id="horoscopeSecond" name="horoscopeSecond" accept="image/*" required>
			<br>
			<br> 
			
			<button type="button" id="payhere-payment" class="button">Submit Request</button>
			<!-- <input type="submit" value="Submit Request" class="button"> -->
		
		</form>
	</div>
</body>

<script>
	let merchant_id = "121XXXX";	// Replace your Merchant ID
	let order_id = "ItemNo12345";
	let amount = 1000;
	let currency = "LKR";
	let merchant_secret = "45D3CBA93E9F2189BD630ADFE19AA6DC";	// Replace your Merchant Secret

	let hash = CryptoJS.MD5(
		merchant_id +
		order_id +
		amount.toFixed(2) +
		currency +
		CryptoJS.MD5(merchant_secret).toString().toUpperCase()
	).toString().toUpperCase();

    // Payment completed. It can be a successful failure.
    payhere.onCompleted = function onCompleted(orderId) {
        console.log("Payment completed. OrderID:" + orderId);
        // Note: validate the payment and show success or failure page to the customer

		// submit the form
		document.getElementById("save").submit();
    };

    // Payment window closed
    payhere.onDismissed = function onDismissed() {
        // Note: Prompt user to pay again or show an error page
        console.log("Payment dismissed");
    };

    // Error occurred
    payhere.onError = function onError(error) {
        // Note: show an error page
        console.log("Error:"  + error);
    };

    // Put the payment variables here
    var payment = {
        "sandbox": true,
        "merchant_id": merchant_id,
        "return_url": "http://localhost:8080/Gandharva_main/AcceptedRequests",
        "cancel_url": "http://localhost:8080/Gandharva_main/AcceptedRequests",
        "notify_url": "http://sample.com/notify",
        "order_id": "ItemNo12345",
        "items": "Door bell wireles",
        "amount": "1000.00",
        "currency": "LKR",
        "hash": hash,
        "first_name": "Saman",
        "last_name": "Perera",
        "email": "samanp@gmail.com",
        "phone": "0771234567",
        "address": "No.1, Galle Road",
        "city": "Colombo",
        "country": "Sri Lanka",
        "delivery_address": "No. 46, Galle road, Kalutara South",
        "delivery_city": "Kalutara",
        "delivery_country": "Sri Lanka",
        "custom_1": "",
        "custom_2": ""
    };

    // Show the payhere.js popup, when "PayHere Pay" is clicked
    document.getElementById('payhere-payment').onclick = function (e) {
    	// check if the form is valid
		if (!document.getElementById("save").checkValidity()) {
			document.getElementById("save").reportValidity();
			return;
		}
        payhere.startPayment(payment);
    };
</script>

</html>