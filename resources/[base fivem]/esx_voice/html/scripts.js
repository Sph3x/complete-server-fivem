function addGaps(nStr) {
  nStr += '';
  var x = nStr.split('.');
  var x1 = x[0];
  var x2 = x.length > 1 ? '.' + x[1] : '';
  var rgx = /(\d+)(\d{3})/;
  while (rgx.test(x1)) {
    x1 = x1.replace(rgx, '$1' + '<span style="margin-left: 3px; margin-right: 3px;"/>' + '$2');
  }
  return x1 + x2;
}


$(document).ready(function(){

  	window.addEventListener('message', function(event){

	   	var item = event.data;
      if (event.data.voice === 1) {
        $('.job').html('<p id="voice"><img src="https://emojipedia-us.s3.amazonaws.com/thumbs/120/microsoft/106/studio-microphone_1f399.png" alt="" style="width:20px;height:20px;"> </p>')
      }
  	});

});