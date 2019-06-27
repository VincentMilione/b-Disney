<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%@ page import = "beans.*, java.util.Collection" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    	<link rel="stylesheet" href="css/stile.css" type = "text/css">
		<!--  <link rel="stylesheet" href="css/carrello.css" type = "text/css">-->
 		<meta name="viewport" content="width=device-width, initial-scale=1">
 		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<style type="text/css">
		 a:link,  a:visited {
 			 background-color: #1E90FF;
 			 color: white;
  			 padding: 15px 20px;
  			text-align: center;
  			text-decoration: none;
  			display: inline-block;
			}

		 a:hover, a:active {
  			background-color: blue;
			}</style>
<title>Ordini</title>
</head>
<body style="background-image: url('images/areg.gif');"  data-spy="scroll" data-target=".navbar" data-offset="50">
 
<!--Attenzione chiedere se bisogna inserire anche tutti i dati della fattura-->
<section class="ftco-section ftco-cart">
	<div class="row ">
    	<div class="card">
    	<div class="cart-list">
    	<h1>Ordini clienti</h1>
	    	<table class="table">
		 <thead class="thead-primary">
			<tr class="text-center">
				<th>&nbsp;</th>
				
		     	<th>Prezzo</th>
				<th>Quantità</th>
				<th>Sconto</th>
				<th>Iva</th>
			</tr>
			</thead>
		<tbody>
			<!--n fatture esistenti nel database-->
		 <%for (int i=0; i<3; i++) { %> 
			<tr class="text-center">
				<td class="product-name">
		<!--inserire nome prodotto e descrizione-->
			<h3>cod.fattura</h3>
			<p>code, name</p>
				</td>
				<td class="price">$prezzo</td>
		<td >quantità</td>
		<td >sconto</td>
		<td >iva</td>
			</tr><%} %>
		</tbody>
			</table>
			<a href= "amministratore.jsp"> Indietro</a>
	</div>
	</div>
	</div>
 </section>

</body>
</html>