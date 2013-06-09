
function ShowOptions(e, display) {
	var soButton = e.srcElement;
	var box = soButton.parentNode;
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

function ClickOne(e, display, optName) {
	console.log(optName);
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

