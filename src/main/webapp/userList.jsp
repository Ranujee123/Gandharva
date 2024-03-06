<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/6/2024
  Time: 5:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Admin Dashboard</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <style>/* Style the table */
  .container{
    /*margin-top: 50px;*/
    width: 100%;
    border-collapse: collapse;
    display: flex;
    justify-content: center;
  }
  table {
    margin-top: 20px;
    width: 90%;

  }

  /* Style the table header */
  table th {
    background-color: #ededed;
    color: black;
    padding: 15px;
    text-align: left;
    border: none;
  }

  /* Style the table cells */
  table td {
    border: none;
    border-bottom: 1px solid #f2f2f2;

    padding: 8px;
    padding-top: 10px;
    text-align: left;
  }
  table td button {
    background-color: #4CAF50;
    color: white;
    padding: 10px 10px;
    margin:  0px 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }
  table tr {
    transition: 0.5s;
    /*padding-top: 5px;*/
  }

  /* Change the background color on mouse-over */
  table tr:hover {background-color: rgba(240, 239, 239, 0.44);}

  .content{
    display: flex;
    flex-direction: column;
    /* justify-content: center; */
    /* align-content: center; */
    align-items: center;
  }
  .content h2{
    margin-top: 50px;
    font-size: 30px;
    margin-bottom: 10px;
    text-align: left;
    width: 90%;
  }

  .profimage{
    width: 50px;
    border-radius: 50%;

  }
  .flex-box-user{
    display: flex;
    align-items: center;
    gap: 15px;
    /*justify-content: center;*/
  }
  .ic-pro{
    background: linear-gradient(to right, #6801cd, #0093e0);
    color: white;
    text-align: center;
    font-weight: bold;
    padding: 2px 3px;
    width: 70px;
    border-radius: 20px;
  }
  .ic-free{
    border: #0078b7 1px solid;
    color: #0078b7;
    text-align: center;
    font-weight: bold;
    padding: 2px 0px;
    width: 70px;
    border-radius: 20px;
  }
  </style>
</head>
<body>

<%@ include file="sidebar_admin.jsp" %>

<div class="content">
  <h2>Users</h2>

  <div class="container">
    <table>
      <tr>
        <th>Username</th>
        <th></th>
        <th>Name</th>
        <th>Email</th>
        <th>User Type</th>
        <th>Country</th>
      </tr>
      <tr>
        <td><div class="flex-box-user">
          <img src="images/no-profile.png" class="profimage">
          <p>user1</p>
        </div></td>
        <td><p class="ic-free">Free</p> </td>
        <td>John Doe</td>
        <td>john.doe@example.com</td>
        <td>Admin</td>
        <td>USA</td>


      </tr>
      <tr>
        <td><div class="flex-box-user">
          <img src="images/no-profile.png" class="profimage">
          <p>user1</p>
        </div></td>
        <td><p class="ic-pro">Pro</p> </td>
        <td>Jane Smith</td>
        <td>jane.smith@example.com</td>
        <td>User</td>
        <td>Canada</td>

      </tr>

      <tr>
        <td><div class="flex-box-user">
          <img src="images/no-profile.png" class="profimage">
          <p>user1</p>
        </div></td>
        <td><p class="ic-pro">Pro</p> </td>
        <td>Michael Johnson</td>
        <td>michael.johnson@example.com</td>
        <td>User</td>
        <td>UK</td>

      </tr>
      <tr>
        <td><div class="flex-box-user">
          <img src="images/no-profile.png" class="profimage">
          <p>user1</p>
        </div></td>
        <td><p class="ic-pro">Pro</p> </td>
        <td>John Doe</td>
        <td>john.doe@example.com</td>
        <td>User</td>
        <td>USA</td>

      </tr>
      <tr>
        <td><div class="flex-box-user">
          <img src="images/no-profile.png" class="profimage">
          <p>user1</p>
        </div></td>
        <td><p class="ic-free">Free</p> </td>
        <td>Jane Smith</td>
        <td>jane.smith@example.com</td>
        <td>Astrologer</td>
        <td>Canada</td>

      </tr>

      <tr>
        <td><div class="flex-box-user">
          <img src="images/no-profile.png" class="profimage">
          <p>user1</p>
        </div></td>
        <td><p class="ic-free">Free</p> </td>
        <td>Michael Johnson</td>
        <td>michael.johnson@example.com</td>
        <td>Astrologer</td>
        <td>UK</td>

      </tr>
    </table>
  </div>





</div>


</body>
</html>
