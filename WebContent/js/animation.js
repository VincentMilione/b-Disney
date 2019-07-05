

$(document).ready(function () {
	
	$(".productCard").hover(function(){
	      $(this).animate({width:"+=1%", height:"+=1%", marginLeft:"-=1%", marginRight: "-=1%", marginTop:"-=1%", marginBottom:"-=1%"});
		}, function() {
	          $(this).animate({width:"-=1%",height:"-=1%", marginLeft:"+=1%", marginRight: "+=1%", marginTop:"+=1%", marginBottom:"+=1%"},{
	        	    complete: function() { $(this).removeAttr('style') }
	        	});
	    })
});
