const clock = document.querySelector("#timeNow");

function setClock(){
	const date = new Date();
	
	const hour = String(date.getHours()).padStart(2, "0");
	const minute = String(date.getMinutes()).padStart(2, "0");
	const second = String(date.getSeconds()).padStart(2, "0");
	
	clock.innerText = `${hour}:${minute}:${second}`
	
	
}
setClock();
setInterval(setClock, 1000);