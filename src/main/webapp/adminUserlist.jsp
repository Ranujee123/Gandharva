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
        padding-top: 15px;
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

    </style>
</head>
<body>

<%@ include file="sidebar_admin.jsp" %>

<div class="content">
    <h2>Activate Accounts</h2>

    <div class="container">
        <table>
            <tr>
                <th>Username</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Country</th>
            </tr>
            <tr>
                <td>user1</td>
                <td>John</td>
                <td>Doe</td>
                <td>john.doe@example.com</td>
                <td>123-456-7890</td>
                <td>USA</td>
                <td><button>Activate</button></td>
            </tr>
            <tr>
                <td>user2</td>
                <td>Jane</td>
                <td>Smith</td>
                <td>jane.smith@example.com</td>
                <td>987-654-3210</td>
                <td>Canada</td>
                <td><button>Activate</button></td>
            </tr>

            <tr>
                <td>user3</td>
                <td>Michael</td>
                <td>Johnson</td>
                <td>michael.johnson@example.com</td>
                <td>456-789-0123</td>
                <td>UK</td>
                <td><button>Activate</button></td>
            </tr>
            <tr>
                <td>user1</td>
                <td>John</td>
                <td>Doe</td>
                <td>john.doe@example.com</td>
                <td>123-456-7890</td>
                <td>USA</td>
                <td><button>Activate</button></td>
            </tr>
            <tr>
                <td>user2</td>
                <td>Jane</td>
                <td>Smith</td>
                <td>jane.smith@example.com</td>
                <td>987-654-3210</td>
                <td>Canada</td>
                <td><button>Activate</button></td>
            </tr>

            <tr>
                <td>user3</td>
                <td>Michael</td>
                <td>Johnson</td>
                <td>michael.johnson@example.com</td>
                <td>456-789-0123</td>
                <td>UK</td>
                <td><button>Activate</button></td>
            </tr>
        </table>
    </div>





</div>


</body>
</html>
