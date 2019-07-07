
function validateCredentials () {
	var email = document.getElementById("email");
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var nome = document.getElementById("name"); 
	var cognome = document.getElementById("surname"); 
	var nameformat = /^[A-Za-z]+$/;
	var password = document.getElementById("password").value; 
	var passid_len = password.length;
	var flag = true;
	console.log(email +nome +cognome +password);
	
	if (passid_len == 0 ||passid_len >= 25 || passid_len < 8) {
		flag = false;
		$("#passwordWarning").slideToggle();
	}
			/*pss no valida;*/

	if (email != null) {
		if(!verifier(email, mailformat , document.getElementById("emailWarning")))
			flag = false;
	}
		
	if(nome != null){
		if(!verifier(nome,nameformat, document.getElementById("nameWarning")))
			flag = false;
	}
		
	if (cognome != null){	
		if(!verifier(cognome, nameformat, document.getElementById("surnameWarning")))
			flag = false;
	}
	if (password != null){
		if(!verifier(password, document.getElementById("passwordWarning")))
			flag = false;
	}
	
	return flag;
}	 

function verifier (element, formatter, warning) {
	if(element.value.match(formatter))
		return true;
	else {
	
	$(warning).slideDown();
	return false;
}

}
	 
$(document).ready(function () {
	$("#nameWarning").hide();
    $("#surnameWarning").hide();
    $("#emailWarning").hide();
    $("#passwordWarning").hide();
   

$(".validation").submit (function (event) {
	
	if (!validateCredentials ())
		event.preventDefault();
	
});




$("input").focus (function focuser () {
this.style.border = "2px solid a3d1ff";
this.style.backgroundColor = "a3d1ff";
});

$("input").blur (function blurer ()
{
this.style.border = "";
this.style.backgroundColor = "";
});

});
			