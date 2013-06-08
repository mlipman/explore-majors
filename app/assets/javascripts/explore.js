
function ShowOptions(e) {
	//console.log("show options clicked");
	//var optList = document.getElementsByClassName("opt");
	var soButton = e.srcElement;
	var box = soButton.parentNode;

	//console.log(pwrBox);
	var buttons = box.childNodes;
	var optList = [];
	for (var i=0; i<buttons.length; i++) {
		//console.log(i + buttons[i]);

		var classes = buttons[i].classList;
		//console.log(classes);
		if (classes!=undefined && classes.contains("opt")) {
			//console.log(i + classes);
			optList.push(buttons[i]);
		}
	}

	for (var i=0; i<optList.length; i++) {
		//console.log(i + optList[i]);
		optList[i].style.display = "block";
		//console.log(i);
	}
}

function ClickOne(e) {
	//console.log("hmm");
	//var optList = document.getElementsByClassName("opt");
	var optButton = e.srcElement;
	var pwrBox = optButton.parentNode;

	var buttons = pwrBox.childNodes;
	var optList = [];
	for (var i=0; i<buttons.length; i++) {
		//console.log(i + buttons[i]);
		//console.log(buttons[i].className);
		var classes = buttons[i].classList;
		//console.log(classes);
		if (classes!=undefined && classes.contains("opt")) {
			//console.log(i);
			optList.push(buttons[i]);
		}
	}

	for (var i=0; i<optList.length; i++) {
		optList[i].style.display = "none";
	}

	//console.log(e);

	optButton.style.display = "block";
	// var picked = document.getElementById("a");
	// picked.style.display = "block";

}

