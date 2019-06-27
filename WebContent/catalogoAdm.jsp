<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    	<link rel="stylesheet" href="css/stile.css" type = "text/css">
		<!--  <link rel="stylesheet" href="css/carrello.css" type = "text/css">-->
		<link rel="stylesheet" href="css/stilereg.css" type = "text/css">
		
 		<meta name="viewport" content="width=device-width, initial-scale=1">
 		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<script>
		$(document).ready(function(){
  		$(".button").click(function(){
  		  var column = $(this).parent();
		  var price = column.next().html();
		  var qty = price.next().html();
		  var sconto = qty.next().next().next().html();
		  var iva = sconto.next().html();

		  console.log(price);
		  console.log(qty);
		  console.log(sconto);
		  console.log(iva);
  		});
	});
		
		
</script>
<title>Catalogo</title>
</head>
<body>
<body style="background-image: url('images/areg.gif');" >
 
<!--Tutti i prodotti nel catalogo-->
<section class="ftco-section ftco-cart">
	<div class="row ">
    	<div class="card x">
    	<div class="cart-list">
    	<h1>Catalogo</h1>
  <!--   	<form action="servletProdotto.java" method="post"> --> 
	    	<table class="table">
	     <thead class="thead-primary">
			<tr class="text-center">
				<th>&nbsp;</th>
				
		     		<th>Prezzo</th>
				<th>Quantit・/th>
				<th>Personaggio</th>
				<th>Categoria</th>
				<th>Sconto</th>
				<th>Iva</th>
				
			</tr>
			</thead>
		<tbody>
			<!--n prodotti esistenti nel database-->
		 <%for (int i=0; i<10; i++) { %> 
			<tr class="text-center">
				<td class="product-name">
		<!--inserire codice e nome prodotto e descrizione-->
		
		<!-- in value metteremo i codici prodotti, tutti diversi e cosi identifichiamo il prodotto -->
			<h4>codiceProdotto/ nome </h4>
			<p>Breve descrizione prodotto</p>
			<button  class="button button2 submitter" type="submit">Modifica</button>
				</td>
				<td>$prezzo</td>
		<td >quantit・</td>
		<td >personaggio</td>
		<td >categoria</td>
		<td >sconto</td>
		<td >iva</td>
			</tr><%} %>
		</tbody>
			</table>
		
			<fieldset>
			<button  class="button button2 submitter" type="submit">Aggiorna</button>
			<a href= "amministratore.jsp"> Indietro</a>
			</fieldset>
		<!--  		</form>-->
	</div>
 </section>


</body>
</html>