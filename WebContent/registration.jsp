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

		<form action = "Registration" method = "POST" onsubmit = "return validation()">
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
	
   <label class = "casella"> <input type="text" id = "name" size="20" name = "name" placeholder="Nome" onfocus = "focuser(this.form.name)" onblur = "blurer(this.form.name)"></label><br>
   <p id = "nameWarning" class = "casella"></p>
   <label class = "casella"> <input type="text" id = "surname" size="20" name = "surname" placeholder="Cognome" onfocus = "focuser(this.form.surname)" onblur = "blurer(this.form.surname)"></label><br>
   <p id = "surnameWarning" class = "casella"></p>
   <label class = "casella"> <input type="text" id = "email" size="20" name = "email" placeholder="Email" autocomplete="off" onfocus = "focuser(this.form.email)" onblur = "blurer(this.form.email)"></label><br>
   <p id = "emailWarning" class = "casella"></p>
   <label class = "casella"> <input type="password" id = "password" size="20" name = "password" placeholder="Password tra i 5 e i 10 caratteri" autocomplete="off" onfocus = "focuser(this.form.password)" onblur = "blurer(this.form.password)"></label><br>
   <p id = "passwordWarning" class = "casella"></p>	
 
    <br> 
      <button class="button button2 submitter" type = "submit" >Crea Account</button> 
       <a href= "Login.jsp"> Sono registrato</a>
  </div>
 	
</form>
<script>
$(document).ready(function() {
    $.getScript("js/validation.js");
    
    function validation () {
    	var list = new Array (4);
    	var flag = true;
    	
    	list[0] = new Validator ($("name"), /^[A-Z][a-zA-Z][^#&<>\"~;$^%{}?]{1,20}$/, 
    			$("nameWarning"), "there shouldn't be any numbers or special characters");
    	list[1] = new Validator ($("surname"), /^[A-Z][a-zA-Z][^#&<>\"~;$^%{}?]{1,20}$/, 
    			$("surnameWarning"), "there shouldn't be any numbers or special characters");
    	list[2] = new Validator ($("email"), /^[a-zA-Z0-9.!#$%&â€™*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/, 
    			$("emailWarning"), "the inserted value is not an email");
    	list[3] = new Validator ($("password"), /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]{8,})$/,
    			$("passwordWarning"), "the password is too short or weak");
    	
    	
    	for (var i = 0; i < 4 ; i++)
    	{
    		if (!list[i]["verifier"]())
    			flag = false;
    	}
    	
    	return flag;
    }
});
</script>

 <%@include file = "footer.jsp" %>
 
</body>
</html>