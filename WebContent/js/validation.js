
	verifier = function (element, formatter, warning, errorMessage) {
			
			if (element.value.match (formatter))
			{
				this.warning.innerHTML = "";
				return true;
			}
			else
			{
				this.x.value = "";
				this.warning.innerHTML = this.error;
				return false;
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
