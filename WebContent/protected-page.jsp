<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="beans.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="css/stile.css" type = "text/css">
  	<link rel="stylesheet" href="css/bootstrap.css" type = "text/css">
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  	<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
.alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
}
.alert.success {background-color: #4CAF50;}
.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
</style>
<title>Protected page</title>
</head>
<body  style="background-image: url('images/areg.gif');" data-spy="scroll" data-target=".navbar" data-offset="50">
 <%@include file = "header2.jsp" %><br>
<div class="field2">
	<h3>Dati Personali </h3>
 	<label  class="myLabel" for="fname"><i class="fa fa-user"></i> Nome</label>
    <input type="text" id="fnome" name="firstname" value="${user.name}" placeholder="${user.name}" >
    <label  class="myLabel" for="fname"><i class="fa fa-user"></i> Cognome</label>
    <input type="text" id="fcognome" name="firstname" value="${user.cognome}" placeholder="${user.cognome}" >
    <button id="but1" class=" button button2">Modifica</button>
     <hr>
    <h3>Credenziali</h3>
    <i class="fa fa-envelope"></i> Email: ${user.login}<br><br>
	<label  class="myLabel" for="fname"><i class="fa fa-lock"></i> Password</label>
    <input type="text" id="fname" name="firstname">
    <label  class="myLabel" for="fname"><i class="fa fa-lock"></i> Nuova Password</label>
    <input type="text" id="fname" name="firstname">
    <button id="but2" class="but2 button button2">Modifica Password</button>	
 	
 	
</div>
<%@include file = "footer.jsp" %>
<script>
$(document).ready(function() {
	$("#but1").click(function () {
		var nome = $("#fnome").val();
		var cognome = $("#fcognome").val();
		
		$.post("UserManager", {operation: "1", nome: nome, cognome: cognome}, "html")
		.done(function(data){
			var string = "<div class="alert success"><span class="closebtn">&times;</span><strong>Successo!</strong> Nome e/o Cognome aggiornati correttamente</div>";
			$("#but1").append(string);
		})
		.fail(function() {
			var string = "<div class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
		  	<strong>Errore!</strong> Errore durante l aggiornamento</div>";
			$("#but1").append(string);
		
		});
	});
	
	$("#but2").click(function () {
		var pw = $("#fnome").val();
		
		$.post("UserManager", {operation: "1", nome: pw}, "html")
		.done(function(data){
			var string = "<div class="alert success"><span class="closebtn">&times;</span><strong>Successo!</strong> Password aggiornata correttamente</div>";
			$("#but2").append(string);
		})
		.fail(function() {
			var string = "<div class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
		  	<strong>Errore!</strong> Errore durante l aggiornamento</div>";
			$("#but2").append(string);
		
		});
	});
	
	
});
</script>

</body>
</html>