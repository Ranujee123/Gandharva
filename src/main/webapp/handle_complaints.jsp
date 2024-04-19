<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/6/2024
  Time: 5:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
  <title>Admin Dashboard</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <link rel="stylesheet" type="text/css" href="admin.css">

  <style>

  </style>
</head>

<%@ include file="sidebar_admin.jsp" %>
<div class="container-box" onclick="document.querySelector('.container-box').style.display='none'"  >
  <div class="problem-box">
    <div style="width: 100%">

    <div class="problem-box-title">
      <h2 class="complain-main-title">Complain #<span class="id">32</span> </h2>
    </div>

    <div class="box-complainer-main">
      <div class="box-complainer"  >
        <div class="pic-box" style="max-height: 60px; display: flex;align-items: center;justify-content: center">
          <img class="prf_pic-complainer" src="images/no-profile.png" alt="Profile Picture">
        </div>
      <div class="name-box">
        <p class="name usertext">Name : <span class="n-c"> Shyamal Test User</span> </p>
        <p class="email usertext">Email : <span class="e-c"> sha256@tmail.com</span> </p>
          <p class="Country usertext">Country : <span class="c-c"> </span> </p>
        <p class="Usertype usertext">User Type : <span class="ut-c"> </span> </p>
      </div>
      </div>

      <div class="box-complainer" style="border: none"  >

        <div class="name-box">
          <h4 style="margin: 0;padding: 5px">Complain status : <span class="status-c-active status-view">Open</span> </h4>
          <H5 style="margin: 0;padding: 5px">Complain Id : <span class="id">32</span> </H5>
          <H5 style="margin: 0;padding: 5px">Publish Date : <span class="date">2021-06-06</span> </H5>


        </div>
      </div>
    </div>
    </div>

    <div class="view" style="padding: 0px 20px">
        <h3 class="complain-title" >Complaining about the system error </h3>
        <p class="compalain-description">I am encountering a significant issue with the system, which seems to be malfunctioning and impeding my access. Despite my attempts, I am unable to gain entry or utilize its functionalities effectively. This obstacle is hindering my productivity and causing frustration. Urgent assistance is required to rectify this problem promptly and restore normal functionality to the system. Any guidance or troubleshooting steps provided would be greatly appreciated in resolving this issue and allowing me to resume my tasks seamlessly. Thank you for your attention to this matter</p>

    </div>
    <button class="btn-resolve">Resolve</button>

  </div>
</div>
<div class="content">
  <h2>Handle Complaints</h2>

  <div class="container-complaints">
    <table>


      <c:forEach items="${complaints}" var="complaint">


        <tr >
        <td style="border: none; border-bottom: 1px solid #f2f2f2; padding: 10px 30px; padding-top: 20px; margin-top: 10px; text-align: left;">
            <div class="row">
              <div class="head-row">
                <div class = "user-line">
                  <img src="${complaint.base64Image}" class="profimage-complaints">
                  <h5>${complaint.firstName} ${complaint.lastName}</h5>
                </div>
                <p>Published Date : ${complaint.date}</p>
              </div>

              <h3>Title: ${complaint.title}</h3>
              <p>${complaint.descripion}</p>
              <c:if test="${complaint.status == 'Open'}">
                <button style="width:  -webkit-fill-available" onclick="displayComplain('${complaint.firstName} ${complaint.lastName}','${complaint.email}','${complaint.countryOfResidence}','${complaint.userType}','${complaint.status}','${complaint.idcomplaints}','${complaint.date}','${complaint.title}','${complaint.descripion}','${complaint.base64Image}')">Go to Resolve</button>
              </c:if>
              <c:if test="${complaint.status == 'Closed'}">
                <button style="width:  -webkit-fill-available" onclick="displayComplain('${complaint.firstName} ${complaint.lastName}','${complaint.email}','${complaint.countryOfResidence}','${complaint.userType}','${complaint.status}','${complaint.idcomplaints}','${complaint.date}','${complaint.title}','${complaint.descripion}','${complaint.base64Image}')">View</button>

              </c:if>

            </div>
          </td>
        </tr>






      </c:forEach>
    </table>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <script>
      function displayComplain(name, email, country, userType, status, id, date,title, description,URL) {
        document.querySelector('.prf_pic-complainer').src = URL;
        document.querySelector('.container-box').style.display = 'flex';
        document.querySelector('.n-c').innerText = name;
        document.querySelector('.e-c').innerText = email;
        document.querySelector('.c-c').innerText = country;
        document.querySelector('.ut-c').innerText = userType;
        statustag = document.querySelector('.status-view')
        statustag.innerText = status;
        if (status == 'Open') {

          statustag.classList.remove('status-c-deactive')
          statustag.classList.add('status-c-active')
          document.querySelector('.btn-resolve').style.display = 'block';
        } else {
          statustag.classList.remove('status-c-active')
          statustag.classList.add('status-c-deactive')
          document.querySelector('.btn-resolve').style.display = 'none';
        }
        document.querySelectorAll('.id').forEach((element) => {
          element.innerText = id;
        });
        document.querySelector('.date').innerText = date;
        document.querySelector('.complain-title').innerText = title;
        document.querySelector('.compalain-description').innerText = description;

      }

        document.querySelector('.btn-resolve').addEventListener('click', () => {
            Swal.fire({
            title: 'Are you sure?',
            text: "You want to resolve this complain!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#4CAF50',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, resolve it!'
            }).then((result) => {
            if (result.isConfirmed) {

              var complaintId = document.querySelector('.id').innerText;
              fetch('/Gandharva_main/complaints', {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'id=' + encodeURIComponent(complaintId),
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
                                'Resolved!',
                                'Complain has been resolved.',
                                'success'
                        ).then(() => {
                          location.reload();
                        });
                      })
                      .catch(function(error) {
                        console.error('There was a problem with the fetch operation:', error);
                      });

            }
            })
        })
  </script>


  </div>

</div>
