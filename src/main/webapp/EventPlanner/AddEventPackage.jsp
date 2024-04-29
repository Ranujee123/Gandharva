<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/25/2024
  Time: 11:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="addPackage.css"/>
    <title>Add New Packages</title>
</head>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        fetch('${pageContext.request.contextPath}/EventPlanner/eventPartner')
            .then(response => response.json())
            .then(data => {
                updateSelectInputs(data);
            })
            .catch(error => console.error('Error fetching partners data:', error));
    });

    function updateSelectInputs(partnersData) {
        populateSelectOptions(partnersData.deco, 'decoPartner');
        populateSelectOptions(partnersData.dj, 'djPartner');
        populateSelectOptions(partnersData.food, 'foodPartner');
        populateSelectOptions(partnersData.table, 'tablePartner');
    }

    function populateSelectOptions(partners, selectId) {
        const select = document.getElementById(selectId);
        select.innerHTML = '';

        const defaultOption = document.createElement('option');
        defaultOption.text = 'Select Partner';
        defaultOption.value = '';
        select.appendChild(defaultOption);
        partners.forEach(function(partner) {
            const option = document.createElement('option');
            option.text = partner.partnerName;
            option.value = partner.partnerName;
            select.appendChild(option);
        });
    }
</script>
<body>
<jsp:include page="NavBarBack.jsp"/>
<div class="content">
    <form action="eventPackage" method="POST">
        <div class="form-group">
            <label for="packageNo">Package No:</label>
            <input required type="number" name="packageNo" id="packageNo">
        </div>
        <div class="form-group">
            <label for="noOfGuests">Number of Guests:</label>
            <input required type="number" name="noOfGuests" id="noOfGuests">
        </div>
        <div class="form-group">
            <label>Food For:</label>
            <input required type="number" name="food" id="food">
        </div>
        <div class="form-group">
            <label>Beverage For:</label>
            <input required type="number" name="beverage" id="beverage">
        </div>
        <div class="form-group">
            <label>Tables/Chairs For:</label>
            <input required type="number" name="table" id="table">
        </div>
        <div class="form-group">
            <label>Tables/Chairs Partner:</label>
            <select name="tablePartner" id="tablePartner">
            </select>
        </div>
        <div class="form-group">
            <label>Food/Beverage Partner:</label>
            <select name="foodPartner" id="foodPartner">
            </select>
        </div>
        <div class="form-group">
            <label>Decorations:</label>
            <div>
                <input type="radio" name="decorations" id="decoYes" value="Yes" checked>
                <label for="decoYes">Yes</label>
                <input type="radio" name="decorations" id="decoNo" value="No">
                <label for="decoNo">No</label>
            </div>
            <select name="decoPartner" id="decoPartner">
            </select>
        </div>
        <div class="form-group">
            <label>Audio Facilities/Local DJ:</label>
            <div>
                <input type="radio" name="audioFacilities" id="djYes" value="Yes" checked>
                <label for="djYes">Yes</label>
                <input type="radio" name="audioFacilities" id="djNo" value="No">
                <label for="djNo">No</label>
            </div>
            <select name="audioPartner" id="djPartner">
            </select>
        </div>
        <div class="form-group">
            <label for="budget">Budget Range:</label>
            <input required type="number" name="budgetRange" id="budget">
        </div>
        <div class="form-group">
            <button type="submit">Add Package</button>
        </div>
    </form>
    <script>
        const decoYesRadio = document.getElementById("decoYes");
        const decoNoRadio = document.getElementById("decoNo");
        const decoPartnerSelect = document.getElementById("decoPartner");

        const djYesRadio = document.getElementById("djYes");
        const djNoRadio = document.getElementById("djNo");
        const djPartnerSelect = document.getElementById("djPartner");

        function showHideSelect(element, select) {
            if (element.value === "Yes") {
                select.style.display = "inline-block";
            } else {
                select.style.display = "none";
            }
        }

        decoYesRadio.addEventListener("change", function () {
            showHideSelect(this, decoPartnerSelect);
        });

        decoNoRadio.addEventListener("change", function () {
            showHideSelect(this, decoPartnerSelect);
        });

        djYesRadio.addEventListener("change", function () {
            showHideSelect(this, djPartnerSelect);
        });

        djNoRadio.addEventListener("change", function () {
            showHideSelect(this, djPartnerSelect);
        });
    </script>
</div>
</body>
</html>

