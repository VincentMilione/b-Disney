<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="beans.*"%>
<!DOCTYPE>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="css/stile.css" type = "text/css">
  	<link rel="stylesheet" href="css/bootstrap.css" type = "text/css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>Checkout</title>

<style>

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}


	
</style>
</head>
<body style="background-image: url('images/areg.gif');" data-spy="scroll" data-target=".navbar" data-offset="50">
		<%@include file = "header2.jsp" %><br>
		
		<div class="field2">
    <div class="a" style="padding: 1%;">
       <h3>Billing Address</h3>
		 
         <%
        Boolean User = session.getAttribute("isUser") == null ? false : (Boolean) session.getAttribute("isUser");
        java.util.Map<Integer, beans.Adress> map = (java.util.Map<Integer, beans.Adress>) session.getAttribute("addresses");
       	java.util.List <beans.Adress> addresses = map == null ? new java.util.ArrayList<beans.Adress>() : new java.util.ArrayList (map.values());
       %> <label class="myLabel" for="fname"><i class="fa fa-user"></i>Nome: ${user.name}  ${user.cognome} </label>
		  <label class="myLabel" for="email"><i class="fa fa-envelope"></i> Email: ${user.login}</label>
		<%
       if (User && addresses.size() > 0) { %>
       				
       		     <label class="myLabel" for="adr"><i class="fa fa-address-card-o"></i> Address</label>
				 <select name="indirizzi" id=indirizzi>
          		  <%
          		  for(int i=0;i<addresses.size();i++) {%>
          		  	<option value="<%= addresses.get(i).getCodice()%>"><%=addresses.get(i)%></option>
          		  <%} %>
        		  </select>
        		
	    <%}
        %>    <!-- 
        		1) chiedi all'utente di registrare un nuovo indirizzo
        		2) al premere del submit devi avviare una richiesta ajax che chiama AddressOperations?operation=1
        		3) al successo della richiesta ajax manipola il dom per creare la combobox con jquery-->
	        <button id="toggle">Aggiungi indirizzo</button><br>
	         <div id="AddIndirizzo"><br>
	        	  <label  class="myLabel" for="adr"><i class="fa fa-address-card-o"></i> Indirizzo</label>
            	  <input type="text" value= "test" id="adr" name="address" placeholder="via della repubblica">
            	  <label  class="myLabel" for="adr"><i class="fa fa-address-card-o"></i> Numero civico</label>
            	  <input type="number" value = "5" id="nc" name="nc" min="1" ><br>
            	  <label class="myLabel" for="city"><i class="fa fa-institution"></i> Città</label>
                  <input type="text" value = "Roma" id="city" name="city" placeholder="Roma">
                  <label  class="myLabel" for="city"><i class="fa fa-institution"></i> Provincia</label>
                  <input type="text" value = "Roma" id="provincia" name="provincia" placeholder="Roma">
                  <label  class="myLabel" for="adr"><i class="fa fa-address-card-o"></i> CAP</label>
            	  <input type="text" id="CAP" value ="84013" name="CAP" placeholder="8089">
                  <label  class="myLabel" for="state">Stato</label>
                  <input type="text" id="state" name="state" value = "Italia" placeholder="Italia">
                  <button id="butt">Aggiungi</button>
              </div><br>
              	 
              <%@ include file = "Acquista.jsp" %>        
	     
       <% if (isUser) { %> 
        <input type="submit" value="Continue to checkout" class="btn"><%} %>
     </div>
  </div>
		<%@include file = "footer.jsp" %>
<script>
$(document).ready(function() {
	$("#AddIndirizzo").slideUp();
	$("#toggle").click(function(){
		  $("#AddIndirizzo").slideToggle();
		});
	$("#butt").click(function () {
		var via = $("#adr").val();
		var nC = $("#nc").val();
		var ct= $("#city").val();
		var cap= $("#CAP").val();
		var st= $("#state").val();
		var provincia= $("#provincia").val();
		
		$.post("AddressOperations", {operation: "1", via: via, ncv: nC, citta: ct, provincia: provincia , cap: cap, stato: st}, "html")
		.done(function(data){
			console.log(data);
			var string = "<option value="+data.codice+">"+data.street +data.nvc +data.citta+"</option>"
			$("#indirizzi").append(string);
		})
		.fail(function() {
			//scrivi un box di errore
		
		});
	});
});
</script>
</body>
</html>
<!-- 
				
         	-->