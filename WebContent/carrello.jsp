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

<div class="leftcolumn"></div>
<div class="rightcolumn"> <%@ include file = "Acquista.jsp" %> <hr>
      		<fieldset><a style = "text-align: center" href="Billing" class="chck">Checkout</a></fieldset>
</div>
 </section>
 
<%@include file = "footer2.jsp" %>
<script type="text/javascript">
$(document).ready(function () {
		//avvia richiesta per reperire lista prodotti 
		$.get("myCart")
			//se funge
			.done (function (data) {
				$(".leftcolumn").append(data);
				
				$('.quantity input[type = "number"]').focus (function focuser () {
					var oldQty = this.value;
					$(this).unbind();
					$(this).blur(function () {
						var row = $(this).parents().filter("tr");
						var qty = this.value;
						var id = $(row).attr("id");
						
						$.get("ProductControl", {id : id, act : "addC", qty : qty})
							.done (function (json) {
								console.log(json);
								var t= 0;
								var flag = false;
								for(i=0;i<json.size && !flag;i++){
									if(json.list[i].order.id==id){
										t = json.list[i].totOrdine;
										flag = true;
									}
								}
								$("#"+id +' .total').html(t);
								ordini(json);
							})
							.fail (function () {
								//ancora in cantiere
								var o = $("#"+$(row).attr("id")+' .quantity input[type = "number"]');
								$(o).val(oldQty);
							})
							.always(function () {
								var o = $("#"+$(row).attr("id")+' .quantity input[type = "number"]');
								$(o).unbind();
								$(o).focus(focuser);
							});
					});
				});

				
				$(".removeX").click(function () {
					
					var row = $(this).parents().filter("tr");
					$.get("ProductControl", {id : $(row).attr("id"), act : "delete" }) 
						.done(function(json){
							$(row).remove();
							ordini(json);
						});
				});
				
				function ordini(json)
				{ 
					$("#Iva span").html(json.totIva);
					$("#noIva span").html(json.noIva);
					$("#tot span").html(json.tot);
					$("#size b").html(json.size);
				}
			});
		
		
		
});
</script>
</body>
</html>
