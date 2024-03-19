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
<script>
function allowCaps(){
 document.getElementById("studentId").addEventListener("input", function() {
            // Convert any lowercase characters to uppercase
            this.value = this.value.toUpperCase();
        });
}
</script>
<body>
    <nav>
        <ul>
            <li><a href="/adminLogOut" id="logOut">Log-out</a></li>
            <li><a href="/addStudentResutls">Add Student Result</a></li>
            <li><a href="#" id="currentPage">Add Student</a></li>
            <li><a href="/adminHome">Students List</a></li>
        </ul>
    </nav>


   <header id="section1">
        <h1>Add Student</h1>
    </header>
    <hr>
    <section id="section1">
    <form action="processStudentDetails" method="post">
     <table>
       <tr> 
         <td> <label for="studentName">Student Name   </label></td>
         <td> <input type="text" id="studentName" name="studentName" placeholder="Enter Student Name" required></td>
      </tr>
       
       <tr>  
         <td> <label for="studentName">Student Id  </label></td>
         <td> <input type="text" id="studentId" name="studentId" placeholder="Enter Student Id" onkeyup="allowCaps()" required></td>
       </tr> 
      
        <tr>
         <td> <label for="studentName">Registration Qualification </label></td>
         <td>  <select name="regQualification" required>
           <option name="">--select options--</option>
           <#if studentQualificationList?has_content>
           <#list studentQualificationList as eachQualification>
              <option value="${eachQualification.qualificationId}">${eachQualification.qualificationName}</option>
           </#list>
           </#if>
           </select> </td>
       </tr>
        <tr>
         <td><label for="password">Set Student Password</label></td>
         <td> <input type="text" id="password" name="password" placeholder="Enter Student Temp Password" required></td>
        <tr>
        <tr>
         <td></td>
         <td> <input type="submit" value="Add-Student" id="addBtn" onclick ="addMoreStudents()" ></td>
        <tr>
     </table>
     </form>
   
    </section>

    
    <footer id="bottomFix">
        <p class="footer">&copy; All Rights Reserved 2024 <br>Bangarugallamahesh@gmail.com</p>
    </footer>

</body>
</html>