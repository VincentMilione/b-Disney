<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.List, beans.ProductBean, java.util.Random"%>

<%
	List<ProductBean> list =(List<ProductBean>)  request.getAttribute("list");
	int size = list.size();
%> 
<section class = "flex-container">
<%for (ProductBean e : list) { %>

<div>
  <img class = "image" src="img/admin.jpg">
 <div class = "text">
  <h1>TITOLO MOLTO O</h1>
 </div>
  <p class="price">$19.99</p>
 <div class = "add">
  <p><button>Add to Cart</button></p>
 </div>
</div>
<%} %>
</section>
