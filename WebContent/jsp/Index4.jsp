<!DOCTYPE html>
<html>
<head>
<title>Asynchronous file Upload in Java Web Application</title>
 <script type="text/javascript" src="http://localhost:8080/DemoAngularJs/js/jquery.min.js"></script>  



<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-filestyle/1.2.1/bootstrap-filestyle.js"></script>
  <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" />
 <!-- Warming Up -->
<!-- Latest compiled and minified JavaScript -->
<script type="text/javascript" src="http://localhost:8080/DemoAngularJs/js/bootstrap.min.js"></script>
<script lang="Javascript">

	$(document).ready(function() {
		$( ".buttonText" ).html( "New App" );
		$( ".icon-span-filestyle" ).removeClass('icon-span-filestyle glyphicon glyphicon-folder-open').addClass("glyphicon glyphicon-phone");
		var allowedFiles = [".apk"];
		var regex = new RegExp("(" + allowedFiles.join('|') + ")$");
		
	     $('#appfile').change(function(e){
	    	 if (!regex.test($('#appfile').val().toLowerCase())) {
	    		 $('#message').html("<font color='red'>"+"Please upload files having extensions: <b>" + allowedFiles.join(', ') + "</b> only."+"</font>");
	    		 $("#message").show().delay(5000).fadeOut();
	             return false;
	         } else{
	        	 var file = this.files[0];
	             var form = new FormData();
	             form.append('app', file);
	             
	    	     
	    	     $(".progress").css("display", "block");
	        	 $("#progressbar").css('width',0+'%');
	        		var ajax = new XMLHttpRequest();
	        		ajax.upload.addEventListener("progress", progressHandler, false);
	        		ajax.addEventListener("load", completeHandler, false);
	        		ajax.addEventListener("error", errorHandler, false);
	        		ajax.addEventListener("abort", abortHandler, false);
	        		ajax.open("POST", "./upload", true);
	        		ajax.responseType = "text";
	        		ajax.send(form);
	         }
	        
					
					 	
	     });
	    function progressHandler(event){
    		var percent = (event.loaded / event.total) * 100;
    		$("#progressbar").css('width',percent+'%');
    		$("#progressbar").html(percent+'%');
	    }
    	function completeHandler(event){
    		var res = event.target.responseText;
    		//var json = JSON.parse(res);
    		var jsonData=JSON.parse(res);
    		console.log(jsonData);
    		 
		      var statusVal = JSON.stringify(res.status);
				 if(statusVal == "false") {
			     	$("#message").html("<font color='red'>"+JSON.stringify(response.message)+"</font>");
			     	
			     } else{
			    		
			     }
			  
    	}
    	function errorHandler(event){
    		$('#message').html = "Upload Failed";
    		$('#message').show();
    	}
    	function abortHandler(event){
    		$('#message').html = "Upload Aborted";
    		$('#message').show();

    	}
    });
	
	
	
	
</script>

</head>
<body>

<form style="margin-bottom: 20px;">
	<div class="centered" style="margin: auto; width: 30%;">
	       
	        <input id='appfile' type="file" class="filestyle" name="file" data-buttonName="btn-primary">
	      
	        <div id="message" style="margin: 10px;"></div>
	        
	</div>

</form>
	<div class="progress" style="display: none; width: 50%; margin: auto;">
  		<div id='progressbar' class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:10%"></div>
	</div>


</body>
</html>