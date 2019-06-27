<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<!--  <link rel="stylesheet" href="css/stilereg.css" type = "text/css">-->
	<link rel="stylesheet" href="css/stile.css" type = "text/css">
	<script type = "text/javascript" src = "js/jquery.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<style type="text/css">
	footer {
   			position:absolute;
  			bottom:0;
   			width:98%;
   			height:60px;   /* Height of the footer 
		}
	</style>
</head>

<body  style="background-image: url('img/areg.gif');" data-spy="scroll" data-target=".navbar" data-offset="50">
	<%@include file = "header2.jsp" %><br><br>
	<fieldset id="errore">
		<h1> Errore </h1>
	<h2>Si è verificato un errore durante all'accesso...</h2>
	<a href= "registration.jsp"> Registrati ora</a>
	<a href= "Login.jsp"> Riprova</a>		
	</fieldset>
<footer>
	 <%@include file = "footer.jsp" %>
 </footer>
</body>
</html>