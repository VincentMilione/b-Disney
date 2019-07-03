<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!--Attenzione chiedere se bisogna inserire anche tutti i dati della fattura-->
<section class="ftco-section ftco-cart">
	<div class="row ">
		<div class="card y x">
    
   <%@ include file = "UserSuggester.jsp" %>
 	 	
        <input type="date" class="ricerca"  name="da" placeholder="da data..." style="background-image: url('images/dateFrom.png')">
 	    <input type="date" class="ricerca" name="a" placeholder="a data..." style="background-image: url('images/dateTo.png')"> 
		<button class="button button2" id="search">Cerca</button>
	 
		
    	<div class="cart-list">
    	<h1>Ordini clienti</h1>
	    <%@ include file= "tableOrdersadmin.jsp" %>
			
	</div>
	</div>
	</div>
 </section>
