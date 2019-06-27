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

 <div class ="nomeProdSconto"><h3 style = "font-size: 120%"><a href = "ProductControl?id=<%=e.getCode()%>&act=view"><%=e.getName() %></a></h3></div>
  <p class="prezzo"><%=e.getPriceSenzaSconto() %>&#8364;</p>
  <p class="sconto"><%=e.getPricewithIva()%>&#8364;</p>
  <p><button>Acquista</button></p> 
</div>
<%} %>
</div>
