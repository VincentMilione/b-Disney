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
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	
	/*animazione passaggio del mouse*/
	/* $(".imgSconto2").animate({width:"-=10%", height:"-=10%"});*/
	 $(".productCard").hover(function(){
		    $(this).animate({width:"+=2%", height:"+=2%", margin:"-=1%"} );
		  }, function() {
		        $(this).animate({width:"-=2%",height:"-=2%", margin:"+=1%"});
     });
	
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
				console.log(json);
				$.each(json, function () {
					//costruisci il div per i prodotti
					var divImage = $('<div class = "imgSconto">');
					var divName = $('<div class ="nomeProdSconto">');
					var main = $('<div class = "productCard">');
					var img = $('<img>')
						.attr("src", this.img)
					
					var name = $('<h3 style = "font-size: 120%">');
					var link = $('<a>').attr("href", 'ProductControl?act=view&id='+this.id).html(this.name);
					var prezzo = $('<p class = "prezzo">').html(this.price+"&#8364;");
					var sconto = $('<p class = "sconto">').html(this.priceDisc+"&#8364;");
					var button = $('<button>').html('Acquista');
				
					$(main).append(img);
					$(main).append(link);
					if (this.isinDicount) {
						$(main).append(prezzo);
						$(main).append (sconto);
					}
					else $(main).append (sconto);
					
					$(main).append(button);
					
					$(".container").append(main);
				});
				
				$(".productCard a").wrap ('<h3 style = "font-size: 120%">');
				$(".productCard h3").wrap('<div class = "nomeProdSconto"></div>');
				$(".productCard img").wrap('<div class = "imgSconto"></div>');
				$(".productCard button").wrap("<p>")
			});
	})
	
	
});
</script>
</body>
</html>