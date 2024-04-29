<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-09-26
  Time: 00:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subscription Packages</title>
<style>
body {
	background-image: url('images/background.jpg');
	/* Replace with your background image URL */
	background-size: cover;
	background-repeat: no-repeat;
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.card {
	width: 300px;
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	transition: transform 0.2s;
	margin: 0 20px;
	text-align: center;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
	height: 400px; /* Adjust the card height as needed */
}

.card:hover {
	transform: scale(1.05);
}

.subscribe-button {
	background-color: #007bff;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.subscribe-button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div class="card">
		<h2>Free Guest User</h2>
		<p>Features:</p>
		<ul>
			<li>Feature 1</li>
			<li>Feature 2</li>
			<li>Feature 3</li>
		</ul>
		<p>Price: $0 per month</p>

		<a href="guest_register.jsp">
			<button class="subscribe-button">Subscribe</button>
		</a>

	</div>
	<div class="card">
		<h2>Standard User</h2>
		<p>Features:</p>
		<ul>
			<li>Feature 1</li>
			<li>Feature 2</li>
			<li>Feature 3</li>
		</ul>
		<p>Price: $X per month</p>

		<a href="UserPayement.jsp">
			<button class="subscribe-button">Subscribe</button>
		</a>

	</div>
	<div class="card">
		<h2>Premium User</h2>
		<p>Features:</p>
		<ul>
			<li>Feature A</li>
			<li>Feature B</li>
			<li>Feature C</li>
		</ul>
		<p>Price: $Y per month</p>
		<a href="premiumUserPayment.jsp">
			<button class="subscribe-button">Subscribe</button>
		</a>

	</div>
</body>
</html>
