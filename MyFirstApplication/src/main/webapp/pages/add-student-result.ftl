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
  margin-left:150px;
  border:2px solid gray;
  text-align:center;
}
tr{
 border:2px solid gray;
 text-align:center;
}
td{
 padding:0px 40px 5px 5px;
 border:2px solid gray;
 border-radius:20px;
 text-align:center;
  padding:10px 20px 10px 20px;
}

#updateBtn {
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
</style>
<body>
    <nav id="fixNav">
        <ul>
            <li><a href="/adminLogOut" id="logOut">Log-out</a></li>
            <li><a href="#" id="currentPage">Add Student Result</a></li>
            <li><a href="/addStudent">Add Student</a></li>
            <li><a href="/adminHome">Students List</a></li>
        </ul>
    </nav>


 <header>
        <h1>Add Student Results</h1>
    </header>
    <hr>
 

  <#if studentsLists?has_content>


 <#list studentQualifications as eachQualification>
 <#assign sno=0>
   <#assign headingDisplay=1>
 <table>
<#list studentsLists as eachStudent>
 <#if eachStudent.regQualification==eachQualification.qualificationId> 
 <#assign sno=sno+1>
 <#if headingDisplay==1>
 <#assign headingDisplay=headingDisplay+1>

 <caption id="bold">${eachStudent.regQualification} Student Details</caption>
  <tr id="bold">
   <td>SNO</td>
   <td>Student Id</td>
   <td>Student Name</td>
   <td>Student Qualification</td>
   <td>Add Results</td>
   <td>Update Results</td>
   <td>Delete Results</td>
  </tr>
</#if>
 <tr>
   <td>${sno}</td>
    <td>${eachStudent.studentId}</td>
     <td>${eachStudent.studentName?if_exists}</td>
      <td>${eachStudent.regQualification?if_exists}</td>
     <form action="/processAddStudentResult?studentId=${eachStudent.studentId}&&qualification=${eachStudent.regQualification?if_exists}" method="post">
      <td><input id="updateBtn" type="submit" value="Add"></td>
     </form>
     <form action="/processUpdateStudentResult?studentId=${eachStudent.studentId}&&qualification=${eachStudent.regQualification?if_exists}" method="post">
      <td><input id="updateBtn" type="submit" value="Update"></td>
    </form>
    <form action="/processDeleteStudentResult?studentId=${eachStudent.studentId}&&qualification=${eachStudent.regQualification?if_exists}" method="post">
      <td><input id="deleteBtn" type="submit" value="Delete"></td>
    </form>
   </tr>
</#if>  
  </#list>
 </table><br><br><hr>
 </#list>
 </#if>


   
    <footer id="bottomFix">
        <p class="footer" >&copy; All Rights Reserved 2024 <br>Bangarugallamahesh@gmail.com</p>
    </footer>

</body>
</html>