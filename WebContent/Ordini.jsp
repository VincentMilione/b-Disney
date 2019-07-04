<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <% Boolean admin= (Boolean)session.getAttribute("isAdmin");
if(admin == null ? true : !admin.booleanValue()) {
	response.sendRedirect(response.encodeURL("Login.jsp"));
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    	<link rel="stylesheet" href="css/stile.css" type = "text/css">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 		<style type="text/css">
		
<style>
.Mydropbtn {
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.Mydropbtn:hover, .Mydropbtn:focus {
  background-color: write;/* #2980B9;*/
}

.Mydropdown {
  position: relative;
  display: inline-block;
}

.Mydropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
 /* min-width: 30%;*/
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.Mydropdown-content p {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.Mydropdown-content p:hover {background-color: #ddd;}

.show {display: block;}
        </style>
		
<title>Ordini</title>
</head>
<body style="background-image: url('images/areg.gif');"  data-spy="scroll" data-target=".navbar" data-offset="50">
<%@ include file = "contentJSP/contentOrdiniAdmin.jsp" %>
<script>
$(document).ready(function () {
	$("#search").click(function () {
		var da = $('input[name = "da"]').val();
		var a = $('input[name = "a"]').val();
		var user = $('#mySearch').val();
		
		$.get("admin", {search : user, da : da, a : a})
			.done(function (data){
				$("table").remove();
				$(".cart-list").append(data);
			})
		
	});	
	
	$(".pageof").click (function () {
		var da = $('input[name = "da"]').val();
		var a = $('input[name = "a"]').val();
		var user = $('#mySearch').val();
		var pg = $(".pageof").val();
		
		$.get("admin", {search : user, da : da, a : a, pg : pg})
			.done(function (data){
				$("table").remove();
				$(".cart-list").append(data);
			})
	})
	
	$("#mySearch").keydown(function myFunction() {
			$('#myDropdown p').remove();
			var src= $("#mySearch").val();
			$.getJSON("SuggesterUser", {srch : src})
				.done(function (json){
					$.each(json, function () {
						$("#myDropdown").append('<p role =' +this.login +'>'+this.login+'</p>');
						
						$('[role="'+this.login+'"]').click(function () {
							$("#mySearch").val($(this).html());
							document.getElementById("myDropdown").classList.toggle("show");
						});
					});
				});
			
		 	 document.getElementById("myDropdown").classList.toggle("show");
		 	 
		});
	

		// Close the dropdown if the user clicks outside of it
		window.onclick = function(event) {
		  if (!event.target.matches('.Mydropbtn')) {
		    var dropdowns = document.getElementsByClassName("Mydropdown-content");
		    var i;
		    for (i = 0; i < dropdowns.length; i++) {
		      var openDropdown = dropdowns[i];
		      if (openDropdown.classList.contains('show')) {
		        openDropdown.classList.remove('show');
		      }
		    }
		  }
		}
});

</script>
</body>
</html>