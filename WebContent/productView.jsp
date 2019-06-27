<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "beans.ProductBean" %>
<%@ page import = "java.util.List,java.util.ArrayList, beans.ProductBean,beans.RecenzioneBean, java.util.Random"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/stile.css" type = "text/css">
  	<link rel="stylesheet" href="css/bootstrap.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>	
  	<!-- per voto -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  	
  	<title>${product.getName()}</title>
</head>
<body style="background-image: url('images/areg.gif');" data-spy="scroll" data-target=".navbar" data-offset="50">

<%
	List<RecenzioneBean> list =(List<RecenzioneBean>)  request.getAttribute("recenzioni");
	List<RecenzioneBean> listNew= new ArrayList<RecenzioneBean>();
	
	int i=0, j=0;
	if(list!=null){
		int size = list.size();
		if(size>5)
		{	
			Random rand= new Random();
			
			for( j=0;j<5;j++);
			{
				i= rand.nextInt(size-j);
				listNew.add(list.get(i));
				list.remove(i);
			}
		}else
		{	
			listNew=  new ArrayList<RecenzioneBean>(list);
		}
	}%>
<%@include file = "header2.jsp" %>
<section class="card">
	<div style="float:left; padding:20px;" >
     	<%@include file = "zoom.jsp" %>	
  	</div>
  	<div class="capo">
   		<h1>${product.getName()}</h1><br>
    	<h3 class="price"><span>${product.getPricewithIva()} &#8364</span></h3>
    	<p>La quantit&#224 disponibile in magazzino &#232 ${product.getQty()}</p>
    	<p>${product.getDescription()}</p>
    			
		<form method = "post" action="ProductControl?id=${product.code}&act=addC">
 		<label  class="myLabel" for="fname">Quantit&#224 desiderata</label>
   		<input id="inputN" type="number" name="qty" value = "1" min="1" max="${product.getQty()}">
  			<br><button  type = "submit" class="button button2" >Acquista</button>
  			<a href="Catalogo.jsp" class="button button2">Indietro</a>
  		</form>
		</div><br><br><br>
</section>
<section class="card">
		<div >
   		 <%@include file = "Voto.jsp" %>
   		 	</div>
</section>
   
   		<div class="Myvotazione card">
   		<%
   		Boolean f=(Boolean) request.getAttribute("payed");
   		
   		if(request.getAttribute("userComment")!=null){
   				
   				%>
   				<div class=commento>
   					<h3>You</h3>
   					<p>${userComment.description}</p>
   				</div>
   					
   		<%} else if (f!= null ? f.booleanValue() : false) {%>
   				<div id = "votazione">
   					<input type = "number" min = "1" max = "5">
   					<textarea>
   				</div>
   			<%
   			}%>
   			<h3>Ecco cosa ne pensano i nostri clienti...</h3>
   			<% for (RecenzioneBean e : listNew) {
   				%>
   				
   				<div class=commento>
   					<h3><%=e.getName() %></h3>
   					<p><%=e.getDescription() %></p>
   				</div>
   				<%
   			}
   			%>
   		</div>

<%@include file = "footer.jsp" %>
<script type="text/javascript">
$(document).ready(function () {
	$("").click(function () {
		
	});
});
</script>
</body>
</html>