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
<%--    <link rel="stylesheet" type="text/css" href="admin.css">--%>
  <style>
    .content-a { !important;
      padding-left: 300px;
      width: 1200px;

      transition: margin-left 0.5s;
    }
    .chart-container{
      display: flex;
      justify-content: space-around;
      margin-top: 50px;
      height: 350px;
      width: 1200px;
      flex-direction: row;
    }
    .content-a h2{
      margin-top: 50px;
      margin-left: 50px;
    }
    .stats{
      display: flex;
      flex-direction: row;
      justify-content: space-evenly;
      margin-top: 20px;
      width: 1200px;
    }
    .stat{
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;

    }
    .stat p{
        font-size: 40px;
        font-weight: bold;
      margin-top: 0;
    }



  </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>
<%@ include file="sidebar_admin.jsp" %>


  <div class="content-a" >

    <h2>System Statistics</h2>
    <div class="stats">

        <div class="stat">
            <h3>Active Users</h3>
            <p class="active-users">0</p>
        </div>
        <div class="stat">
            <h3>Standerd Users</h3>
            <p class="standerd-users">0</p>
        </div>
        <div class="stat">
            <h3>Premium Users</h3>
            <p class="premium-users">0</p>
        </div>
        <div class="stat">
            <h3>Astrologers</h3>
            <p class="astrologers">0</p>
        </div>
        <div class="stat">
            <h3>Event Planners</h3>
            <p class="event">0</p>
        </div>

    </div>
    <h2 style="margin-top: 10px;margin-bottom: 10px">Transaction Statistics</h2>
    <div class="chart-container">
      <canvas id="income-bar" width="200" height="200"></canvas>
      <canvas id="income-pie" width="400" height="400"></canvas>
    </div>

  </div>

<div id="adminDashboardData" style="display: none;">
    <span id="totalUsers">${adminDashboardmodels.totalUsers}</span>
    <span id="astrologerCount">${adminDashboardmodels.astrologers}</span>
    <span id="standardUsersCount">${adminDashboardmodels.standerdUsers}</span>
    <span id="premiumUsersCount">${adminDashboardmodels.premiumUsers}</span>
    <span id="eventPlannersCount">${adminDashboardmodels.eventPlanners}</span>
    <span id="paymentAstrologers">${adminDashboardmodels.paymentAstrologers}</span>
    <span id="paymentStandardUsers">${adminDashboardmodels.paymentUsers}</span>
    <span id="paymentPremiumUsers">${adminDashboardmodels.paymentPremiumUsers}</span>
    <span id="paymentEventPlanners">${adminDashboardmodels.paymentEvents}</span>
</div>

<script>



    setstats(${adminDashboardmodels.totalUsers}, ${adminDashboardmodels.standerdUsers}, ${adminDashboardmodels.premiumUsers}, ${adminDashboardmodels.astrologers}, ${adminDashboardmodels.eventPlanners});
    const barchart= document.getElementById('income-bar');
    const piechart= document.getElementById('income-pie');
    const labels = ['Astologer', 'Premium', 'Standard', 'Events'];
    const  dataarray=[${adminDashboardmodels.paymentAstrologers},${adminDashboardmodels.paymentPremiumUsers},${adminDashboardmodels.paymentUsers},${adminDashboardmodels.paymentEvents}]
    const colorsBAC = ['rgb(238,118,145)','rgb(247,193,102)','rgb(109,244,223)','rgb(98,98,244)'];

  const pieData = {
    labels: labels,
      datasets: [
        {
          label: 'Total Income by Payment Category',
          data: dataarray,
          backgroundColor: colorsBAC,
        }
      ]

  };


  const bardata = {
    labels: labels,
    datasets: [
      {
        label: 'Total Transaction Amounts',
        data: dataarray,

        backgroundColor: colorsBAC,
      }
    ]
  };



  const barconfig = {
    type: 'bar',
    data: bardata,
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    },
  };
  const pieconfig = {
    type: 'pie',
    data: pieData,
    options: {
      responsive: true,
      plugins: {
        legend: {
          position: 'top',
        },
        title: {
          display: true,
          text: 'Total Income by Payment Category'
        }
      }
    },
  };

  new Chart(barchart, barconfig);
  new Chart(piechart, pieconfig);

function setstats(activeUsercount, standerdUsercount, premiumUsercount, astrologercount, eventPlannercount){
    console.log(activeUsercount, standerdUsercount, premiumUsercount, astrologercount);
    let activeUsers = document.querySelector('.active-users');
    let standerdUsers = document.querySelector('.standerd-users');
    let premiumUsers = document.querySelector('.premium-users');
    let astrologers = document.querySelector('.astrologers');
    let eventPlanners = document.querySelector('.event');
    let count = 0;
    setInterval(()=>{
        if(count <= activeUsercount){

            activeUsers.textContent = count;
        }
        if(count <= astrologercount){

            astrologers.textContent = count;
        }
        if(count <= standerdUsercount){

            standerdUsers.textContent = count;
        }
        if(count <= premiumUsercount){

            premiumUsers.textContent = count;
        }
        if(count <= eventPlannercount){

            eventPlanners.textContent = count;
        }

        count++;
    }, 20);

}


</script>





</body>
</html>
