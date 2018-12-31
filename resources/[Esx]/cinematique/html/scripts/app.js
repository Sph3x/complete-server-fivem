$(document).ready(function(){ 
	// Partial Functions
	function ShowCinema() {
	  $("html").css("display", "block");
	}
	function CloseCinema() {
	  $("html").css("display", "none");
	}
	// Listen for NUI Events
	window.addEventListener('message', function(event){
	  var item = event.data;
	  // Open & Close main bank window
	  if(item.openCinema == true) {
			ShowCinema();
		}
	  if(item.openCinema == false) {
			CloseCinema();
	  }
	});
});