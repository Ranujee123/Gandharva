<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/28/2024
  Time: 7:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reservations</title>
</head>
<style>
    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }

    body {
        background-color: #000;
        min-height: 100vh;
    }

    .content {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 30px;
    }

    .right-content {
        width: 80%;
        min-height: 100vh;
        background-color: #fff;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #f2f2f2;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f2f2f2;
    }
</style>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        fetch('${pageContext.request.contextPath}/EventPlanner/reservation')
            .then(response => response.json())
            .then(data => {
                const tableBody = document.querySelector('table tbody');

                // Iterate over the data and create table rows
                data.forEach(reservation => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${reservation.customer}</td>
                        <td>${reservation.foodFor}</td>
                        <td>${reservation.beveragesFor}</td>
                        <td>${reservation.tablesChairs}</td>
                        <td>${reservation.budgetRange}</td>
                        <td>${reservation.requestStatus}</td>
                        <td>${reservation.requestedDate}</td>
                    `;
                    tableBody.appendChild(row);
                })
                    .catch(error => console.error('Error fetching package data:', error));
            })
    })
</script>
<body>
<jsp:include page="NavBarBack.jsp"/>
<div class="content">
    <jsp:include page="EventSideMenu.jsp"/>
    <div class="right-content">
        <table>
            <thead>
            <tr>
                <th>Customer</th>
                <th>Food For</th>
                <th>Beverages For</th>
                <th>Tables/Chairs</th>
                <th>Budget Range</th>
                <th>Request Status</th>
                <th>Requested Date</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
