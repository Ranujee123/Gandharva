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
<body>
<jsp:include page="NavBarBack.jsp"/>
<div class="content">
    <form action="#" method="POST">
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
                <option value="">Select Partner</option>
                <option value="food">Food and Beverage</option>
                <option value="table">Tables and Chairs</option>
                <option value="dj">Local DJ</option>
            </select>
        </div>
        <div class="form-group">
            <label>Food/Beverage Partner:</label>
            <select name="foodPartner" id="foodPartner">
                <option value="">Select Partner</option>
                <option value="food">Food and Beverage</option>
                <option value="table">Tables and Chairs</option>
                <option value="dj">Local DJ</option>
            </select>
        </div>
        <div class="form-group">
            <label>Decorations:</label>
            <div>
                <input type="radio" name="decoRadio" id="decoYes" value="yes" checked>
                <label for="decoYes">Yes</label>
                <input type="radio" name="decoRadio" id="decoNo" value="no">
                <label for="decoNo">No</label>
            </div>
            <select name="decoPartner" id="decoPartner">
                <option value="">Select Partner</option>
                <option value="food">Food and Beverage</option>
                <option value="table">Tables and Chairs</option>
                <option value="dj">Local DJ</option>
            </select>
        </div>
        <div class="form-group">
            <label>Audio Facilities/Local DJ:</label>
            <div>
                <input type="radio" name="djRadio" id="djYes" value="yes" checked>
                <label for="djYes">Yes</label>
                <input type="radio" name="djRadio" id="djNo" value="no">
                <label for="djNo">No</label>
            </div>
            <select name="djPartner" id="djPartner">
                <option value="">Select Partner</option>
                <option value="food">Food and Beverage</option>
                <option value="table">Tables and Chairs</option>
                <option value="dj">Local DJ</option>
            </select>
        </div>
        <div class="form-group">
            <label for="budget">Budget Range:</label>
            <input required type="number" name="budget" id="budget">
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
            if (element.value === "yes") {
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

