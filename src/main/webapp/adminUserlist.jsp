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
    .container-complaints{
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
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>NIC</th>
                <th>Country</th>
                <th>Status</th>
            </tr>
            <c:forEach items="${userList}" var="user">
                <tr >

                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.email}</td>
                    <td>${user.nic}</td>
                    <td>${user.countryOfResidence}</td>

                    <c:if test="${user.stat == '1'}">
                        <td style="text-align: center">Active</td>
                        <td style="display: flex;align-items: center;justify-content: center;"><button class="btn-deactivate" onclick="UpdateStatus('Deactive','${user.id}')">Deactivate</button></td>
                    </c:if>
                    <c:if test="${user.stat == '0'}">
                        <td style="text-align: center">Deactive</td>
                        <td style="display: flex;align-items: center;justify-content: center;"><button class="btn-activate" onclick="UpdateStatus('active','${user.id}')">Activate</button></td>
                    </c:if>

                </tr>
            </c:forEach>

        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    function UpdateStatus(status, id) {

        let statusINT= 0;
        if(status == 'active'){
            statusINT = 1;
        }

        Swal.fire({
            title: 'Are you sure?',
            text: "You want to "+status+" this user!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, '+status+' it!'
        }).then((result) => {
            if (result.isConfirmed) {


        fetch('/Gandharva_main/activateuser', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'id=' + encodeURIComponent(id)+'&status='+encodeURIComponent(statusINT)
        })
            .then(function(response) {
                if (response.ok) {
                    return response.text();
                }
                throw new Error('Network response was not ok.');
            })
            .then(function(responseText) {
                console.log(responseText);
                Swal.fire(
                    'Success!',
                    'User has been '+status+'d.',
                    'success'
                ).then((result) => {

                        location.reload();

                });
            })
            .catch(function(error) {
                console.error('There was a problem with the fetch operation:', error);
            });
            }
        })
    }
</script>


</div>


</body>
</html>
