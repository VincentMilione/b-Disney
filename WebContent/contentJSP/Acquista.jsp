<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import = "coreModels.beans.*, java.util.Collection" %>

	<%
	
	Cart carello= (Cart) session.getAttribute("cart");
	if(carello == null ? true : carello.size() == 0 ){%>
	  <div class="acquista">
      <h4 id = "size">Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b>0</b></span></h4>
      <p id="noIva">Totale (IVA escl.)<span class="price">0.00 &#8364</span></p>
      <p id="Iva">Totale IVA<span class="price">0.00 &#8364</span></p>
     
      <hr>
      <p id = "tot">Totale<span class="price" style="color:black"><b>0 &#8364</b></span></p>
     
    </div><%}
	else{ %>
   <div class="acquista">
      <h4 id = "size">Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b>${cart.size()}</b></span></h4>
      <p id="noIva">Totale (IVA escl.)<span class="price">${cart.getTotalWithoutIva ()} &#8364</span></p>
      <p id="Iva">Totale IVA<span class="price"> ${cart.getTotalIva ()} &#8364</span></p>
     
      <hr>
      <p id = "tot">Totale<span class="price" style="color:black"><b>${cart.getTotal ()} &#8364</b></span></p>
     
    </div>
    <%}%>