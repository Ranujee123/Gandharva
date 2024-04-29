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

</head>
<body>

<%@ include file="sidebar_admin.jsp" %>

<div class="container-box"  >
  <div class="box-verify">

    <div class="profile-box">
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
        <div class="detail-box gradient bd-box"><p class="bd-p">BirthDate  <span class="tex bd"></span></p></div>

        <div class="detail-box gradient dis-box"><p class="dis-p">District  <span class="tex dis"></span></p></div>
        <div class="detail-box gradient exp-box"><p class="exp-p">Experience  <span class="tex exp"></span></p></div>

      </div>

    </div>
    <div class="button-box">
      <div class="certificate-box">
        <button class="view-br-file" onclick="viewBrFile()">View BR File</button>
        <button class="view-certificate" onclick="viewCertificate()">View Certificate</button>
      </div>
      <div class="control-box">
        <button class="reject-button" onclick="reject()">Reject</button>
        <button class="verify-button" onclick="verify()">Verify</button>
      </div>

    </div>
  </div>

</div>

<div class="content">
  <h2>Verify Accounts</h2>

  <div class="container">
    <table>
      <tr>

        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>NIC</th>
        <th>User Type</th>

      </tr>



      <c:forEach items="${userList}" var="user">
        <tr >

          <td>${user.firstName}</td>
          <td>${user.lastName}</td>
          <td>${user.email}</td>
          <td>${user.nic}</td>
          <td>${user.userType}</td>

          <td><button onclick="verifyUser('${user.firstName} ${user.lastName}','${user.userType}','${user.email}','${user.nic}','${user.birthday}','${user.countryOfResidence}','${user.district}','${user.numberOfCasesHandled}','${user.yearsOfExperience}','${user.base64Image}','${user.certificateFileUpload}','${user.brFileUpload}','${user.id}')">Verify</button></td>

        </tr>
      </c:forEach>


    </table>
  </div>


  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
  function handleBackgroundClick(event) {

    if (!event.target.closest('.box-verify')) {
      document.querySelector('.container-box').style.display = 'none';
    }
  }

  document.querySelector(".container-box").addEventListener('click', handleBackgroundClick);


  function verifyUser(name, type, email, nic, bd, cou, dis, cases, exp, img, cer, br,uid) {

    document.querySelector('.container-box').style.display = 'flex';
    const tag = document.querySelector('.tag');
    const utype = document.querySelector('.utype');
    utype.textContent = type;
    tag.classList.remove('ic-pro','ic-free');
    tag.style.display = 'flex';
    if(type === 'PREMIUM_USER'||type === 'USER'){

      document.querySelector('.exp-box').style.display = 'none';



      if(type === 'PREMIUM_USER') {
        tag.textContent = 'PRO';
        tag.classList.add('ic-pro');
        utype.textContent = 'USER';
      }else{
        tag.textContent = 'Free';
        tag.classList.add('ic-free');
      }




    }else{

      document.querySelector('.exp-box').style.display = 'flex';
      tag.style.display = 'none';

    }
    const prfPic = document.querySelector('.prf_pic');
    const uname = document.querySelector('.uname');
    const emailText = document.querySelector('.email');
    const nicText = document.querySelector('.nic');
    const bdText = document.querySelector('.bd');

    const disText = document.querySelector('.dis');
    const expText = document.querySelector('.exp');




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
    if(bd!=''){
      document.querySelector('.bd-box').classList.remove("gradient")
      bdText.textContent =' : '+ bd;
    }else {
      document.querySelector('.bd-box').classList.add("gradient")
      bdText.textContent = '';
    }
    if(dis!=''){
      document.querySelector('.dis-box').classList.remove("gradient")
      disText.textContent =' : '+ dis;
    }else {
      document.querySelector('.dis-box').classList.add("gradient")
      disText.textContent = '';
    }
    if(exp!=''){
      document.querySelector('.exp-box').classList.remove("gradient")
      expText.textContent = ' : '+exp;
    }else {
      document.querySelector('.exp-box').classList.add("gradient")
      expText.textContent = '';
    }



    uname.innerText = name;
    prfPic.src = img;

    document.querySelector('.view-br-file').onclick = function () {
      if(br === ''){
        Swal.fire({
          icon: 'error',
          title: 'BR File not uploaded',
          confirmButtonColor: '#192d3c',
        });
        return;
      }
      Swal.fire({
        imageUrl: br,
        imageAlt: "BR File",
        confirmButtonColor: '#192d3c',
      });
    };
    document.querySelector('.view-certificate').onclick = function () {
        if(cer === ''){
            Swal.fire({
            icon: 'error',
            title: 'Certificate not uploaded',
              confirmButtonColor: '#192d3c',
            });
            return;
        }
      Swal.fire({
        imageUrl: cer,
        imageAlt: "Certificate",
        confirmButtonColor: '#192d3c',
      });
    };

    document.querySelector('.verify-button').onclick = function () {
      Swal.fire({
        title: 'Are you sure?',
        text: "You want to verify this user!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#192d3c',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, verify it!'
      }).then((result) => {
        if (result.isConfirmed) {
          fetch('/Gandharva_main_war_exploded/verifyuser', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'action='+1+'&userid='+encodeURIComponent(uid)
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
                      title: 'Verified!',
                      text: 'User has been verified.',
                      icon: 'success',
                      confirmButtonColor: '#192d3c',
                    }).then(location.reload());
                  })
                  .catch(function(error) {
                    console.error('There was a problem with the fetch operation:', error);
                  });

            }
          })



        }


    document.querySelector('.reject-button').onclick = async function () {
      const { value: reson_text } = await Swal.fire({
        title: "Enter the reason for rejecting",
        input: "text",
        inputLabel: "Reason",showCancelButton: true,
        confirmButtonColor: '#192d3c',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, reject it!',
        inputValidator: (value) => {
          if (!value) {
            return "You need to write something!";
          }
        }
      });
      if (reson_text){
          fetch('/Gandharva_main_war_exploded/verifyuser', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'action='+2+'&userid='+encodeURIComponent(uid)+'&reason='+encodeURIComponent(reson_text)
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
                      title: 'Rejected!',
                      text: 'User has been rejected.',
                      icon: 'success',
                      confirmButtonColor: '#192d3c',
                    }).then(location.reload());
                  })
                  .catch(function(error) {
                    console.error('There was a problem with the fetch operation:', error);
                  });

        }

      }

  }
</script>

</div>


</body>
</html>
