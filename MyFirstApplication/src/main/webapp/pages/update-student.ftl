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
     background-image: url("students.jpg");
     background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: left;
     background-size: 500px;
     z-index:0;
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
 #addBtn {
   color:white;
   background-color:green;
   border:2px solid gray;
   padding:10px 20px 10px 20px;
  border-radius:20px;
}
#bottomFix{
  position:fixed;
   right:0;
   bottom:0;
   left:0;
   z-index:1030;
}
#section1{
  margin-left:30%;
}
table{
  margin-left:30%;
  text-align:left;
}
td{
  padding:16px;
}
</style>
<body>
    <nav>
        <ul>
            <li><a href="/adminLogOut" id="logOut">Log-out</a></li>
            <li><a href="#" id="currentPage">Update Student</a></li>
            <li><a href="/adminHome">Students List</a></li>
        </ul>
    </nav>


   <header id="section1">
        <h1>Update Student</h1>
    </header>
    <hr>
    <section id="section1">
    <form action="updateStudentDetails" method="post">
    <#if studentDetailsById?has_content>
    <#list studentDetailsById as eachStudentDetailsById>
    <input type="hidden" id="studentId" name="studentId" value="${eachStudentDetailsById.studentId?if_exists}">
     <table>
       <tr> 
         <td> <label for="studentName">Student Name  </label></td>
         <td> <input type="text" id="studentName" name="studentName" value="${eachStudentDetailsById.studentName?if_exists}" required></td>
      </tr>
       
       <tr>  
         <td> <label for="studentName">Student Id  </label></td>
         <td> <input type="text" id="studentId" name="studentId" value="${eachStudentDetailsById.studentId?if_exists}"  disabled></td>
       </tr> 
      
        <tr>
         <td> <label for="regQualification">Registration Qualification </label></td>
         <td>  <select name="regQualification" required>
           <option value="${eachStudentDetailsById.regQualification?if_exists}"></option>
           <#assign reqQualification=eachStudentDetailsById.regQualification>
           <#if studentQualificationList?has_content>
           <#list studentQualificationList as eachQualification>
               <#if reqQualification==eachQualification.qualificationId>
               <option value="${reqQualification}" selected>${eachQualification.qualificationName}</option>
               </#if>
              <option value="${eachQualification.qualificationId}">${eachQualification.qualificationName}</option>
           </#list>
           </#if>
           </select> </td>
       </tr>
        <tr>
         <td><label for="password">Set Student Password</label></td>
         <td> <input type="text" id="password" name="password" value="${eachStudentDetailsById.password?if_exists}" required></td>
        <tr>
        <tr>
         <td></td>
         <td> <input type="submit" value="update-Student" id="addBtn" onclick ="addMoreStudents()" ></td>
        <tr>
     </table>
     </form>
     </#list>
   </#if>
    </section>

    
    <footer id="bottomFix">
        <p class="footer">&copy; All Rights Reserved 2024 <br>Bangarugallamahesh@gmail.com</p>
    </footer>

</body>
</html>