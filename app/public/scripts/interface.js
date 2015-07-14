$( document ).ready(function() {


	$(".buttons").click(function(event){
		console.log(event.target.id)
		$.post( "/likes", { peep_id: event.target.id  })
	})


});