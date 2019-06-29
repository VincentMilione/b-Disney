<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%@ page import = "beans.*, java.util.Collection" %>
   <%@page import="beans.*"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    	<link rel="stylesheet" href="css/stile.css" type = "text/css">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 		<style type="text/css">
		

</style>
		
<title>Ordini</title>
</head>
<body style="background-image: url('images/areg.gif');"  data-spy="scroll" data-target=".navbar" data-offset="50">
 <%
	java.util.List<FatturaBean> lista= (java.util.List<FatturaBean>) request.getAttribute("fatture");
 	java.text.SimpleDateFormat format = new java.text.SimpleDateFormat ("yyyy-MM-dd");
 %>
<!--Attenzione chiedere se bisogna inserire anche tutti i dati della fattura-->
<section class="ftco-section ftco-cart">
	<div class="row ">
		<div class="card y x">
    <form>
 	 	<input type="text" class="ricerca ricerca1" name="search" placeholder="Utente..." style="background-image: url('images/lenteUser.png')"><br><br>
 	  	<input type="date" class="ricerca"  name="search2" placeholder="da data...">
 	 	<input type="date" class="ricerca" name="search3" placeholder="a data..."> 
	</form>
	
    	<div class="cart-list">
    	<h1>Ordini clienti</h1>
	    	<table class="table">
		 <thead class="thead-primary">
			<tr class="text-center">
				<th>&nbsp;</th>
				<th>Utente </th>
				<th>Data</th>
		     	<th>Prodotto</th>
				<th>nome Prodotto</th>
				<th>Prezzo</th>
				<th>Prezzo Iva</th>
				<th>Sconto</th>
				<th>Quantità</th>
				
			</tr>
			</thead>
		<tbody>
			<!--n fatture esistenti nel database-->
		 <%
		 lista = lista == null ? new java.util.ArrayList<FatturaBean> () : lista;
		 for (FatturaBean fatt : lista) {
			 int size = fatt.size();
			 java.util.List<Order> orders = fatt.getProdotti();
			 %> 
			 <tr class="text-center">
				<td rowspan="<%=size%> " class="product-name">
				    <button  class="button button2 submitter" type="submit">Fattura</button>
				</td>
				<td rowspan="<%=size%> "><%=fatt.getUser().getLogin()%></td>
				<td rowspan="<%=size%> "><%=format.format(fatt.getDate().getTime()) %></td>
		     	
			<%
				for(Order o : orders){
				 	ProductBean bean = o.getProduct();
			%>
				<td><div id="img" style="background-image: url('<%=bean.getPhoto()%>');"></div></td>
				<td><%=bean.getName()%></td>
				<td><%=bean.getPriceSenzaIva()%></td>
				<td><%=bean.getPricewithIva()%></td>
				<td><%=bean.getDiscount()%></td>
				<td><%=o.getQty()%></td>
				
			</tr><%}} %>
		</tbody>
			</table>
			<a class="button button2"  href= "amministratore.jsp"> Indietro</a>
	</div>
	</div>
	</div>
 </section>

</body>
</html>