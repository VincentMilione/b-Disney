/**
 * 
 */

$(document).ready(function() {
	$("#AddIndirizzo").slideUp();
	$("#toggle").click(function(){
		  $("#AddIndirizzo").slideToggle();
		});
	$("#butt").click(function () {
		var via = $("#adr").val();
		var nC = $("#nc").val();
		var ct= $("#city").val();
		var cap= $("#CAP").val();
		var st= $("#state").val();
		var provincia= $("#provincia").val();
		
		$.post("AddressOperations", {operation: "1", via: via, ncv: nC, citta: ct, provincia: provincia , cap: cap, stato: st}, "html")
		.done(function(data){
			console.log(data);
			var string = '<option value="'+data.codice+'">Indirizzo:'+data.street+', ' +data.nCv+"; CAP:"+data.CAP+"; citta\'" +data.citta+'</option>';
			console.log (string);
			$("#address").append(string);
		})
		.fail(function() {
			//scrivi un box di errore
		
		});
	});
});