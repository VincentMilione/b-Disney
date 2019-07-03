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
<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/stile.css" type = "text/css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
 		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
				<th>&nbsp;</th>
		     	<th>Prezzo</th>
				<th>Quantit&#224;</th>
				<th>Personaggio</th>
				<th>Categoria</th>
				<th>Sconto</th>
				<th>Iva</th>
				
			</tr>
			</thead>
		<tbody>
			<!--n prodotti esistenti nel database-->
	<%for (int i=0; i<10; i++) { %> 
		<tr id = "" class="text-center">
				<td class="product-remove"><button class="removeX" style="background-image: url('images/x.png')"></button>
				<td class="product-name">
					<h4>codiceProdotto:<span></span></h4>
					<p>Breve descrizione prodotto</p>
					<button  class="button button2 submitter" type="submit">Modifica</button>
				</td>
				<td role = "price"><%=new java.util.Random().nextDouble() %></td>
				<td role = "qty">quantit・</td>
				<td role = "character">personaggio</td>
				<td role = "category">categoria</td>
				<td role = "discount">sconto</td>
				<td role = "iva">iva</td>
			</tr><%} %>
		</tbody>
			</table>
		
			<fieldset>
			<button  class="button button2 submitter" type="submit">Aggiorna</button>
			<a href= "amministratore.jsp"> Indietro</a>
			</fieldset>
		</div>
		</div>
	</div>
 </section>
	<script>
		$(document).ready(function(){
		var i = 0;
		
		function isEmpty(a) {
			return a == null || a==NaN || a=="";
		}
		
		$(".removeX").click (function () {
			var row = $(this).parents().filter("tr");
			var code = $(row).attr("id");
			
			$.post("ProductAdminControl", {act: "delete", id : code})
				.done(function () {
					$(row).remove();
				})
				.fail(function () {
					alert("Non è stato possibile rimuovere il prodotto");
				})
		})
		
  		$(".button").click(function prova (){
  		  i++;
  		  var up = "update"+ i;
  		  var row = $(this).parent().parent().addClass(up);
		  var price = $("."+up+' [role="price"]').html();
		  var qty = $("."+up+' [role="qty"]').html();
		  var sconto = $("."+up+' [role="discount"]').html();
		  var iva = $("."+up+' [role="iva"]').html();

		  $("."+up+' [role="price"]').html('<input type "number" size = "4">');
		  $("."+up+' [role="qty"]').html('<input type "number" size = "4">');
		  $("."+up+' [role="discount"]').html('<input type "number" size = "4">');
		  $("."+up+' [role="iva"]').html('<input type "number" size = "4">');
		  var button = $("."+up+' .button');
		  $(button).html('Update');
		  $(button).unbind();
		  $(button).click(function () {
			  
			  var code = $(this).parents().filter("tr").attr("id");
			  var newPrice = $("."+up+' [role="price"]').val();
			  var newQty = $("."+up+' [role="qty"]').val();
			  var newSconto = $("."+up+' [role="discount"]').val();
			  var newIva = $("."+up+' [role="iva"]').val();
			  
			  console.log(newPrice);
			  $(button).unbind();
			  
			  if (isEmpty(newPrice) || isEmpty(newQty) || isEmpty(newSconto) || isEmpty(newIva)) {
				    alert ("Uno dei campi di input non e' stato riempito");
				  
				  	$("."+up+' [role="price"]').html(price);
					$("."+up+' [role="qty"]').html(qty);
					$("."+up+' [role="discount"]').html(sconto);
					$("."+up+' [role="iva"]').html(iva);   
					
			  }
			  else {
				  $.post ("ProductAdminControl", {act: "modify" ,code : code, iva: newIva, price: newPrice, qty: newQty, discount: newDiscount})
				  	.done(function () {
				  		  $("."+up+' [role="price"]').html(newPrice);
						  $("."+up+' [role="qty"]').html(newQty);
						  $("."+up+' [role="discount"]').html(newSconto);
						  $("."+up+' [role="iva"]').next().html(newIva);
						 
				  	})
				  	.fail (function () {
				  		alert("Modifica fallita!");
				  		
				  		$("."+up+' [role="price"]').html(price);
						$("."+up+' [role="qty"]').html(qty);
						$("."+up+' [role="discount"]').html(sconto);
						$("."+up+' [role="iva"]').html(iva);
				  	})
				  	.always (function () {
				  		  $(button).html('Modifica');
						  $(button).click(prova);
						  $('tbody '+"."+ up).removeClass(up);
						  if($("input").length == 0)
							  i = 0;
				  	})
				 
			  }
		  });
  		});
	});
		
		
</script>

</body>
</html>