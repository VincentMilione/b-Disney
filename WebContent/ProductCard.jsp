<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.List, beans.ProductBean, java.util.Random"%>

<%
	List<ProductBean> list =(List<ProductBean>)  request.getAttribute("list");
	int size = list.size();
%> 
<div class = "container " >
<%for (ProductBean e : list) { %>
<div class="productCard" >

<div class="imgSconto">
	<img src=<%=e.getPhoto()%> alt=<%=e.getName() %> title=<%=e.getName() %>>
</div>

 <div class ="nomeProdSconto"><h3><a href = "ProductControl?id=<%=e.getCode()%>&act=view"><%=e.getName() %></a></h3></div>
  <p class="prezzo">$<%=e.getPriceSenzaSconto() %></p>
  <p class="sconto">$<%=(Math.round(e.getPricewithIva()*100))/100.0 %></p>
  <p><button>Acquista</button></p> 
</div>
<%} %>
</div>
