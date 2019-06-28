<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%@ page import = "beans.*, java.util.Collection" %>
   <%@page import="beans.*"%>
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
 <%
	java.util.List<FatturaBean> lista= (java.util.List<FatturaBean>) session.getAttribute("fatture");
 %>
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
				
				<th>Utente </th>
		     	<th>Prodotto</th>
				<th>nome Prodotto</th>
				<th>Prezzo</th>
				<th>Prezzo Iva</th>
				<th>Sconto</th>
				<th>Quantità</th>
				<th>Data</th>
			</tr>
			</thead>
		<tbody>
			<!--n fatture esistenti nel database-->
		 <%for (FatturaBean fatt : lista) {
			 int size = fatt.size();
			 java.util.List<Order> orders = fatt.getProdotti();
			 %> 
			 <tr class="text-center">
				<td rowspan="<%=size%> " class="product-name">
				    <button  class="button button2 submitter" type="submit">Fattura</button>
				</td>
		<!--inserire nome prodotto e descrizione-->
				<th>Utente </th>
		     	<th>Prodotto</th>
				<th>nome Prodotto</th>
				<th>Prezzo</th>
				<th>Prezzo Iva</th>
				<th>Sconto</th>
				<th>Quantità</th>
				<th>Data</th>
			</tr><%} %>
		</tbody>
			</table>
			<a class="button button2"  href= "amministratore.jsp"> Indietro</a>
	</div>
	</div>
	</div>
 </section>

</body>
</html>