	function openNav() {
	    document.getElementById("WebSidenav").style.width = "20%";
	    var loader = document.getElementById("loader");
	    if (typeof loader !== 'undefined' && loader !== null) {
	        // the variable is defined
	    	loader.style.left= '64%';
	    }
	   
	}
	
	function closeNav() {
	    document.getElementById("WebSidenav").style.width = "0";
	    var loader = document.getElementById("loader");
	    if (typeof loader !== 'undefined' && loader !== null) {
	        // the variable is defined
	    	loader.style.left= '54%';
	    }

	}
	
	 function getDeviceView(id) { 
	    var xmlHttp = new XMLHttpRequest(); 
	    var deviceName=$(id).attr("id");
	    console.log(deviceName);
	    xmlHttp.open("POST", "GetDevice", true); 
	    xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	    xmlHttp.send("deviceName="+deviceName); 
	}
	