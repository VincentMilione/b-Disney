<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/stile.css" type = "text/css">
  		<link rel="stylesheet" href="css/bootstrap.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 		<meta name="viewport" content="width=device-width, initial-scale=1">
 		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 		<!-- Acquista -->
 		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
		<title>Carrello</title>	
		
</head>
<body style="background-image: url('images/areg.gif');"  data-spy="scroll" data-target=".navbar" data-offset="50">
<%@include file = "header2.jsp" %><br><br><br>

<section class="card carrello">

<div class="leftcolumn"> <%@ include file = "cartContent.jsp"%></div>
<div class="rightcolumn"> <%@ include file = "Acquista.jsp" %> <hr>
      		<fieldset><a style = "text-align: center" href="Billing" class="chck">Checkout</a></fieldset>
</div>
 </section>
 
<%@include file = "footer2.jsp" %>
<script type="text/javascript">
$(document).ready(function () {
		//avvia richiesta per reperire lista prodotti 
		$.getJSON("myCart")
			//se funge
			.done (function (json) {
				$.each(json, function () {
					//costruisci il div per i prodotti
					var row = $('<tr class="text-center"></tr>');
					$("tbody").append(row);
					$(row).append('<td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>');
					$(row).append('<td class="image-prod"><div id="img" style = "background-image: url("this.img")"></div> </td>');
					$(row).append('<td class="product-name">this.name</td>');
					
				});
				
				$(".productCard a").wrap ('<h3 style = "font-size: 120%">');
				$(".productCard h3").wrap('<div class = "nomeProdSconto"></div>');
				$(".productCard img").wrap('<div class = "imgSconto"></div>');
				$(".productCard button").wrap("<p>")
			});
	
});
</script>
</body>
</html>
