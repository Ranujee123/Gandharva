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
</head>
<body>

<%@ include file="sidebar_admin.jsp" %>
<div class="container-box" onclick="{document.querySelector('.container-box').style.display='none'}">
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
      <div class="detail-box gradient bd-box"><p class="bd-p">BirthDate  <span class="tex bd"></span></p></div>
      <div class="detail-box gradient cou-box" ><p class="cou-p">Country  <span class="tex cou"></span></p></div>
      <div class="detail-box gradient dis-box"><p class="dis-p">District  <span class="tex dis"></span></p></div>
      <div class="detail-box gradient ch-box"><p class="ch-p">Contracts Handled <span class="tex ch"></span></p></div>
      <div class="detail-box gradient exp-box"><p class="exp-p">Experience  <span class="tex exp"></span></p></div>

    </div>

  </div>
</div>
<div class="content">
  <h2>Users</h2>



  <script>

    function displayUserDetails( name,userType, email,nic,birthday, country,district,contractsHandled,experience,url) {
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
        const couText = document.querySelector('.cou');
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
        if(birthday!=''){
          document.querySelector('.bd-box').classList.remove("gradient")
          bdText.textContent =' : '+ birthday;
        }else {
          document.querySelector('.bd-box').classList.add("gradient")
          bdText.textContent = '';
        }
        if(country!=''){
          document.querySelector('.cou-box').classList.remove("gradient")
          couText.textContent =' : '+ country;
        }else {
          document.querySelector('.cou-box').classList.add("gradient")
          couText.textContent = '';
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


    }
  </script>



  <div class="container">
    <table>
      <thead>
      <tr>

        <th>Name</th>
        <th>Birthday</th>
        <th>NIC</th>
        <th>Email</th>
        <th>User Type</th>
        <th>Country</th>


      </tr>
      </thead>

      <tbody>
      <c:forEach items="${userList}" var="user">
        <tr onclick="displayUserDetails('${user.firstName} ${user.lastName}','${user.userType}','${user.email}','${user.nic}','${user.birthday}','${user.countryOfResidence}','${user.district}','${user.numberOfCasesHandled}','${user.yearsOfExperience}','${user.base64Image}')">

          <td><div id="cener-box"><img src="${user.base64Image}" width="50" class="profimage" height="50"/>${user.firstName} ${user.lastName}</div></td>
          <td>${user.birthday}</td>
          <td>${user.nic}</td>
          <td>${user.email}</td>
          <td>${user.userType}</td>
          <td>${user.countryOfResidence}</td>

        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>



</body>
</html>
