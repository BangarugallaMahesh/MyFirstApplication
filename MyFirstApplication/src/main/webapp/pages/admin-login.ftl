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
</style>
<body>
    <nav>
        <ul>
            <li><a href="#" id="currentPage">Admin</a></li>
            <li><a href="/student">Student</a></li>
             <li><a href="/contact">Contact</a></li>
            <li><a href="/">Home</a></li>
        </ul>
    </nav>


 <header>
        <h1>Admin Login Here</h1>
    </header>
 <hr>   
    <section id="section1">
       <form action="adminHome">
       <div>
        <label for="userName">User Name:</label>
        <input type="text" id="userName" name="userName" placeholder="Enter Your User Name">
       
       <#if listOfErrors??>
       <#list listOfErrors as eachListOfErrors>
       <#if eachListOfErrors.defaultMessage=="Please Enter User Name">
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
       <#if eachListOfErrors.defaultMessage=="Please Enter Password">
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