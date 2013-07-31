$(document).ready(function(){
	$('.second').hide();
	$('.wrapper').click(function(){
		var firstID = "first-req1-" + $(this).attr('id');
		var secondID = "second-req1-" + $(this).attr('id');		
		$("#" + firstID).toggle();
		$("#" + secondID).toggle();
	});

});




function ShowOptions(e, display) {
	var soButton = e.srcElement;
	var box = soButton.parentNode;
	console.log("Showing Options from" + box);
	var buttons = box.childNodes;
	var optList = [];
	for (var i=0; i<buttons.length; i++) {
		var classes = buttons[i].classList;
		if (classes!=undefined && classes.contains("opt")) {

			optList.push(buttons[i]);
		}
	}
	for (var i=0; i<optList.length; i++) {
		optList[i].style.display = display;
	}
}

function ClickOne2(e, display, optionID) {
	//console.log("hallo");
	console.log(optionID);

	ClickOne(e, display);
	var but = e.srcElement;
	var expander  = document.getElementById(optionID);
	//expander.style.color= 'green';
	expander.style.display='block';
}

function MarkCompleted(e) {
	var but = e.srcElement;
	var reqDiv = but.parentNode;
	reqDiv.style.background = 'red';
}

function Expand(e) {

}

function MarkNotCompleted(e) {
	var but = e.srcElement;
	var reqDiv = but.parentNode;
	reqDiv.style.background = 'green';
}

function ClickOne(e, display, optName) {
	console.log(optName); // WHAT IS THIS FOR. AND WHY IS IT NOT ALWAYS CALLED??
	if (optName=="Symbolic Systems") {
		var ssReqs = document.getElementsByClassName("subBox");
		for (var i=0; i<ssReqs.length; i++) {
			ssReqs[i].style.display="table-cell";
		}
	}
	var optButton = e.srcElement;
	var box = optButton.parentNode;
	var buttons = box.childNodes;
	var optList = [];
	for (var i=0; i<buttons.length; i++) {
		var classes = buttons[i].classList;
		if (classes!=undefined && classes.contains("opt")) {
			optList.push(buttons[i]);
		}
	}

	for (var i=0; i<optList.length; i++) {
		optList[i].style.display = "none";
	}
	optButton.style.display = display;
}

