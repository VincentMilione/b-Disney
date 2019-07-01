<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import = "beans.*, beans.Cart, java.util.Collection" %>


   <div class="acquista">
      <h4 id = "size">Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b>${cart.size()}</b></span></h4>
      <p id="noIva">Totale (IVA escl.)<span class="price"></span></p>
      <p id="Iva">Totale IVA<span class="price"></span></p>
     
      <hr>
      <p id = "tot">Totale<span class="price" style="color:black"><b></b></span></p>
     
    </div>