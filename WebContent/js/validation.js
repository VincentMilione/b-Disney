$(document).ready(function () {
	function Validator (element, formatter, warning, errorMessage)
	{	
		this.x = element;
		this.format = formatter;
		this.warner = warning;
		this.error = errorMessage;

		this.verifier = function () {
			
			console.log (this.x.value);
			if (this.x.value.match (this.format))
			{
				this.warner.innerHTML = "";
				return true;
			}
			else
			{
				this.x.value = "";
				console.log ("hola");
				this.warner.innerHTML = this.error;
				return false;
			}
		}
	}
	
	$("input").focus (function focuser () {
		this.style.border = "2px solid blue";
		this.style.backgroundColor = "blue";
	});
	
	$("input").blur (function blurer ()
	{
		this.style.border = "";
		this.style.backgroundColor = "";
	});
});