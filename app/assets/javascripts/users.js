$(document).ready(function(){
	myXHR = new XMLHttpRequest();
	var searchBox = document.getElementById("search");
	//console.log(searchBox);
	var url = "/users/ajaxHandler?qry=";

	// Commented out until it can be fast
	/*searchBox.onkeyup = function(event) {
		// console.log(searchBox.value);
		url = "/users/ajaxHandler?qry=" + encodeURIComponent(searchBox.value);
		var mine = new Searcher(myXHR, "search_results", url);
	}*/

	$(document).ajaxComplete(function(){
		console.log("ajax complete");
		//$('.add_drop').click(function(event){ toggle_class(event); });
	});

	$('.add_drop').click(function(event){ toggle_class(event); });
});



var toggle_class = function(event){
	// method for knowing which class to add
	// classs html is rendered with a disply:none
	// field id that can be found and sent to server
	console.log("clcked");
	//console.log("added");
	var course_name = $(event.target).prev().html();
	//course.css('background', 'purple');
	console.log(course_name);
	var data  = {course_name2: course_name};
	//array={key1: 'value1',key2:'value2'};

	$.post("/users/add_drop_button", data, function(){ talk(); }, 'json');
	$(event.target).parent().toggleClass("todo");
	$(event.target).parent().toggleClass("completed");
	var sign = $(event.target).html();
	console.log(sign);
	if (sign.indexOf('+') != -1) $(event.target).text('-');
	else $(event.target).text('+');
};

var talk = function() {
	// THIS SHITS BROKEN YO
	console.log("yoyogu");
};

function Searcher(xhr, dump, url) {
	//console.log(url);
	var obj = this;
	obj.xhr = xhr;
	obj.dump = dump;
	//url = encodeURIComponent(url);
	obj.xhr.onreadystatechange = function() {
	// 	console.log("RSC");
	 	obj.xhrHandler(obj);
	}
	//Indicating the encoding of the form data
	//obj.xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	//Header indicating that it's an AJAX request (no need to do this if you don't use it server-side)
	//obj.xhr.setRequestHeader('X-Requested-With','XMLHttpRequest');
	obj.xhr.open("GET", url, true);
	obj.xhr.send();
}
Searcher.prototype.xhrHandler = function(obj) {
	// console.log("readyState: " + this.xhr.readyState);
	// console.log("status: " + this.xhr.status);
	if (this.xhr.readyState != 4) {
		return;
	}
	var status = this.xhr.status;
	if (!(status==200 || status==0)){ 
		console.log("error, status is: " + this.xhr.status); 
		// console.log("non 200 response text:");
  		// console.log(obj.xhr.responseText);
  		// console.log("end response text");
  	}
  	// rt is html
  	//console.log("here");
	var rt = obj.xhr.responseText;
  	//var begin = document.getElementById(obj.un);
  	var finish = document.getElementById(obj.dump);
  	//console.log("BIH: " + begin.value);
  	finish.innerHTML = rt;
  	$('.add_drop').click(function(event){ toggle_class(event); });
}

