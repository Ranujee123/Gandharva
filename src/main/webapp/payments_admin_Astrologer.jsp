<%--suppress CssInvalidPropertyValue --%>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/6/2024
  Time: 5:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Admin Dashboard</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <link rel ="stylesheet" type="text/css" href="admin.css">
</head><style>
  .tagbar{
    width: 90%;
    display: flex;
    padding-top: 20px;
    padding-left: 120px;
    justify-content: start;
    gap: 20px;
  }
  .tagbar a{
    width: 200px;
    color: black;
    text-decoration: none;
    height: 30px;
    background-color: rgba(234, 234, 234, 0.7);
    align-items: center;
    justify-content: center;
    display: flex;
    border-radius: 20px;
    border: none;
  }
</style>
<body>

<%@ include file="sidebar_admin.jsp" %>
<div class="container-box" style="top: 0;left: 0" onclick="{document.querySelector('.container-box').style.display='none'}">
  <div class="profile-box" style="padding: 20px">
    <div class="pic-box" style="max-height: 150px; display: flex;align-items: center;justify-content: center">
      <img class="prf_pic" src="images/no-profile.png" alt="Profile Picture">
    </div>



    <h2 class="uname">Name</h2>
    <div class="type-box" style= "display: flex;align-items: center;justify-content: center" >
      <h5 class="utype">Client</h5>
      <h5 class="tag " style="margin: 0;padding: 0;">free</h5>
    </div>
    <div class="view">
      <div class="detail-box gradient email-box"><p class="email-p">Email  <span class="tex email"></span></p></div>
      <div class="detail-box gradient nic-box"><p class="nic-p">NIC  <span class="tex nic"></span></p></div>
      <div class="detail-box gradient dis-box"><p class="dis-p">District  <span class="tex dis"></span></p></div>
      <div class="detail-box gradient ch-box"><p class="ch-p">Contracts Handled <span class="tex ch"></span></p></div>
      <div class="detail-box gradient exp-box"><p class="exp-p">Experience  <span class="tex exp"></span></p></div>
      <BUTTON class="detail-box " id="btn-pay" style="margin-top: 20px;background-color: #2dbb16;font-weight: bolder;color: #f0f0f0">Pay</BUTTON>

    </div>

  </div>
</div>
<div class="content">
  <h2>Payments</h2>
  <div class="tagbar">
    <a href="payments_admin">All Payments</a>
    <a href="payments_admin?astro=true">Astrologer Payments</a>
  </div>






  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <script>

    function displayUserDetails( uid,name,userType, email,nic,birthday, country,district,contractsHandled,experience,url) {
      document.querySelector('.container-box').style.display = 'flex';
      const tag = document.querySelector('.tag');
      const utype = document.querySelector('.utype');
      utype.textContent = userType;
      tag.classList.remove('ic-pro','ic-free');
      tag.style.display = 'flex';
      if(userType === 'PREMIUM_USER'||userType === 'USER'){
        document.querySelector('.ch-box').style.display = 'none';
        document.querySelector('.exp-box').style.display = 'none';



        if(userType === 'PREMIUM_USER') {
          tag.textContent = 'PRO';
          tag.classList.add('ic-pro');
          utype.textContent = 'USER';
        }else{
          tag.textContent = 'Free';
          tag.classList.add('ic-free');
        }




      }else{
        document.querySelector('.ch-box').style.display = 'flex';
        document.querySelector('.exp-box').style.display = 'flex';
        tag.style.display = 'none';

      }
      const prfPic = document.querySelector('.prf_pic');
      const uname = document.querySelector('.uname');

      const emailText = document.querySelector('.email');
      const nicText = document.querySelector('.nic');
      const bdText = document.querySelector('.bd');
      const disText = document.querySelector('.dis');
      const chText = document.querySelector('.ch');
      const expText = document.querySelector('.exp');

      prfPic.src = url;
      uname.textContent = name;



      if(nic!=''){
        document.querySelector('.nic-box').classList.remove("gradient")
        nicText.textContent = ' : '+ nic;
      }else {
        document.querySelector('.nic-box').classList.add("gradient")
        nicText.textContent = '';
      }
      if(email!='') {
        document.querySelector('.email-box').classList.remove("gradient")
        emailText.textContent = ' : ' + email;
      }else {
        document.querySelector('.email-box').classList.add("gradient")
        emailText.textContent = '';
      }


      if(district!=''){
        document.querySelector('.dis-box').classList.remove("gradient")
        disText.textContent =' : '+ district;
      }else {
        document.querySelector('.dis-box').classList.add("gradient")
        disText.textContent = '';
      }
      if(contractsHandled!=''){
        document.querySelector('.ch-box').classList.remove("gradient")
        chText.textContent = ' : '+contractsHandled;
      }else {
        document.querySelector('.ch-box').classList.add("gradient")
        chText.textContent = '';
      }
      if(experience!=''){
        document.querySelector('.exp-box').classList.remove("gradient")
        expText.textContent = ' : '+experience;
      }else {
        document.querySelector('.exp-box').classList.add("gradient")
        expText.textContent = '';
      }

      document.getElementById("btn-pay").addEventListener('click',()=>{
        Swal.fire({
          title: 'Are you sure?',
          text: "You want to Pay for this user!",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#192d3c',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Yes, Pay  it!'
        }).then((result) => {
          if (result.isConfirmed) {
            fetch('/Gandharva_main_war_exploded/payments_admin', {
              method: 'POST',
              headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
              },
              body: 'uid='+encodeURIComponent(uid)
            })
                    .then(function(response) {
                      if (response.ok) {
                        return response.text();
                      }
                      throw new Error('Network response was not ok.');
                    })
                    .then(function(responseText) {
                      console.log(responseText);
                      Swal.fire({
                        title: 'Paid!',
                        text: 'Paymeny Successful.',
                        icon: 'success',
                        confirmButtonColor: '#192d3c',
                      }).then((result)=>{
                        if(result.isConfirmed) {
                          location.reload();
                        }
                        // location.reload()
                      })
                    })
                    .catch(function(error) {
                      console.error('There was a problem with the fetch operation:', error);
                    });

          }

        });
      })
    }
  </script>



  <div class="container">
    <table>
      <thead>
      <tr>

        <th>Name</th>
        <th>NIC</th>
        <th>Email</th>

        <th>Net Amount</th>
        <th>Pay Amount</th>



      </tr>
      </thead>

      <tbody>
      <c:forEach items="${userList}" var="user">
        <tr onclick="displayUserDetails('${user.userid}','${user.firstName} ${user.lastName}','${user.userType}','${user.email}','${user.nic}','${user.birthday}','${user.countryOfResidence}','${user.district}','${user.numberOfCasesHandled}','${user.yearsOfExperience}','${user.base64Image}')">

          <td><div id="cener-box"><img src="${user.base64Image}" width="50" class="profimage" height="50"/>${user.firstName} ${user.lastName}</div></td>
          <td>${user.nic}</td>
          <td>${user.email}</td>
          <td>${user.amount}</td>
          <td>${user.payamount}</td>


        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>



</body>
</html>
