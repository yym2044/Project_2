


//jquery 형 함수
checkNull = function (obj, value, message) {
	if(value == "" || value == null){
		alert(message);
		obj.addClass("is-invalid");
		obj.focus();
		return false;
	} else {
		return true;
	}
}

//javascript
function checkNull (obj, value, message) {
	if(value == "" || value == null){
		alert("validation.js1 : " + message);
		obj.focus();
		return false;
	}
}

checkNoSelect = function(obj, value, message){
	if(value == 0){
		alert(message);
		obj.addClass("is-invalid");
		obj.focus();
		return false;
	} else {
		return true;
	}
}


checkOnlyNumber = function(obj, value, message) {
    var regExp = /^[0-9]+$/;
    if(regExp.test(value)) {
		return true;
	} else {
		alert(message);
        obj.focus();
        obj.addClass("is-invalid");
		return false;
	}
}


checkId = function(obj, value, message) {
    var regExp = /^[A-Za-z0-9,_-]{2,20}$/;
    if(regExp.test(value)) {
		return true;
	} else {
		alert(message);
        obj.focus();
        obj.addClass("is-invalid");
		return false;
	}
}


checkPassword = function(obj, value, message) {
	var regExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*]).{8,20}$/;
    /*var regExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}$/;*/
    if(regExp.test(value)) {
		return true;
	} else {
		alert(message);
        obj.focus();
        obj.addClass("is-invalid");
		return false;
	}
}


checkOnlyEnglish = function(value) {
    var regExp = /^[A-Za-z]+$/ 
    if(regExp.test(value)) return true;
    else return false;
}


checkEmail = function(obj, value, message) {
    var regExp = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if(regExp.test(value)) {
    	return true;
    } else {
		alert(message);
		obj.focus();
		obj.addClass("is-invalid");
		return false;
	}
}


checkMobile = function(obj, value, message) {
    var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
    if(regExp.test(value)) {
    	return true;
    } else {
		alert(message);
		obj.focus();
		obj.addClass("is-invalid");
		return false;
	}
}

$("input").keyup(function(){
			$(this).removeClass("is-invalid");
		});
$("input").on("change", function(){
	$(this).removeClass("is-invalid");
});
$("#ifmeEmailDomainCd").on("change", function(){
	$("#ifmeEmailDomain").removeClass("is-invalid");
});
$("select").on("change", function(){
	$(this).removeClass("is-invalid");
});
