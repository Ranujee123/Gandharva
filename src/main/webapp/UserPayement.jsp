<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2024-04-25
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <title>Payment Form</title>
  <style>
    .container{
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
      transition: 0.3s;
      width: 40%;
      border-radius: 5px;
      display: inline-block;
      margin: 10px;
      padding: 2px 16px;
      text-align: center;
      align-content: center;
      align-self: center;
      border-radius: 10px;
      margin-top: 7%;
      margin-left: 25%;
      margin-right: 25%;

    }
    body {
      font-family: Poppins,sans-serif;
      font-size: 17px;
      padding: 8px;
    }
    .btn {
      background-color: #04AA6D;
      color: white;
      padding: 12px;
      margin: 10px 0;
      border: none;
      width: 100%;
      border-radius: 3px;
      cursor: pointer;
      font-size: 17px;
    }

    .btn:hover {
      background-color: #45a049;
    }

  </style>
</head>
<body >
<div class="container">
<form action="userpayment" method="post">
  <h1>Payment Form</h1>
  <h3>Rs. 2000.00</h3>


  <label for="email"><i class="fa fa-envelope"></i> Email</label>
  <input type="text" id="email" name="email" placeholder="john@example.com">
  <br>
  <br>
  <label for="address"><i class="fa fa-address-card-o"></i> Address</label>
  <input type="text" id="address" name="address" placeholder="542 W. 15th Street">
  <br>
  <br>
  <label for="city"><i class="fa fa-institution"></i> City</label>
  <input type="text" id="city" name="city" placeholder="New York">
  <br>
  <br>
<hr>
  <h3>Payment</h3>
  <label >Accepted Cards</label>
  <div class="icon-container">
    <i class="fa fa-cc-visa" style="color:navy;"></i>
    <i class="fa fa-cc-amex" style="color:blue;"></i>
    <i class="fa fa-cc-mastercard" style="color:red;"></i>
    <i class="fa fa-cc-discover" style="color:orange;"></i>
  </div>
  <br>
  <br>
  <label for="cname">Name on Card</label>
  <input type="text" id="cname" name="cardname" placeholder="John More Doe">
  <br>
  <br>
  <label for="ccnum">Credit card number</label>
  <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
  <br>
  <br>
  <label for="expmonth">Exp Month</label>
  <input type="text" id="expmonth" name="expmonth" placeholder="September">
  <br>
  <br>
  <label for="expyear">Exp Year</label>
  <input type="text" id="expyear" name="expyear" placeholder="2018">
  <br>
  <br>
  <label for="cvv">CVV</label>
  <input type="text" id="cvv" name="cvv" placeholder="352">
  <br>
  <br>
  <input type="submit" value="Continue to checkout" class="btn">

</form>
</div>
</body>
</html>