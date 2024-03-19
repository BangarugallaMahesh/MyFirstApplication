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
#section1{
   margin:10px 250px 100px 250px;
   padding:60px;
   text-align:center;
   border:2px solid gray;
   border-radius:20px;
   background-color:#eee;
}
span{
 color:red;
 position:absolute;
 marign-left:30px;
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
            <li><a href="/admin">Admin</a></li>
            <li><a href="#" id="currentPage">Student</a></li>
             <li><a href="/contact">Contact</a></li>
            <li><a href="/">Home</a></li>
        </ul>
    </nav>


 <header>
        <h1>Student Login Here</h1>
    </header>
    <hr>
    <#if _SUCCESS_MESSAGE_?has_content>
     <p id="successMsg">${_SUCCESS_MESSAGE_?if_exists}</p>
     <#else>
     <p id="errorMsg">${_ERROR_MESSAGE_?if_exists}</p>
    </#if>
    <section id="section1">
       <form action="studentHome">
        <div>
        <label for="studentId">Student Id:</label>
        <input type="text" id="studentId" name="studentId" placeholder="Enter Your Student Id" onkeyup="allowCaps()">
       
       <#if listOfErrors??>
       <#list listOfErrors as eachListOfErrors>
       <#if eachListOfErrors.defaultMessage=="Please Enter StudentId">
        <span> * ${eachListOfErrors.defaultMessage }</span>
        </#if>
       </#list>
       </#if>
      </div><br><br>
       <div>
        <label for="sutudentName">Student Name:</label>
        <input type="text" id="studentName" name="studentName" placeholder="Enter Your Student Name">
       
       <#if listOfErrors??>
       <#list listOfErrors as eachListOfErrors>
       <#if eachListOfErrors.defaultMessage=="Please Enter Student Name">
        <span> * ${eachListOfErrors.defaultMessage }</span>
        </#if>
       </#list>
       </#if>
      </div><br><br>
       <div> 
         <label for="password">Password  :</label>
        <input type="password" id="password" name="password" placeholder="Enter Your Password">
       
       <#if listOfErrors??>
       <#list listOfErrors as eachListOfErrors>
       <#if eachListOfErrors.defaultMessage=="Please Enter Student Password">
        <span> * ${eachListOfErrors.defaultMessage }</span>
        </#if>
       </#list>
       </#if>
       </div><br><br>
        <div> 
        <input type="submit" value="Login">
       </div>
       </form>
    </section>

    <footer>
        <p class="footer">&copy; All Rights Reserved 2024 <br>Bangarugallamahesh@gmail.com</p>
    </footer>

</body>
</html>