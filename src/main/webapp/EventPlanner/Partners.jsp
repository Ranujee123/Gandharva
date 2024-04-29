<%@ page import="event.model.EventPartner" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/28/2024
  Time: 8:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Partners</title>
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
        flex-direction: column;
        background-color: #ffffff;
        padding: 10px;
    }

    .add-btn{
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

    .partnerBox{
        height: auto;
        width: 260px;
        background: #24333E;
        border-radius: 10px;
        padding: 16px;
    }

    .partnerBox h2 {
        margin: 4px;
    }

    .partnerBox span {
        margin: 4px;
    }

    .partnerBox ul {
       list-style: none;
    }

    .partners{
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        flex-wrap: wrap;
        align-items: baseline;
    }
</style>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        fetch('${pageContext.request.contextPath}/EventPlanner/eventPartner')
            .then(response => response.json())
            .then(data => {
                updatePartnersList(data);
            })
            .catch(error => console.error('Error fetching partners data:', error));
    });

    function updatePartnersList(partnersData) {
        var partnersContainer = document.querySelector('.partners');
        partnersContainer.innerHTML = '';

        for (var partnerType in partnersData) {
            if (partnersData.hasOwnProperty(partnerType)) {
                var partnerBox = '<div class="partnerBox">' +
                    '<h2>' + getPartnerType(partnerType) + '</h2>' +
                    '<ul>';

                partnersData[partnerType].forEach(function(partner) {
                    partnerBox += '<li><span>' + partner.partnerName + '</span></li>';
                });

                partnerBox += '</ul></div>';
                partnersContainer.insertAdjacentHTML('beforeend', partnerBox);
            }
        }
    }

    function getPartnerType(key) {
        switch (key){
            case 'dj':
                return 'Local DJ'
            case 'food':
                return 'Food and Beverage'
            case 'table':
                return 'Tables and Chairs'
            case 'deco':
                return 'Decorations'
            default:
                return 'Partner Type'
        }
    }
</script>
<body>
    <jsp:include page="NavBarBack.jsp" />
    <div class="content">
        <div>
            <a href="AddPartner.jsp"><button class="add-btn">Add New Partner</button></a>
        </div>
        <div class="partners">
            <c:forEach var="partnerType" items="${partnersGroupedByType}">
                <div class="partnerBox">
                    <h2>${partnerType.key}</h2> <!-- Display the partner type as the title -->
                    <ul>
                        <c:forEach var="partner" items="${partnerType.value}">
                            <li>
                                <span>${partner.partnerName}</span> <!-- Display the partner name -->
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
