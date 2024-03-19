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
</style>
<body> 
    <nav>
        <ul>
            <li><a href="/admin">Admin</a></li>
            <li><a href="/student">Student</a></li>
             <li><a href="#" id="currentPage">Contact</a></li>
            <li><a href="/">Home</a></li>
        </ul>
    </nav>


 <header>
        <h1>Contact Information</h1>
    </header>
  <hr>  
    <section id="section1">
      <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d30300.4211733502!2d78.22482665000001!3d18.3220552!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1706642461223!5m2!1sen!2sin" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </section>
    
    <section id="section1">
        <h2>Section 1</h2>
        <p>This is the content of Section 1.</p>
    </section>

    <section id="section2">
        <h2>Section 2</h2>
        <p>This is the content of Section 2.</p>
    </section>

    <section id="section3">
        <h2>Section 3</h2>
        <p>This is the content of Section 3.</p>
    </section>

    <footer>
        <p class="footer">&copy; All Rights Reserved 2024 <br>Bangarugallamahesh@gmail.com</p>
    </footer>

</body>
</html>