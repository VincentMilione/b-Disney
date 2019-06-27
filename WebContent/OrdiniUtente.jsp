<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="beans.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>Ordini effettuati</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="css/stile.css" type = "text/css">
  	<link rel="stylesheet" href="css/bootstrap.css" type = "text/css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  	
	
</head>
<body style="background-image: url('images/areg.gif');" data-spy="scroll" data-target=".navbar" data-offset="50">
<%@include file = "header2.jsp" %>
<%
	List<FatturaBean> lista= (List<FatturaBean>) request.getAttribute("fatture");
%>
<div class="field2">
	<div class="row ">
    	<div class="card x">
    	<div class="cart-list">
    	<h1>Ordini effettuati</h1>
      	<table class="table">
	     <thead class="thead-primary">
			<tr class="text-center">
				<th>&nbsp;</th>
				<th>Prodotti</th>
				<th>Prezzo</th>
				<th>Prezzo Iva</th>
				<th>Sconto</th>
				<th>Quantità</th>
			</tr>
			</thead>
		<tbody>
			<!--n ordini esistenti nel database-->
		 <%for (int i=0; i<lista.size()+1; i++) {
			 for(int j=0; j<lista.get(i).getProdotti().size()+1; j++){%> 
			<tr class="text-center">
				<td rowspan="<%=lista.get(i).getProdotti().size()%> " class="product-name">
				<button  class="button button2 submitter" type="submit">Fattura</button>
				</td>
				<td><%=lista.get(i).getProdotti().get(j).getProduct().getName()%></td>
				<td><%=lista.get(i).getProdotti().get(j).getProduct().getPriceSenzaIva()%></td>
				<td><%=lista.get(i).getProdotti().get(j).getProduct().getPricewithIva()%></td>
				<td><%=lista.get(i).getProdotti().get(j).getProduct().getDiscount()%></td>
				<td><%=lista.get(i).getProdotti().get(j).getQty()%></td>
			</tr><%} }%>
		</tbody>
			</table>
	
	</div>
 	
 	
</div>


<%@include file = "footer.jsp" %>
</body>
</html>