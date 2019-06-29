<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import = "beans.*, beans.Cart, java.util.Collection" %>


   <div class="acquista">
      <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b>${cart.size()}</b></span></h4>
      <p>Totale (IVA escl.)<span class="price">${cart.getTotalWithoutIva()}</span></p>
      <p>Totale IVA<span class="price">${cart.getTotalIva()}</span></p>
     
      <hr>
      <p>Totale<span class="price" style="color:black"><b>${cart.getTotal()}</b></span></p>
     
    </div>