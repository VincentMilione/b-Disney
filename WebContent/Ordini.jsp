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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    	<link rel="stylesheet" href="css/stile.css" type = "text/css">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 		<style type="text/css">
		
<style>
.Mydropbtn {
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.Mydropbtn:hover, .Mydropbtn:focus {
  background-color: write;/* #2980B9;*/
}

.Mydropdown {
  position: relative;
  display: inline-block;
}

.Mydropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
 /* min-width: 30%;*/
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.Mydropdown-content p {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.Mydropdown-content p:hover {background-color: #ddd;}

.show {display: block;}
        </style>
		
<title>Ordini</title>
</head>
<body style="background-image: url('images/areg.gif');"  data-spy="scroll" data-target=".navbar" data-offset="50">
 <%
	java.util.List<FatturaBean> lista= (java.util.List<FatturaBean>) request.getAttribute("fatture");
 	java.text.SimpleDateFormat format = new java.text.SimpleDateFormat ("yyyy-MM-dd");
 	lista = lista == null ? new java.util.ArrayList<FatturaBean> () : lista;
 %>
<!--Attenzione chiedere se bisogna inserire anche tutti i dati della fattura-->
<section class="ftco-section ftco-cart">
	<div class="row ">
		<div class="card y x">
    <form>
    <div class="dropdown">
     <input type="text"  id="mySearch" class="ricerca ricerca1 Mydropbtn" name="search" placeholder="Utente..." style="background-image: url('images/lenteUser1.png')"  ><br>
     <div id="myDropdown" class="Mydropdown-content">
    	 
     </div>
   </div>
 	 		
        <input type="date" class="ricerca"  name="da" placeholder="da data..." style="background-image: url('images/dateFrom.png')">
 	    <input type="date" class="ricerca" name="a" placeholder="a data..." style="background-image: url('images/dateTo.png')"> 
		<button class="button button2" id="butt1">Cerca</button>
	</form>
	 
		
    	<div class="cart-list">
    	<h1>Ordini clienti</h1>
	    	<table class="table" id="myMenu">
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
	 
		<%  for (FatturaBean fatt : lista) {
			 int size = fatt.size();
			 java.util.List<Order> orders = fatt.getProdotti();
			 %> 
		
			 <tr class="text-center tr1">
				<td rowspan="<%=size%> " class="product-name">
				    <button  class="button button2 submitter" type="submit">Fattura</button>
				</td>
				<td id="td1" rowspan="<%=size%> "><%=fatt.getUser().getLogin()%></td>
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
			
			</tr>
		<%}} %>
			
		</tbody>
			</table>
			<a class="button button2"  href= "amministratore.jsp"> Indietro</a>
	</div>
	</div>
	</div>
 </section>
<script>
$(document).ready(function () {
	$("#mySearch").keyup(function myFunction() {
			$('#myDropdown p').remove();
			var src= $("#mySearch").val();
			$.getJSON("SuggesterUser", {srch : src})
				.done(function (json){
					$.each(json, function () {
						$("#myDropdown").append('<p role =' +this.login +'>'+this.login+'</p>');
						
						$('[role="'+this.login+'"]').click(function () {
							$("#mySearch").val($(this).html());
							document.getElementById("myDropdown").classList.toggle("show");
						});
					});
				});
			
		 	 document.getElementById("myDropdown").classList.toggle("show");
		 	 
		});
	

		// Close the dropdown if the user clicks outside of it
		window.onclick = function(event) {
		  if (!event.target.matches('.Mydropbtn')) {
		    var dropdowns = document.getElementsByClassName("Mydropdown-content");
		    var i;
		    for (i = 0; i < dropdowns.length; i++) {
		      var openDropdown = dropdowns[i];
		      if (openDropdown.classList.contains('show')) {
		        openDropdown.classList.remove('show');
		      }
		    }
		  }
		}
});

</script>
</body>
</html>

<!-- $(document).ready(function (){
	$("#MyUtenti").hide();
	$("#mySearch").keydown(function(){
		  
	});
}) 

<div id="MyUtenti" class = "card dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" href="#">a</a>
        		<ul class="dropdown-menu">
				for (FatturaBean fatt2 : lista) {
		 			<li>fatt2.getUser().getLogin()%></li>
				}  
				</ul>
	 		</div>-->