<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
</body>
</html>