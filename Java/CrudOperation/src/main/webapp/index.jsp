<%@page import="java.sql.*" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <title>Crud Operation</title>
    <style>
    #home{
    	height:500px;
    	width:80%
    }
    </style>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <!-- 	 <a class="navbar-brand" href="#">Navbar</a>-->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Register</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Cancel</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About</a>
      </li>
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>


	 <div class="container-fluid d-flex justify-content-center" id="home">
	 
	 <div style="width:50%;margin-top:5%">
	 	
	 
	 <h1><center>Employee Details</center></h1>
	 <%
	 try{
		 Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","1234");
		 Statement st2=con.createStatement();
			ResultSet result=st2.executeQuery("Select * from user192");
			%>
			<table class="table table-striped">
			<tr>
				<th>Id</th><th>Name</th><th>Password</th><th>Email</th><th>Country</th><th>Edit</th><th>Delete</th>
			</tr>
			
			<%
			while(result.next())
			{%>
			
			<tr>
				<td ><% out.print(result.getInt(1)); %></td>
				<td ><% out.print(result.getString(2)); %> </td>
				<td><% out.print(result.getString(3)); %></td>
				<td ><% out.print(result.getString(4));%></td>
				<td ><% out.print(result.getString(5));%></td>
				<td>
					<a href='EditServlet?id="+<% result.getInt(1); %>+"'><button class="btn btn-success">Update</button></a>
				</td>
				<td><a href='DeleteServlet?id="+<%result.getInt(1); %>+"'><button class="btn btn-danger">Delete</button></a></td>
				</tr>
			<%
			}%>
			
			</table>
			</form>
			<form action="SaveServlet" method="post">
				  <div class="row">
				    <div class="col">
				      <input type="text" class="form-control" name="name" placeholder="Name">
				    </div>
				    <div class="col">
				      <input type="text" class="form-control" name="password" placeholder="Password">
				    </div>
				    <div class="col">
				      <input type="text" class="form-control" name="email" placeholder="Email">
				    </div>
				    <div class="col">
				      <input type="text" class="form-control" name="country" placeholder="Country">
				    </div>
				    <div class="col">
				      <input style="width:130px" type="submit" value="Add" class="btn btn-primary">
				    </div>
				  </div>
			</form>
			<%
	 }
	 catch(Exception e)
	 {
		 System.out.println(e);
	 }
	 
	 
	 %>
	 	
	 </div>
	 
	 </div>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    -->
  </body>
</html>