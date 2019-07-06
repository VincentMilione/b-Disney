<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "beans.ProductBean" %>
<%@ page import = "java.util.List,java.util.ArrayList, beans.ProductBean,beans.RecenzioneBean, java.util.Random"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/stile.css" type = "text/css">
  	<link rel="stylesheet" href="css/bootstrap.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>	
  	<!-- per voto -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  	
  	<title>${product.getName()}</title>
</head>
<body style="background-image: url('images/areg.gif');" data-spy="scroll" data-target=".navbar" data-offset="50">
<%@include file = "header2.jsp" %>
<section class="card"  style="padding-bottom:90px;">
	<div style="float:left; padding:20px " >
     	<%@include file = "zoom.jsp" %>	
  	</div>
  	<div class="capo">
   		<h1>${product.getName()} <%@include file = "Voto.jsp" %></h1>
   		<br>
    	<h3 class="price"><span>${product.getPricewithIva()} &#8364</span></h3>
    	<p>La quantit&#224 disponibile in magazzino &#232 ${product.getQty()}</p>
    	<p>${product.getDescription()}</p>
    			
		<form method = "post" action="ProductControl?id=${product.code}&act=addC">
 		<label  class="myLabel" for="fname">Quantit&#224 desiderata</label>
   		<input id="inputN" type="number" name="qty" value = "1" min="1" max="${product.getQty()}">
  			<br><button  type = "submit" class="button button2" >Acquista</button>
  			<a href="Catalogo.jsp" class="button button2">Indietro</a>
  		</form>
		</div><br>
</section>
<section>
	<%@include file = "contentJSP/recenzione.jsp" %>
</section>
<!-- pripend -->
<%@include file = "footer.jsp" %>

</body>
</html>