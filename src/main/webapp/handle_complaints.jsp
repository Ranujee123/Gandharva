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

    <div class="view" style="padding: 0px 20px; display: flex;flex-direction: row; width: 100%; ">
       <div class="box-con" style="width: 70%;padding: 20px 0">
         <h3 class="complain-title" >Reported User</h3>
         <div class="box-complainer"  style="padding: 20px" >
           <div class="pic-box" style="max-height: 150px; display: flex;align-items: center;justify-content: center">
             <img class="prf_pic-complainer2" src="images/no-profile.png" alt="Profile Picture" style="width: 150px">
           </div>
           <div class="name-box">
             <p class="name usertext" >Name : <span class="n-r"> Shyamal Test User</span> </p>
             <p class="email usertext">Email : <span class="e-r"> sha256@tmail.com</span> </p>
             <p class="Usertype usertext">User Type : <span class="ut-r"> </span> </p>
             <p class="Disrtict usertext">District : <span class="dis-r"> sha256@tmail.com</span> </p>
             <p class="Nic usertext">NIC : <span class="nic-r"> </span> </p>
             <p class="Birthday usertext">Birthday : <span class="bd-r"> </span> </p>
             <p class="Experience usertext">Experience : <span class="exp-r"> </span> </p>
             <p class="Report usertext">Report Count : <span class="rc-r"> </span> </p>
           </div>
         </div>
       </div>

      <div class="buttons-box" style="    padding-top: 150px; flex-direction: column; display: flex; gap: 10px; justify-content: center; padding-left: 15px;">
        <button class="btn-view"> View past Complains</button>
        <button class="btn-ban"> Ban this user</button>
        <button class="btn-resolve"> Ignore</button>
      </div>


    </div>


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
              <c:if test="${complaint.status == 'REPORTED'}">
                <button style="width:  -webkit-fill-available" onclick="displayComplain('${complaint.firstName} ${complaint.lastName}','${complaint.email}','${complaint.countryOfResidence}','${complaint.userType}','${complaint.status}','${complaint.idcomplaints}','${complaint.date}','${complaint.title}','${complaint.descripion}','${complaint.base64Image}','${complaint.receiver_firstName} ${complaint.receiver_lastName}','${complaint.receiver_email}','${complaint.receiver_countryOfResidence}','${complaint.receiver_userType}','${complaint.receiver_district}','${complaint.receiver_nic}','${complaint.receiver_birthday}','${complaint.receiver_numberOfCasesHandled}','${complaint.receiver_yearsOfExperience}','${complaint.receiver_userImage}','${complaint.receiver_complaint_count}','${complaint.receiverid}','${complaint.title}')">Go to Resolve</button>
              </c:if>
              <c:if test="${complaint.status == 'Resolved'}">
                <button style="width:  -webkit-fill-available" onclick="displayComplain('${complaint.firstName} ${complaint.lastName}','${complaint.email}','${complaint.countryOfResidence}','${complaint.userType}','${complaint.status}','${complaint.idcomplaints}','${complaint.date}','${complaint.title}','${complaint.descripion}','${complaint.base64Image}','${complaint.receiver_firstName} ${complaint.receiver_lastName}','${complaint.receiver_email}','${complaint.receiver_countryOfResidence}','${complaint.receiver_userType}','${complaint.receiver_district}','${complaint.receiver_nic}','${complaint.receiver_birthday}','${complaint.receiver_numberOfCasesHandled}','${complaint.receiver_yearsOfExperience}','${complaint.receiver_userImage}','${complaint.receiver_complaint_count}','${complaint.receiverid}','${complaint.title}')">View</button>

              </c:if>

            </div>
          </td>
        </tr>






      </c:forEach>
    </table>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <script>
      function displayComplain(name, email, country, userType, status, id, date,title, description,URL,r_name,r_email,r_country,r_userType,r_district,r_nic,r_birthday,no_cases,r_exp,r_image,r_reportcount,r_id) {
        document.querySelector('.prf_pic-complainer').src = URL;
        document.querySelector('.container-box').style.display = 'flex';
        document.querySelector('.n-c').innerText = name;
        document.querySelector('.e-c').innerText = email;
        document.querySelector('.ut-c').innerText = userType;
        document.querySelector('.n-r').innerText = r_name;
        document.querySelector('.e-r').innerText = r_email;
        document.querySelector('.ut-r').innerText = r_userType;
        document.querySelector('.dis-r').innerText = r_district;
        document.querySelector('.nic-r').innerText = r_nic;
        document.querySelector('.bd-r').innerText = r_birthday;
        document.querySelector('.exp-r').innerText = r_exp;
        document.querySelector('.rc-r').innerText = r_reportcount;
        document.querySelector('.prf_pic-complainer2').src = r_image;
        document.querySelector('.complain-title').innerText = title
        document.querySelector('.btn-view').onclick= function(){
          window.location.href = '/Gandharva_main_war_exploded/complaints?id='+r_id;
        }
        document.querySelector('.btn-ban').onclick = function(){

                  Swal.fire({
                    title: 'Are you sure?',
                    text: "You want to "+'Ban'+" this user!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, '+'Ban'+' it!'
                  }).then((result) => {
                    if (result.isConfirmed) {


                      fetch('/Gandharva_main_war_exploded/activateuser', {
                        method: 'POST',
                        headers: {
                          'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: 'id=' + encodeURIComponent(r_id)+'&status='+encodeURIComponent('0')
                      })
                              .then(function(response) {
                                if (response.ok) {
                                  return response.text();
                                }
                                throw new Error('Network response was not ok.');
                              })
                              .then(function(responseText) {
                                  fetch('/Gandharva_main_war_exploded/complaints', {
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



                              })
                              .catch(function(error) {
                                console.error('There was a problem with the fetch operation:', error);
                              });
                    }
                  })
                }

        statustag = document.querySelector('.status-view')
        statustag.innerText = status;
        if (status == 'REPORTED') {

          statustag.classList.remove('status-c-deactive')
          statustag.classList.add('status-c-active')
          document.querySelector('.btn-resolve').style.display = 'block';
          document.querySelector('.btn-ban').style.display = 'block';
            document.querySelector('.btn-view').style.display = 'block';
        } else {
          statustag.classList.remove('status-c-active')
          statustag.classList.add('status-c-deactive')
          document.querySelector('.btn-resolve').style.display = 'none';
          document.querySelector('.btn-ban').style.display = 'none';
          document.querySelector('.btn-view').style.display = 'none';
        }
        document.querySelectorAll('.id').forEach((element) => {
          element.innerText = id;
        });
        document.querySelector('.date').innerText = date;


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
              fetch('/Gandharva_main_war_exploded/complaints', {
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
