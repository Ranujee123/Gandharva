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
    padding-top: 20px;
    margin-top: 10px;
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
  .row{
    display: flex;
    flex-direction: column;
    justify-content: start;
    /*align-items: center;*/
    width: 100%;
  }
  .head-row{
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 10px;

  }
  .user-line{
    display: flex;
    flex-direction: row;
    gap: 15px;
    justify-content: center;
    align-items: center;
  }

  </style>
</head>
<body>

<%@ include file="sidebar_admin.jsp" %>

<div class="content">
  <h2>Handle Complaints</h2>

  <div class="container">
    <table>

      <tr>
        <td><div class="row">
          <div class="head-row">
            <div class = "user-line">
              <img src="images/no-profile.png" class="profimage">
              <h5>User1</h5>
            </div>
            <p>Published Date : 2024/03/06</p>
          </div>

          <h3>Title: Complaining about the system error</h3>
          <p>I am encountering a significant issue with the system, which seems to be malfunctioning and impeding my access. Despite my attempts, I am unable to gain entry or utilize its functionalities effectively. This obstacle is hindering my productivity and causing frustration. Urgent assistance is required to rectify this problem promptly and restore normal functionality to the system. Any guidance or troubleshooting steps provided would be greatly appreciated in resolving this issue and allowing me to resume my tasks seamlessly. Thank you for your attention to this matter</p>
          <button>Go to Resolve</button>
        </div>
  </div>
  </td>

      </tr>

      <tr>
        <td><div class="row">
          <div class="head-row">
            <div class = "user-line">
              <img src="images/no-profile.png" class="profimage">
              <h5>User2</h5>
            </div>
            <p>Published Date : 2024/03/07</p>
          </div>

          <h3>Title: Complaining about the system error</h3>
          <p>I am encountering a significant issue with the system, which seems to be malfunctioning and impeding my access. Despite my attempts, I am unable to gain entry or utilize its functionalities effectively. This obstacle is hindering my productivity and causing frustration. Urgent assistance is required to rectify this problem promptly and restore normal functionality to the system. Any guidance or troubleshooting steps provided would be greatly appreciated in resolving this issue and allowing me to resume my tasks seamlessly. Thank you for your attention to this matter</p>
          <button>Go to Resolve</button>
        </div>
  </div>
  </td>

      </tr>
    </table>






</div>


</body>
</html>
