<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "beans.ProductBean" %>
<%@ page import = "java.util.List,java.util.ArrayList, beans.ProductBean,beans.RecenzioneBean, java.util.Random"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/stile.css" type = "text/css">
  	<link rel="stylesheet" href="css/bootstrap.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>	
  	<!-- per voto -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  	
  	<title>${product.getName()}</title>
</head>
<body style="background-image: url('images/areg.gif');" data-spy="scroll" data-target=".navbar" data-offset="50">

<%
	List<RecenzioneBean> list =(List<RecenzioneBean>)  request.getAttribute("recenzioni");
	List<RecenzioneBean> listNew= new ArrayList<RecenzioneBean>();
	
	int i=0, j=0;
	if(list!=null){
		int size = list.size();
		if(size>5)
		{	
			Random rand= new Random();
			
			for( j=0;j<5;j++);
			{
				i= rand.nextInt(size-j);
				listNew.add(list.get(i));
				list.remove(i);
			}
		}else
		{	
			listNew=  new ArrayList<RecenzioneBean>(list);
		}
	}%>
<%@include file = "header2.jsp" %>
<section class="card">
	<div style="float:left; padding:20px;" >
     	<%@include file = "zoom.jsp" %>	
  	</div>
  	<div class="capo">
   		<h1>${product.getName()}</h1>
    	<h3 class="price"><span>${product.getPricewithIva()} &#8364</span></h3>
    	<p>La quantit&#224 disponibile in magazzino &#232 ${product.getQty()}</p>
    	<p>${product.getDescription()}</p>
    			
		<form method = "post" action="ProductControl?id=${product.code}&act=addC">
 			Aggiungi quantit&#224 desiderata: <input type="number" name="qty" value = "1" min="1" max="${product.getQty()}">
  		<center>	<br><p><button  type = "submit" class="btn btn-primary py-3 px-5" >Acquista</button>
  			<a href="Catalogo.jsp" class="btn btn-primary py-3 px-5">Indietro</a></p></center>
  		</form>
  		<p>I nostri prodotti sono realizzati con materiali di alta qualit&#224.</p>
    				 
    			<p>	Se un prodotto arriva danneggiato, 
					saremo pi&#250 che felici di sostituire o rimborsare prodotti Disney Store, 
					sia che tu abbia la bolla di consegna o meno. Ti chiederemo, tuttavia, di restituirci 
					qualsiasi prodotto che sia stato comprato come regalo, cos&#237 da poter verificare che sia un prodotto Disney Store.
				</p>
				<p> Come effettuare un reso per ricevere un rimborso.
					Se non sei completamente soddisfatto dei prodotti ordinati, hai tempo fino ad un massimo di 30 giorni
					 di calendario dalla data di ricezione del tuo ordine, per poter effettuare un reso di alcuni o tutti 
					 gli articoli al suo interno.<br>
					Fino a 14 giorni dalla ricezione del tuo ordine
					<lo>
					<li> Puoi restituire i prodotti tramite il nostro Portale resi europeo e, se hai reso tutti gli articoli che hai ordinato, ricevere il rimborso delle spese di spedizione sostenute per effettuare il tuo ordine.
					</li><li>Le spese di spedizione non ti verranno rimborsate se effettui il reso solo di una parte del tuo ordine.
					Oltre i 14 giorni, ma entro i 30 giorni dalla ricezione del tuo ordine<br>
					</li><li> Puoi restituire tutti o alcuni dei prodotti tramite il nostro Portale resi europeo, ma non ti verranno rimborsate le spese di spedizione originariamente sostenute.
					</li></lo><br>Il rimborso viene effettuato non appena il tuo reso raggiunge i nostri magazzini. Ti informiamo che affinch&#232 il tuo reso rientri nei nostri magazzini possono volerci dalle 2 alle 3 settimane.
					<br>Non appena il tuo reso sar&#224 rientrato nei nostri magazzini, il rimborso verr&#224 processato usando lo stesso metodo di pagamento usato al momento dell&#39ordine in 5-7 giorni lavorativi.
					<br><br>
				<br></p>
		</div>
</section>
<section class="card">
		<div >
   		 <%@include file = "Voto.jsp" %>
   		 	</div>
</section>
   
   		<div class="Myvotazione card">
   		<%
   		Boolean f=(Boolean) request.getAttribute("payed");
   		
   		if(request.getAttribute("userComment")!=null){
   				
   				%>
   				<div class=commento>
   					<h3>You</h3>
   					<p>${userComment.description}</p>
   				</div>
   					
   		<%} else if (f!= null ? f.booleanValue() : false) {%>
   				<div id = "votazione">
   					<input type = "number" min = "1" max = "5">
   					<textarea>
   				</div>
   			<%
   			}%>
   			<h3>Ecco cosa ne pensano i nostri clienti...</h3>
   			<% for (RecenzioneBean e : listNew) {
   				%>
   				
   				<div class=commento>
   					<h3><%=e.getName() %></h3>
   					<p><%=e.getDescription() %></p>
   				</div>
   				<%
   			}
   			%>
   		</div>

<%@include file = "footer.jsp" %>
<script type="text/javascript">
$(document).ready(function () {
	$("").click(function () {
		
	});
});
</script>
</body>
</html>