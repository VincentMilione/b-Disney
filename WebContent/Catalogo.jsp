<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="css/stile.css" type = "text/css">
  	<link rel="stylesheet" href="css/bootstrap.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<title>Catalogo</title>
</head>

<body style="background-image: url('images/areg.gif');" data-spy="scroll" data-target=".navbar" data-offset="50">

 <%@include file = "header2.jsp" %> <br><br>
 <div class="row" >
  <% 	String c="";
  		String ctgy= request.getParameter("ctgy");
  		String srch= request.getParameter ("srch");
  		
  		if(srch != null) c = srch;
  		if("0".equals(ctgy)) c="Articoli per la casa";
  		if("1".equals(ctgy)) c="Abbigliamento e Accessori";
  		if("2".equals(ctgy)) c="Articoli per le feste";
  		if("3".equals(ctgy)) c="Giochi";
	   %>
    <div class="card">
      <h3>Risultato per "<%=c %>"</h3>
     
   	<div> 
 	<%@include file= "ProductCard.jsp" %>
	<p style = "text-align: center">pg <input class = "pageof" type = "number" value = "1" min="1" max="<%= request.getAttribute("maxPg") %>"> of <%= request.getAttribute("maxPg") %> <button id = "submit">Invia</button></p>
	</div>
  </div>
 </div>
<%@include file = "footer.jsp" %>

<script>
$(document).ready(function () {
	$("#submit").click (function () {
		var pg = $(".pageof").val();
		var ctgy = <%= ctgy%>;
		var srch = <%= srch%>;
		var data = ctgy == null ? {pg: pg, srch: srch} : {pg: pg, ctgy: ctgy};
		
		//avvia richiesta per reperire lista prodotti da visualizzare in pagina = pg
		$.get("catalogo", data)
			//se funge
			.done (function (json) {
				//rimuovi i prodotti dalla pagina
				$(".productCard").remove();
				$.each(json, function () {
					//costruisci il div per i prodotti
					console.log(this.price);
					var main = $('<div class = "productCard">');
					var img = $('<img>')
						.wrap('<div class = "imgSconto">')
						.attr("src", this.photo);
					var prezzo = $('<p class = "prezzo">').html(this.price);
					var sconto = $('<p class = "sconto">').html(this.price);
					var button = $('<button>').html('Acquista');
					
					$(main).append(img);
					$(main).append(prezzo);
					$(main).append (sconto);
					$(main).append(button);
					
					$(".container").append(main);
				});
			});
	})
});
</script>
</body>
</html>