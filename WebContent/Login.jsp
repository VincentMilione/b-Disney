<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="css/bootstrap.css">
 	<link rel="stylesheet" href="css/stile.css" type = "text/css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<title>Login</title>


</head>
<body style="background-image: url('images/areg.gif');" data-spy="scroll" data-target=".navbar" data-offset="50">
	<%@include file = "header2.jsp" %><br><br>
	<form action="Login" method="post">
	<fieldset>
		<h1> Account Disney </h1>
	<h2>Accedi</h2>
	
	<p><label for="username"> <input id="username" type="email" size="30" name = "username" placeholder="Email" autocomplete="off"></label><br></p>
    <p>	<label for="password"><input id="password" type="password" size="30" name = "password" placeholder="Password tra i 5 e i 10 caratteri" autocomplete="off"></label><br></p>
  		<button class="button button2" type = "submit" >Accedi</button>
  		<button class="button button2" type = "reset">Reset</button><br><br>
	Non sei ancora registrato? &nbsp &nbsp<a href= "registration.jsp"> Registrati ora</a>
	</fieldset>
	</form>
<%@include file = "footer2.jsp" %>
</body>
</html>