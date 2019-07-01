<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!--Attenzione chiedere se bisogna inserire anche tutti i dati della fattura-->
<section class="ftco-section ftco-cart">
	<div class="row ">
		<div class="card y x">
    
   <%@ include file = "UserSuggester.jsp" %>
 	 	
        <input type="date" class="ricerca"  name="da" placeholder="da data..." style="background-image: url('images/dateFrom.png')">
 	    <input type="date" class="ricerca" name="a" placeholder="a data..." style="background-image: url('images/dateTo.png')"> 
		<button class="button button2" id="search">Cerca</button>
	 
		
    	<div class="cart-list">
    	<h1>Ordini clienti</h1>
	    <%@ include file= "tableOrdersadmin.jsp" %>
			
	</div>
	</div>
	</div>
 </section>
<script>
$(document).ready(function () {
	$("#search").click(function () {
		var da = $('input[name = "da"]').val();
		var a = $('input[name = "a"]').val();
		var utente= $('#mySearch').val();
		
		$.get("admin", {search : user, da : da, a : a})
			.done(function (data){
				("table").remove();
				(".cart-list").append(data);
			})
		
	});
	
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