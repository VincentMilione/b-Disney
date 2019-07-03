<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="beans.*"%>
 <% Boolean user= (Boolean)session.getAttribute("isUser");
if(user == null ? true : !user.booleanValue()) {
	response.sendRedirect(response.encodeURL("Login.jsp"));
	return;
}
%>
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
	List<FatturaBean> lista= (List<FatturaBean>) session.getAttribute("fatture");
 	System.out.println(lista);
 	if (lista == null) return;
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
				<th>Recenzione</th>
				<th>Prodotto</th>
				<th>nome Prodotto</th>
				<th>Prezzo</th>
				<th>Prezzo Iva</th>
				<th>Sconto</th>
				<th>Quantità</th>
			</tr>
			</thead>
		<tbody>
			<!--n ordini esistenti nel database-->
		 <%for (FatturaBean fatt : lista) {
			 int size = fatt.size();
			 java.util.List<Order> orders = fatt.getProdotti();
			 %> 
			<tr class="text-center">
				<td rowspan="<%=size%> " class="product-name">
				<button  class="button button2 submitter" type="submit">Fattura</button>
				</td>
				<%
				for(Order o : orders){
				 	ProductBean bean = o.getProduct();
				%>
				<td><a  class="button button2" href="ProductControl?id=<%=bean.getCode()%>&act=view">Aggiungi</a></div>
				<td><div id="img" style="background-image: url('<%=bean.getPhoto()%>');"></div></td>
				<td><%=bean.getName()%></td>
				<td><%=bean.getPriceSenzaIva()%></td>
				<td><%=bean.getPricewithIva()%></td>
				<td><%=bean.getDiscount()%></td>
				<td><%=o.getQty()%></td>
			</tr><%} }%>
		</tbody>
			</table>
	
	</div>
 	</div>
 	</div>
</div>


<%@include file = "footer.jsp" %>
</body>
</html>