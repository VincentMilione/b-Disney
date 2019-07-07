<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Registration</title>
		<link rel="stylesheet" href="css/bootstrap.css">
 	<link rel="stylesheet" href="css/stile.css" type = "text/css">
 	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="css/bootstrap.css" type = "text/css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  		
</head>

<body style="background-image: url('images/areg.gif');" data-spy="scroll" data-target=".navbar" data-offset="50">
<%@include file = "header2.jsp" %><br>

<form class = "validation" id = "val" action = "Registration" method = "POST">
	<div class="field">
	<%
	Boolean error = (Boolean) request.getAttribute("error");
	if(error == null ? false : error.booleanValue()) {
		%>	
		<div class="error">
		<p>Warning<br>
			username già esistenti
		</p>
		</div>
	<%}%>
	<h1 class="h1disney"> Account Disney </h1>
	<h2 class="h2disney"> Non sei ancora iscritto? Registrati e potrai ricevere tutti gli aggiornamenti sui nuovi prodotti e offerte esclusive.</h2>
	
   <input type="text"  class="myInput1"  id = "name" size="20" name = "name" placeholder="Nome">
   <div id= "nameWarning" class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> <strong>Errore!</strong> Il valore non è un nome</div>

   <input type="text"  class="myInput1"  id = "surname" size="20" name = "surname" placeholder="Cognome">
   <div id= "surnameWarning" class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> <strong>Errore!</strong> Il valore non è un cognome</div>

   <input type="text"  class="myInput1"  id = "email" size="20" name = "email" placeholder="Email" autocomplete="off">
   <div id= "emailWarning" class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> <strong>Errore!</strong> email non valida</div>
   
   <input type="password"  class="myInput1"  id = "password" size="20" name = "password" placeholder="Password tra i 5 e i 10 caratteri" autocomplete="off">
   <div id= "passwordWarning" class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> <strong>Errore!</strong>la password deve essere almeno da 8 caratteri </div>
  
    <br> 
      <button class="button button2 submitter" type = "submit" >Crea Account</button> 
       <a href= "Login.jsp"> Sono registrato</a>
  </div>
 	
</form>

<script type = "text/javascript" src = "js/validation.js"></script>


 <%@include file = "footer.jsp" %>
 
</body>
</html>