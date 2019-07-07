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
        Boolean User = (Boolean) session.getAttribute("isUser");
        java.util.Map<Integer, beans.Adress> map = (java.util.Map<Integer, beans.Adress>) session.getAttribute("addresses");
       	java.util.List <beans.Adress> addresses = map == null ? new java.util.ArrayList<beans.Adress>() : new java.util.ArrayList (map.values());
       %> <label class="myLabel" for="fname"><i class="fa fa-user"></i>Nome: ${user.name}  ${user.cognome} </label>
		  <label class="myLabel" for="email"><i class="fa fa-envelope"></i> Email: ${user.login}</label>
		   <%@ include file = "newAddress.jsp" %>
		     <form action="checkout" method = "post"> 
		<%
       if ((User == null ? false : User) && addresses.size() > 0) { %>
       				
       		     <label class="myLabel" for="adr"><i class="fa fa-address-card-o"></i> Address</label>
				 <select name="address" id=address>
          		  <%
          		  for(Adress address : addresses) {%>
          		  	<option value="<%=address.getCodice()%>"><%=address%></option>
          		  <%} %>
        		  </select>
        		
	    <%}
        %>   
              <%@ include file = "Acquista.jsp" %>        
	   
       		 <input type="submit" value="Continue to checkout" class="btn">
        </form> 
     </div>
  </div>
		<%@include file = "footer.jsp" %>
<script type="text/javascript" src= "js/credenziali.js"></script>
	
</body>
</html>
<!-- 
				
         	-->