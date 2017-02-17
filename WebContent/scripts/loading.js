
		var indexNumber = 0;
		var msgNumber = 0;
		function colorChange() {
		    var colors = ["one", "two", "three"];
		    $("#deviceView").removeClass("one two three").addClass(colors[indexNumber]);
		}
		
		var  colorChangeIntervalId= setInterval(function () {
		    colorChange();
		    indexNumber++;
		    if (indexNumber == 3) {
		    	indexNumber = 0
		    }
		}, 1000);
		
		var messageChangeIntervalId=setInterval(function () {
		    messageChange();
		    msgNumber++;
		    
		}, 3000);
		function messageChange() {
			try{
				checkIframeLoaded();
				if (msgNumber == 3) {
			    	document.getElementById("preparing").style.display = "none";
			    	document.getElementById("waiting").style.display = "";
			    	
			    	msgNumber = 0
			    }else if(msgNumber == 2){
			    	document.getElementById("loading").style.display = "none";
			    	document.getElementById("preparing").style.display = "";
			    }else if(msgNumber == 1){
			    	document.getElementById("waiting").style.display = "none";
			    	document.getElementById("loading").style.display = "";
			   	 
			    }
				
			}catch(e){
				
			}
			
			
		}
		
		
		
		
		function checkIframeLoaded() {
		    // Get a handle to the iframe element
			  var iframe = document.getElementById('deviceFrame');
		    iframe.onload = function(){
		    	document.getElementById("msg").style.display = "none";
		    	document.getElementById("deviceFrame").style.display = "";
	        	console.log("I am loaded");
	        	clearInterval(messageChangeIntervalId);
				clearInterval(colorChangeIntervalId);
				return true;
	        };
		       
		       
		  
		   
		}
		function loadFrame(){
			
          
		}

		