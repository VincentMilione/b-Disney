<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

  <br><br>
 <div class="row" >
  <% 	String c="";
  		String ctgy= request.getParameter("ctgy");
  		String srch= request.getParameter ("srch");
  		
  		if(srch != null) c = srch;
  		else {
  			if("0".equals(ctgy)) c="Articoli per la casa";
  			if("1".equals(ctgy)) c="Abbigliamento e Accessori";
  	  		if("2".equals(ctgy)) c="Articoli per le feste";
  	  		if("3".equals(ctgy)) c="Giochi";
  		}
  		
	   %>
    <div class="card">
      <h3>Risultato per "<%=c %>"</h3>
     
   	<div> 
 		<%@include file= "ProductCard.jsp" %>
		<p style = "text-align: center">pg <input class = "pageof" type = "number" value = "1" min="1" max="<%= request.getAttribute("maxPg") %>"> of <%= request.getAttribute("maxPg") %> <button id = "submit">Invia</button></p>
	</div>
  </div>
 </div>
