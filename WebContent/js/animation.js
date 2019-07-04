 
($(".productCard").hover(function(){
		    $(this).animate({width:"+=2%", height:"+=2%", margin:"-=1%" } );
		  }, function() {
		        $(this).animate({width:"-=2%",height:"-=2%", margin:"+=1%"});
})
);