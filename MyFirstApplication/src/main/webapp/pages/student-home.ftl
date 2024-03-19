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
.div{
   width:40.99%;
   margin:20px 20px 20px 360px ;
   padding:30px;
   height:30%;
   border:2px solid green;
   border-radius:20px;
   text-align:center;
   background-color:#B752E0;
   color:white;
   font-weight:bold;
   font-size:20px;
}
a{
   text-decoration:none;
}

</style>
<body>
    <nav id="fixNav">
        <ul>
            <li><a href="/studentLogOut" id="logOut">Log-out</a></li>
            <li><a href="/studentProfile">Student Profile</a></li>
            <li><a href="#" id="currentPage">Students Home</a></li>
        </ul>
    </nav>
 <header>
        <h1>Students Home</h1>
    </header>
 <hr>  

<div>
<a href="/studentProfile">
  <div class="div">
   <p>Student Profile</p>
  </div>
</a>
</div>
<div>
<a href="/studentResults">
  <div class="div">
   <p>Student Results</p>
  </div>
</a>
</div>
<div>
<a href="#">
 <div class="div">
 <p>up comming</p> 
 </div>
</a>
</div>
<div> 
<a href="#">
  <div class="div">
 <p>up comming 2</p>
 </div>
</a>
</div>
   
    <footer id="bottomFix">
        <p class="footer" >&copy; All Rights Reserved 2024 <br>Bangarugallamahesh@gmail.com</p>
    </footer>

</body>
</html>