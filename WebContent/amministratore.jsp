<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% Boolean admin= (Boolean)session.getAttribute("isAdmin");
if(admin == null ? true : !admin.booleanValue()) {
	response.sendRedirect(response.encodeURL("Login.jsp"));
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<!--  <link rel="stylesheet" href="css/stilereg.css" type = "text/css">-->
<link rel="stylesheet" href="css/stile.css" type = "text/css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bentornato</title>
</head>
<body  style="background-image: url('images/areg.gif');">

<form action="Aggiunta" method="post">
	<fieldset>
	<center><img  src="images/admin.jpg"> </center>
		<h1> Bentornato admin </h1>
	<h2>Cosa desideri effettuare?</h2>
	<a href="admin">Visualizzare ordini dei clienti</a><br><br>
	<a href="catalogoAdm.jsp">Revisionare il catalogo</a><br><br>
	<a href="Logout">Logout</a><br>	
	
	
	</fieldset>
	</form>

</body>
</html>