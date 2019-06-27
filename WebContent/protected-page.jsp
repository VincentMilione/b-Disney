<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="css/stile.css" type = "text/css">
  	<link rel="stylesheet" href="css/bootstrap.css" type = "text/css">
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  	<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
.card-row{
	display: table;
	height:100%;
	margin-top: 15%;
	margin-left: 5%;
	width: 70%;
	box-sizing: border-box;
}

.card-cell {
	display: table-cell;
	height 100%;
	padding: 5px;
}
.whole_card{
	height: 100%;
	display: block;
}
.whole_card:hover{
	background-color: lightgrey;
}

.a-box {
	display: block;
	border-radius: 4px;
	border: 1px #ddd solid;
}

.inner {
	position: relative; 
	padding: 14px 18px;
	border-radius: 4px
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Protected page</title>
</head>
<body  style="background-image: url('images/areg.gif');" data-spy="scroll" data-target=".navbar" data-offset="50">
 <%@include file = "header2.jsp" %><br>
<div class="field">
 <div class ="card-row card">
 <div id ="address" class = "card-cell">
	<div class = "whole_card">
		<div class = "a-box">
			<div class = "inner">
				<p>ciao</p>	
			</div>
		</div>
	</div>
 </div>
	<div id ="account" class = "card-cell">
	<div class = "whole_card">
		<div class = "a-box">
			<div class = "inner">
				<p>ciao</p>	
			</div>
		</div>
	</div>
 </div>
 <div id ="ordini" class = "card-cell">
	<div class = "whole_card">
		<div class = "a-box">
			<div class = "inner">
				<p>ciao</p>	
			</div>
		</div>
	</div>
 </div>
</div> 
</div>
<%@include file = "footer.jsp" %>

<script type="text/javascript">
$(document).ready(function (){
	$(".card-cell").click(function (){                                      
        $(".card-row").animate(
        	{
        	      opacity: '0',
        	      height: '20%',
        	      width: '20%'
        	    }
          );
	});
	
	$("#ordini").click(function () {
		//fare una richiesta ajax per costruire una tabella contenente tutti gli ordini
		$("<table>").append();
	});
	
	$("#address").click(function () {
		//fare una richiesta ajax per richiedere gl'indirizzi di spedizione 
		
	});
	
	$("#account").click(function () {
		//fare una richiesta ajax per richiedere i dati dell'utente
		
	});

});
</script>
</body>
</html>