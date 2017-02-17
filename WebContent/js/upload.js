

$(".buttonText").load(function() {
	alert( "Load was performed." );
			$( ".buttonText" ).html( "New App" );
			$( ".icon-span-filestyle" ).removeClass('icon-span-filestyle glyphicon glyphicon-folder-open').addClass("glyphicon glyphicon-phone");
			$( ".buttonText" ).css('color', 'white');
			$( ".glyphicon-phone" ).css('color', 'white');
			$( ".btn-primary " ).css('width', '100px');
			
			var allowedFiles = [".apk", ".ipa", ".app"];
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
		        		ajax.open("POST", " ${pageContext.servletContext.contextPath}/UploadServlet", true);
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
	    		var image = jsonData["imgBase64String"];
	    		var fileName = jsonData["fileName"];
	    		var versionName = jsonData["versionName"];
	    		var packageName = jsonData["packageName"];
	    		var activityName = jsonData["activityName"];
			      var statusVal = JSON.stringify(res.status);
					 if(statusVal == "false") {
				     	$("#message").html("<font color='red'>"+JSON.stringify(response.message)+"</font>");
				     	
				     } else{
				    	$(".progress").css("display", "none");
				    	 $('#kv-success-2').html('<h4>Upload Status</h4><span></span>').hide();
				    	/*  var inner="";
				    	 
				    	 inner="<div class='info-block block-info clearfix' >"+
			    				   "<div   style=' float: left;   height: 100px; width: 100px;'>"+
                                   		"<img alt='' src='data:image/png;base64,"+image+"'>"+
                                   "</div>"+    
                                   "<div>"+
	                                   "<span style='text-align: initial;'>"+fileName+"</span>"+
	                                   "<span style='text-align: initial;'>"+versionName+"</span>"+
	                                   "<span style='text-align: initial;'>"+packageName+"</span>"+
	                                   "<span style='text-align: initial;'>"+activityName+"</span>"+
                                   "</div>"+ 
	                            "</div>"+inner;
				    	 $("#appview").html(inner);  */
				    	 
				    	 var out = '';
				    	    
				    	        out = out + 
				    	         "<div   style=' float: left;width: 150px;padding: 30px;'>"+
	                           		"<img alt='' src='data:image/png;base64,"+image+"'>"+
	                                "</div>"+    
	                                "<div style=' padding-left: 115px;'>"+
		                                   " <span class='label label-default'>App Name</span><span style='text-align: initial;'>"+fileName+"</span><br>"+
		                                   " <span class='label label-default'>Version</span><span style='text-align: initial;'>"+versionName+"</span><br>"+
		                                   " <span class='label label-default'>Package</span><span style='text-align: initial;'>"+packageName+"</span><br>"+
		                                   " <span class='label label-default'>Activity</span><span style='text-align: initial;'>"+activityName+"</span><br>"+
	                                "</div>"+ '<ul></ul><li>' + 'Uploaded file # ' +  fileName + ' successfully.' + '</li>';
				    	    $('#kv-success-2 span').append(out);
				    	    $('#kv-success-2').fadeIn('slow');
				    	    //$('#kv-success-2').show().delay(5000).fadeOut();
				    	// $("#appview").show().delay(5000).fadeOut();
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
		