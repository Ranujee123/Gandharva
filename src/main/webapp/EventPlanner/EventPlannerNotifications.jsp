<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/28/2024
  Time: 7:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Notification</title>
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

    .notification {
        padding: 12px;
        background-color: #cccccc;
        margin: 10px 20px;
    }

    .notificationData {
        display: flex;
        flex-direction: column;
        margin: 5px 0;
    }

    .notificationTitle {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }

    .view-button {
        padding: 6px;
        font-size: 15px;
    }

    .notification-details {
        margin-top: 10px;
    }

    .notification-details p {
        margin: 5px 0;
    }

    .action-buttons {
        margin-top: 10px;
    }

    .hidden {
        display: none;
    }

    .accept-btn {
        padding: 3px;
        font-size: 15px;
        background: #007bff;
        color: #fff;
        margin-right: 4px;
    }

    .dec-btn {
        padding: 3px;
        font-size: 15px;
        background: red;
        color: #fff;
        margin-left: 4px;
    }
</style>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        fetch('${pageContext.request.contextPath}/EventPlanner/notification')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                const notificationContainer = document.querySelector('.notification');

                data.forEach(notification => {
                    const notificationDiv = document.createElement('div');
                    notificationDiv.classList.add('notificationData');

                    const notificationTitle = document.createElement('div');
                    notificationTitle.classList.add('notificationTitle');

                    const title = document.createElement('h3');
                    title.textContent = 'You have received a new request from' + notification.customer;
                    notificationTitle.appendChild(title);
                    notificationDiv.appendChild(notificationTitle);

                    const viewButton = document.createElement('button');
                    viewButton.textContent = 'View';
                    viewButton.classList.add('view-button');

                    const notificationDetails = document.createElement('div');
                    notificationDetails.classList.add('notification-details', 'hidden');
                    notificationDetails.innerHTML = '<p><strong>Food For: </strong>' + notification.foodFor + '</p>' +
                        '<p><strong>Beverages For: </strong>' + notification.beveragesFor + '</p>' +
                        '<p><strong>Tables/Chairs: </strong>' + notification.tablesChairs + '</p>' +
                        '<p><strong>Requested Date: </strong>' + notification.requestedDate + '</p>' +
                        '<p><strong>Budget Range: </strong>' + notification.budgetRange + '</p>';

                    viewButton.addEventListener('click', function () {
                        const notificationDetailsView = notificationDiv.querySelector('.notification-details');
                        notificationDetailsView.classList.toggle('hidden');
                        const actionButtons = notificationDiv.querySelector('.action-buttons');
                        actionButtons.classList.toggle('hidden');
                    });

                    notificationTitle.appendChild(viewButton);
                    notificationDiv.appendChild(notificationDetails);

                    const actionButtonsDiv = document.createElement('div');
                    actionButtonsDiv.classList.add('action-buttons', 'hidden');

                    const acceptButton = document.createElement('button');
                    acceptButton.classList.add('accept-btn');
                    acceptButton.textContent = 'Accept';
                    actionButtonsDiv.appendChild(acceptButton);
                    acceptButton.addEventListener('click', function (){
                        updateStatus(notification.id, 'ACCEPT');
                    })

                    const declineButton = document.createElement('button');
                    declineButton.textContent = 'Decline';
                    declineButton.classList.add('dec-btn');
                    actionButtonsDiv.appendChild(declineButton);
                    declineButton.addEventListener('click', function (){
                        updateStatus(notification.id, 'DECLINED');
                    })

                    notificationDiv.appendChild(actionButtonsDiv);

                    notificationContainer.appendChild(notificationDiv);
                });
            })
            .catch(error => console.error('Error fetching notifications data:', error));
    });

    function updateStatus(id,status) {
        fetch('${pageContext.request.contextPath}/EventPlanner/notification', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'id=' + encodeURIComponent(id)+'&status='+encodeURIComponent(status)
        })
            .then((response => {
                if(response.ok){
                    window.location.href ='EventReservations.jsp';
                }
            }))
            .catch(error => console.error('Error in action:', error));
    }
</script>
<body>
<jsp:include page="NavBarBack.jsp"/>
<div class="content">
    <jsp:include page="EventSideMenu.jsp"/>
    <div class="right-content">
        <div class="notification">
            <div class="notificationData"></div>
        </div>
    </div>
</div>
</body>
</html>
