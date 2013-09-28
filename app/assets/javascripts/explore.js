$(document).ready(function(){
	$('.second').hide();
	// $('.wrapper').click(function(){
	// 	var firstID = "first-req1-" + $(this).attr('id');
	// 	var secondID = "second-req1-" + $(this).attr('id');		
	// 	$("#" + firstID).toggle();
	// 	$("#" + secondID).toggle();
	// });


	$('.thirty').click(function(){
		$(this).parent().parent().parent().parent().hide();
		$(this).parent().parent().parent().parent().prev().show();
	});

	$('.first').click(function(){
		$(this).hide();
		$(this).next().show();

	});



});



function MarkCompleted(e) {
	var but = e.srcElement;
	var reqDiv = but.parentNode;
	reqDiv.style.background = 'red';
}


function MarkNotCompleted(e) {
	var but = e.srcElement;
	var reqDiv = but.parentNode;
	reqDiv.style.background = 'green';
}
