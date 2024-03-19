<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index</title>
</head>
<style>

body{
    text-align:center;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 10px;
  overflow: hidden;
  background-color: #00ff00;
  position: sticky;
  top: 0;
  border-radius:10px;
}

li {
  float: right;
  margin-right:200px;
  margin-left:-80px;
}

li a {
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
    border-radius:20px;
}
li a:link {
    
}

li a:hover {
    border:1px solid red;
      border-radius:20px;
}

li.active {
  background-color: yellow;
}
#currentPage{
 background-color:white;
}
.footer{
   text-align:center;
   background-color:black;
   padding:30px;
   border:1px solid gray;
   font-size:bold;
   color:white;
   border-radius:20% 20% 0 0;
}
#logOut{
     background-color:red;
     color:white;
}
#bottomFix{
  position:sticky;
   right:0;
   bottom:0;
   left:0;
   z-index:1030
}
#fixNav{
  position:sticky;
   right:0;
   top:0;
   left:0;
   z-index:1030
}
#bold{
   font-weight:bold;
}
table{
  margin-left:30%;
  border:2px solid gray;
  text-align:center;
  border-radius:20px;
  width:40%;
}
tr{
 border:2px solid gray;
 text-align:center;
}
td{
 /*border:2px solid gray;
 border-radius:20px;  */
 text-align:center;
  padding:10px 20px 10px 0px;
}

#editButton,#updateBtn {
   color:white;
   background-color:green;
   border:2px solid gray;
   padding:10px 20px 10px 20px;
  border-radius:20px;
}
#deleteBtn {
   color:white;
   background-color:red;
   border:2px solid gray;
   padding:10px 20px 10px 20px;
  border-radius:20px;
}
td a{
  text-decoration:none;
  color:white;
  font-weight:bold;
}
#successMsg{
opacity:0;
  text-align:center;
  color:green;
  font-weight:bold;
  animation-name: returnMessage;
  animation-duration: 8s;
  animation-iteration-count: 1;

}
#errorMsg{
opacity:0;
  text-align:center;
  color:red;
  font-weight:bold;
  animation-name: returnMessage;
  animation-duration: 8s;
  animation-iteration-count: 1;
}

@keyframes returnMessage {
  0%   {opacity:1;}
  25%  {opacity:0.7;}
  50%  {opacity:0.3;}
  100% {opacity:0;}
}
.hidden{
  display:none;
}
</style>

<body onload="editStudentDetails()">
    <nav id="fixNav">
        <ul>
            <li><a href="/studentLogOut" id="logOut">Log-out</a></li>
            <li><a href="#" id="currentPage">Student Profile</a></li>
            <li><a href="/studentHome">Student Home</a></li>
        </ul>
    </nav>


 <header>
        <h1>Students Profile</h1>
    </header>
    <hr>
   <#--   <section id="section1">
        <h2>Section 1</h2>
        <p>This is the content of Section 1.</p>
    </section>  -->
    <#if _SUCCESS_MESSAGE_?has_content>
     <p id="successMsg">${_SUCCESS_MESSAGE_?if_exists}</p>
     <#else>
     <p id="errorMsg">${_ERROR_MESSAGE_?if_exists}</p>
    </#if>
   <div id="profile">
    <#if studentDetails?has_content>
     <table>
        <tr id="bold">
           <td>Student Id</td>
           <td>${studentDetails.studentId}</td>
        </tr>
        <tr id="bold">
           <td>Student Name</td>
           <td>${studentDetails.studentName}</td>
        </tr>
        <tr id="bold">
           <td>Pursuing</td>
           <td>${studentDetails.regQualification}</td>
        </tr>
        <tr id="bold">
           <td>Email Id</td>
           <td>${studentDetails.emailId?if_exists}</td>
        </tr>
        <tr id="bold">
           <td>Gender</td>
           <td>${studentDetails.gender?if_exists}</td>
        </tr>
         <tr id="bold">
           <td>Address</td>
           <td>${studentDetails.address?if_exists}</td>
        </tr>
        <tr id="bold">
           <td></td>
           <td><button id="editButton" onclick="editStudentDetails()">EDIT</button></td>
        </tr>
        
     </table>
   </#if>
  </div>
  <div id="editProfile">
     <form action="editStudentDetails" method="post">
     <#if studentDetails.studentId?has_content>
     <input type="hidden" name="studentId" value="${studentDetails.studentId?if_exists}" >
     <#elseif studentDetailList.studentId?has_content>
     <input type="hidden" name="studentId" value="${studentDetailList.studentId?if_exists}" >
     </#if>
     <table>
     <tr> 
       <td>studen Id</td>
       <td><input type="text" name="studentId" value="${studentDetails.studentId?if_exists}" disabled></td>
     </tr>
     <tr> 
       <td>studen Name</td>
       <td><input type="text" name="studentName" value="${studentDetails.studentName?if_exists}"></td>
     </tr>
      <tr> 
       <td>Pursuing</td>
       <td>
       <#if studentQualificationList?has_content>
        <select name="regQualification">
        <#list studentQualificationList as eachQualificationList>
        <#assign regQualification=eachQualificationList.qualificationId>
         <#if regQualification==studentDetails.regQualification>
          <option  value="${eachQualificationList.qualificationId}" selected>${eachQualificationList.qualificationName}</option>
         </#if> 
          <option  value="${eachQualificationList.qualificationId}">${eachQualificationList.qualificationName}</option>
          </#list>
           </select>
          </#if>
       </td>
     </tr>
      <tr> 
       <td>Email Id</td>
       <td><input type="text" name="emailId" value="${studentDetails.emailId?if_exists}"></td>
     </tr>
      <tr> 
       <td>Password</td>
       <td><input type="text" name="password" value="${studentDetails.password?if_exists}"></td>
     </tr>
      <tr> 
       <td>Gender</td>
       <td>
           <#if studentDetails.gender?if_exists=="Male">
            <input type="radio" name="gender" value="Male" checked>Male &nbsp; 
           <input type="radio" name="gender" value="Female">Female</td>
           <#elseif studentDetails.gender?if_exists=="Female">
            <input type="radio" name="gender" value="Male" >Male &nbsp; 
            <input type="radio" name="gender" value="Female" checked>Female</td>
            <#else>
             <input type="radio" name="gender" value="Male" checked>Male &nbsp; 
            <input type="radio" name="gender" value="Female">Female</td>
           </#if>
     </tr>
      <tr> 
       <td>Address</td>
       <td><textArea name="address" font-size="40px">${studentDetails.address?if_exists}</textArea></td>
     </tr>
      <tr> 
       <td></td>
       <td>
           <input type="submit" id="updateBtn" value="Update">
           <form action="/studentProfile">
             <input type="submit" id="updateBtn" value="Cancel">
           </form>
       </td>
     </tr>
     </table>
     </form>
 </div>
   
    <footer id="bottomFix">
        <p class="footer" >&copy; All Rights Reserved 2024 <br>Bangarugallamahesh@gmail.com</p>
    </footer>


<script>
function editStudentDetails(){
 var profile=document.getElementById("profile");
 var editProfile=document.getElementById("editProfile");
 if(profile.style.display==""){
   profile.style.display="block";
  editProfile.style.display="none";
 }else{
   profile.style.display="none";
  editProfile.style.display="block";
 }
}


</script>
</body>
</html>