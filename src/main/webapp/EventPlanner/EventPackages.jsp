<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/25/2024
  Time: 11:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Event Package</title>
</head>
<style>
    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        color: #fff;
    }

    body {
        background-color: #ffffff;
        min-height: 100vh;
    }

    .content {
        display: flex;
        flex-direction: row;
        width: 100%;
        background-color: #ffffff;
    }

    .right-content {
        width: 80%;
        min-height: 100vh;
        background-color: #fff;
        display: flex;
        flex-direction: column;
        padding: 10px;
    }

    .package {
        background: #273B4A;
        padding: 16px;
        border-radius: 10px;
    }

    .package p {
        margin: 15px 0;
    }

    .packages {
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        flex-wrap: wrap;
        align-items: baseline;
    }

    .add-btn {
        float: left;
        margin: 12px 0 20px 0;
        padding: 10px 20px;
        background-color: #24333E;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        width: 20%;
    }
</style>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        fetch('${pageContext.request.contextPath}/EventPlanner/eventPackage')
            .then(response => response.json())
            .then(data => {
                populatePackages(data);
            })
            .catch(error => console.error('Error fetching package data:', error));
    });

    function populatePackages(packagesData) {
        var packagesContainer = document.querySelector('.packages');
        // Clear existing packages
        packagesContainer.innerHTML = '';

        packagesData.forEach(function (package) {
            var packageDiv = document.createElement('div');
            packageDiv.classList.add('package');

            var packageNo = document.createElement('h2');
            packageNo.textContent = 'Package No: ' + package.packageNo;
            packageDiv.appendChild(packageNo);

            var details = [
                {label: 'Number of Guests:', value: package.numberOfGuests},
                {label: 'Food:', value: package.foodFor},
                {label: 'Beverages:', value: package.beveragesFor},
                {label: 'Tables/Chairs:', value: package.tablesChairs},
                {label: 'Audio Facilities:', value: package.audioFacilities},
                {label: 'Decorations:', value: package.decorations},
                {label: 'Food/Beverages Partner:', value: package.foodPartner},
                {label: 'Table/Chair Partner:', value: package.tablesPartner},
                {label: 'Decorations Partner:', value: package.decoPartner === '' ? '-' : package.decoPartner},
                {label: 'Audio/DJ Partner:', value: package.audioPartner === '' ? '-' : package.audioPartner},
                {label: 'Budget Range:', value: package.budgetRange}
            ];

            details.forEach(function (detail) {
                var p = document.createElement('p');
                p.innerHTML = '<strong>' + detail.label + '</strong> ' + detail.value;
                packageDiv.appendChild(p);
            });

            packagesContainer.appendChild(packageDiv);
        })
    }
</script>
<body>
<div>
    <jsp:include page="NavBarBack.jsp"/>
    <div class="content">
        <jsp:include page="EventSideMenu.jsp"/>
        <div class="right-content">
            <a href="AddEventPackage.jsp">
                <button class="add-btn">Add New Package</button>
            </a>
            <div class="packages">
                <div class="package">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
