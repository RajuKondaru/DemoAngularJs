

	// create the module and name it scotchApp
    // also include ngRoute for all our routing needs
    var mainApp = angular.module('ClicApp', ['ngRoute','ui.bootstrap', 'ngSanitize']).config(function($routeProvider) {
        $routeProvider

        // route for the dashboard page
        .when('/', {
            templateUrl : 'MyDashboard.jsp',
            controller  : 'PagiController'
        })
        
        // route for the Web page
        .when('/AndroidWeb', {
            templateUrl : 'AddAndroidWebConfig.jsp',
            controller  : 'getAllWebConfigController'
        })
         .when('/IOSWeb', {
            templateUrl : 'AddIOSWebConfig.jsp',
            controller  : 'getAllWebConfigController'
        })
         .when('/AppUpload', {
	        templateUrl : 'AppUpload.jsp',
	        //controller  : 'UploadController'
	    })
	     .when('/NewApp', {
	        templateUrl : 'AppUpload.jsp',
	        controller  : 'ViewController'
	    })
	   
	     .when('/UpdateDashboard', {
	        templateUrl : 'MyDashboard.jsp',
	        controller  : 'UpdateDashboardController'
	    })
	     .when('/Trash/:id', {
	        templateUrl : 'MyDashboard.jsp',
	        controller  : 'TrashController',
	        	controllerAs: "app"
	    })
	    .when('/Active/:id', {
	        templateUrl : 'MyDashboard.jsp',
	        controller  : 'ActiveController',
	        	controllerAs: "app"
	    })
	    
	    
	    
        // route for the App page
        .when('/AndroidNative', {
            templateUrl : 'AndroidNative.jsp',
            controller  : 'appController'
        })
         .when('/IOSNative', {
            templateUrl : 'IOSNative.jsp',
            controller  : 'appController'
        })

        // route for the Hybrid page
        .when('/AndroidHybrid', {
            templateUrl : 'AndroidHybrid.jsp',
            controller  : 'hybridController'
        })
        .when('/IOSHybrid', {
            templateUrl : 'IOSHybrid.jsp',
            controller  : 'hybridController'
        })
      
        // route for the Devices page
        .when('/Devices/:id', {
            controller  : 'DevicesController',
            templateUrl : 'Devices.jsp',
        })
         // route for the Devices page
        .when('/AllDevices', {
            controller  : 'getAllDevicesController',
            templateUrl : 'Devices.jsp',
        })
       
       
        // route for the RecordingMobileView page
        .when('/RecordingMobileView', {
            controller  : 'recordingMobileViewController',
            templateUrl : 'RecordingMobileView.jsp'
        })
        /* // route for the RecordingMobileView page
        .when('/GetDevice', {
        	 controller  : 'DeviceController',
        	 templateUrl : 'RecordingMobileView.jsp'
        		 
        })*/
        // route for the RecordingMobileView page
        .when('/MobileView', {
            controller  : 'mobileViewController',
            templateUrl : 'RecordingMobileView.jsp'
        })
        // route for the RecordingMobileView page
        .when('/AddWebConfig', {
            controller  : 'getAllWebConfigController',
            templateUrl : 'AddWebConfig.jsp'
        })
         .when('/updateWebConfig', {
            controller  : 'updateWebConfigController',
            templateUrl : 'AddWebConfig.jsp'
        })
         .when('/TestSuitePrepare', {
            controller  : 'testSuiteConfigController',
            templateUrl : 'TestSuite.jsp'
        })
         .when('/AndroidPlatform', {
          
            templateUrl : 'AndroidTestType.jsp',   
            controller  : 'androidPlatformController'
            
        })
        .when('/IOSPlatform', {
          
            templateUrl : 'IOSTestType.jsp',   
            controller  : 'iosPlatformController'
            
        })
         .when('/AndroidManual', {
          
            templateUrl : 'AndroidManualAppType.jsp',   
            controller  : 'androidManualAppController'
            
        })
        .when('/AndroidAutomation', {
          
            templateUrl : 'AndroidAutomationAppType.jsp',   
            controller  : 'androidAutomationAppController'
            
        })
         .when('/IOSManual', {
          
            templateUrl : 'IOSManualAppType.jsp',   controller  : 'iosManualAppController'
            
        })
        .when('/IOSAutomation', {
          
            templateUrl : 'IOSAutomationAppType.jsp',   controller  : 'iosAutomationAppController'
            
        });
        
    });
    mainApp.factory('$device', function() {
    	 var savedData = {}
    	 function set(data) {
    	   savedData = data;
    	 }
    	 function get() {
    	  return savedData;
    	 }

    	 return {
    	  set: set,
    	  get: get
    	 }

    	});
    mainApp.factory('$app', function() {
   	 var savedData = {}
   	 function set(data) {
   	   savedData = data;
   	 }
   	 function get() {
   	  return savedData;
   	 }

   	 return {
   	  set: set,
   	  get: get
   	 }

   	});
    
   
    mainApp.controller('ViewController', function($scope) {
    	$scope.loadScript = function(url, type, charset) {
    		if (type===undefined) type = 'text/javascript';
    	    if (url) {
    	        var script = document.querySelector("script[src*='"+url+"']");
    	        if (!script) {
    	            var view = document.getElementById("page-view");
					//console.log( view );
    	                if (view) {
    	                    script = document.createElement('script');
    	                    script.setAttribute('src', url);
    	                    script.setAttribute('type', type);
    	                    if (charset) script.setAttribute('charset', charset);
    	                    view.appendChild(script);
    	                }
    	           
    	        }
    	        return script;
    	    }
    	};
    	
    	$scope.loadScript('../js/fileuploadstyle.js', 'text/javascript', 'utf-8');
    	
    	$( "#Web" ).click(function() {
	 		   $( "#Web" ).addClass("active");
	 		   $( "#App" ).removeClass('active');
	 		   $( "#web" ).show();
	 		   $( "#app" ).hide();
	 		 
	 		 });
	   $( "#App" ).click(function() {
		   $( "#App" ).addClass("active");
		   $( "#Web" ).removeClass('active')
		   $( "#app" ).show();
		   $( "#web" ).hide();
		   
	    	$( ".buttonText" ).html( "New App" );
			$( ".icon-span-filestyle" ).removeClass('icon-span-filestyle glyphicon glyphicon-cloud-upload').addClass("glyphicon glyphicon-cloud-upload");
			$( ".buttonText" ).css('color', 'white');
			$( ".glyphicon-phone" ).css('color', 'white');
			$( ".btn-primary " ).css('width', '100px');
	    	$(".buttonText").ready(function() {
	    		//alert( "Load was performed." );
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
	    			        		ajax.open("POST", "https://localhost:8443/DemoAngularJs/AppUpload?appName=" + $scope.appname + "&appVersion=" + $scope.appversion+" &apptype=native", true);
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
	    		    		var appName = jsonData["appName"];
	    		    		var versionName = jsonData["version"];
	    		    		var packageName = jsonData["packageName"];
	    		    		var activityName = jsonData["activityName"];
	    				      var statusVal = JSON.stringify(res.status);
	    						 if(statusVal == "false") {
	    					     	$("#message").html("<font color='red'>"+JSON.stringify(response.message)+"</font>");
	    					     	
	    					     } else{
	    					    	$(".progress").css("display", "none");
	    					    	 $('#kv-success-2').html('<h4>Upload Status</h4><span></span>').hide();
	    					    		 var out = '';
	    					    	         out = out + 
	    					    	         "<div   style=' float: left;width: 150px;padding: 30px;'>"+
	    		                           		"<img alt='' src='data:image/png;base64,"+image+"'>"+
	    		                                "</div>"+    
	    		                                "<div style=' padding-left: 115px;'>"+
	    			                                   " <span class='label label-default'>App Name</span><span style='text-align: initial;'>"+appName+"</span><br>"+
	    			                                   " <span class='label label-default'>Version</span><span style='text-align: initial;'>"+versionName+"</span><br>"+
	    			                                   " <span class='label label-default'>Package</span><span style='text-align: initial;'>"+packageName+"</span><br>"+
	    			                                   " <span class='label label-default'>Activity</span><span style='text-align: initial;'>"+activityName+"</span><br>"+
	    		                                "</div>"+ '<ul></ul><li>' + 'Uploaded file # ' +  appName + ' successfully.' + '</li>';
	    					    	    $('#kv-success-2 span').append(out);
	    					    	    $('#kv-success-2').fadeIn('slow');
	    					    	    $('#kv-success-2').show().delay(5000).fadeOut();
	    					    	 $("#appview").show().delay(5000).fadeOut();
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
	    		    	
	    				console.log( "ViewController was performed." );
	    				
	    			 });
		 });
    	
    	
		    	
    
    });
    
    var appid;
    
    mainApp.controller('TrashController', [ '$scope','$http', '$app', '$location', '$routeParams',function ($scope, $http, $app, $location, $routeParams) {
    			
    		 appid =  $routeParams.id;
    		 console.log('appid ::'+ appid);
    		 $http({
    	            method : 'POST',
    	            url : '../MoveToArchiveApp',
    	            data :{
 	                   'appid' : appid,
 	                   'status' : "Archive"
 	               }
    	   	    }).success(function(data, status, headers, config) {
    	   	    	$http({
    	   	            method : 'POST',
    	   	            url : '../UpdateDashboard',
    	   	            data :''
    	   	   	    }).success(function(data, status, headers, config) {
    	   	   	    	$app.set(data);
    	   	   	    	appssize = data.length;
    	   	   	    	console.log('PagiController'+ data.length);
    	   	   	    	$location.path('/UpdateDashboard');
    	   	   	    }).error(function(data, status, headers, config) {
    	   	   	            // called asynchronously if an error occurs
    	   	   	            // or server returns response with an error status.
    	   	   	    	
    	   	   	    });
    	   	    }).error(function(data, status, headers, config) {
    	   	            // called asynchronously if an error occurs
    	   	            // or server returns response with an error status.
    	   	    	
    	   	    });
    	
    	
    }]);
    mainApp.controller('ActiveController', [ '$scope','$http', '$app', '$location', '$routeParams',function ($scope, $http, $app, $location, $routeParams) {
		
		 appid =  $routeParams.id;
		 console.log('appid ::'+ appid);
		 $http({
	            method : 'POST',
	            url : '../MoveToActiveApp',
	            data :{
                   'appid' : appid,
                   'status' : "Active"
               }
	   	    }).success(function(data, status, headers, config) {
	   	    	$http({
	   	            method : 'POST',
	   	            url : '../UpdateDashboard',
	   	            data :''
	   	   	    }).success(function(data, status, headers, config) {
	   	   	    	$app.set(data);
	   	   	    	appssize = data.length;
	   	   	    	console.log('PagiController'+ data.length);
	   	   	    	$location.path('/UpdateDashboard');
	   	   	    }).error(function(data, status, headers, config) {
	   	   	            // called asynchronously if an error occurs
	   	   	            // or server returns response with an error status.
	   	   	    	
	   	   	    });
	   	    }).error(function(data, status, headers, config) {
	   	            // called asynchronously if an error occurs
	   	            // or server returns response with an error status.
	   	    	
	   	    });
	
	
    }]);
    mainApp.controller('DashboardHomeController', function($scope) {
        $scope.message = 'we are in Dashboard';
    });
    mainApp.controller('webController', function($scope) {
        $scope.message = 'Here we can test Mobile Web Applications';
    });
    var appssize;
    mainApp.controller('PagiController', [ '$scope','$http', '$app', '$location',function ($scope, $http, $app, $location) {
    	
    	$http({
            method : 'POST',
            url : '../UpdateDashboard',
            data :''
   	    }).success(function(data, status, headers, config) {
   	    	$app.set(data);
   	    	appssize = data.length;
   	    	
   	    	console.log('PagiController'+ data.length);
   	    	 $location.path('/UpdateDashboard');
   	    	 
   	    }).error(function(data, status, headers, config) {
   	            // called asynchronously if an error occurs
   	            // or server returns response with an error status.
   	    	
   	    });
    	
    	
    	
 	  
 	 
    }]);

    mainApp.controller('appController', function($scope) {
        $scope.message = 'Here we can test Mobile APK Applications.';
    });
    mainApp.controller('androidPlatformController', function($scope) {
    	
        $scope.message = 'Here we can select Android test type.';
    });
    mainApp.controller('iosPlatformController', function($scope) {
    	
        $scope.message = 'Here we can select IOS test type.';
    });
    
	    
	 mainApp.controller('androidManualAppController', function($scope) {
	    	
	        $scope.message = 'Here we can select Android Manual App type.';
	    });
	 mainApp.controller('iosManualAppController', function($scope) {
	 	
	     $scope.message = 'Here we can select IOS Manual App type.';
	 });
	 mainApp.controller('androidAutomationAppController', function($scope) {
	 	
	     $scope.message = 'Here we can select Android Automation App type.';
	 });
	 mainApp.controller('iosAutomationAppController', function($scope) {
	 	
	     $scope.message = 'Here we can select IOS Automation App type.';
	 });
 
 
    mainApp.controller('hybridController', function($scope) {
        $scope.message = 'Here we can test Mobile Hybrid Applications.';
    });
    mainApp.controller('getAllWebConfigController', [ '$scope','$http', function ($scope, $http) {
            $http({
	            method : 'POST',
	            url : '../getAllWebConfigurations',
	            data :''
		    }).success(function(data, status, headers, config) {
		    	 $scope.webConfigs=data;
		    	 //console.log('getAllWebConfigController'+ data);
		    }).error(function(data, status, headers, config) {
		            // called asynchronously if an error occurs
		            // or server returns response with an error status.
		    	
		    });
       
        
       
     }]);
   
    mainApp.controller('DevicesController', [ '$scope','$http', '$device', '$location',function ($scope, $http, $device, $location) {
    	 var appid;
    	$scope.getAllDevices = function(event){
    		 appid = event.target.id;
    		 console.log(appid);
    		 $http({
  	            method : 'POST',
  	            url : '../GetAllDevices',
  	            data :{
	                   'appid' : appid
	               }
  		    }).success(function(data, status, headers, config) {
  		    	if(data!=null){
  		    		 $device.set(data);
  	  		    	 console.log(data);
  		    	}
  		    	
  		    	 $location.path('/AllDevices');
  		        
  		    }).error(function(data, status, headers, config) {
  		            // called asynchronously if an error occurs
  		            // or server returns response with an error status.
  		    	//document.getElementById("webconfigid").;
  		    });
 		    
    	 }
    		
    }]);
    
    
    mainApp.controller('recordingMobileViewController', ['$scope','$device', function($scope, $device) {
        $scope.device = $device.get();
         
     }]);
    var deviceName;
    mainApp.controller('DeviceController', [ '$scope','$http', '$device',	'$location',function ($scope, $http, $device, $location) {
    	 	
    	   $scope.getDataFromServer = function(event) {
    	   	deviceName = event.target.id;
    	   	console.log(deviceName);
    			$http({
    	               method : 'POST',
    	               url : '../GetDevice',
    	               data :{
    	                   'deviceName' : deviceName
    	               }
    	       }).success(function(data, status, headers, config) {
    	       	 $device.set(data);
    	       	 $location.path('/MobileView');
    	           
    	       }).error(function(data, status, headers, config) {
    	               // called asynchronously if an error occurs
    	               // or server returns response with an error status.
    	       	
    	       });

    	   };
		
    }]);
    
    
    // configure our routes
    mainApp.controller('mobileViewController', ['$scope', '$sce' ,'$device', function($scope, $sce, $device) {
    	  $scope.trustSrc = function(src) {
    		  console.log(src);
    		    return $sce.trustAsResourceUrl(src);
    		  }
    		  
    	  $scope.device = $device.get();
    }]);
    
   mainApp.controller('addWebConfigController', [ '$scope','$http', '$app','$location',function ($scope, $http, $app, $location) {
	    $scope.submitForm = function() {
	        console.log("posting data....");
	       
	        $http({
                method : 'POST',
                url : '../SaveWebApp',
                data :{
                    'url' : $scope.weburl ,
                    'name' : $scope.webname ,
                    'version' : $scope.webversion,
                    'iconurl' : $scope.weburl+'/favicon.ico',
                    'apptype' :'webapp'	
                }
	        }).success(function(data, status, headers, config) {
	        	 
	        	 if(status==200){
	        		 $app.set(data);
	        		//$location.path('/updateWebConfig');
	        		 //console.log('addWebConfigController'+ data +status);
	        	 }
	        	
	           
	        }).error(function(data, status, headers, config) {
	                // called asynchronously if an error occurs
	                // or server returns response with an error status.
	        	
	        });
		};

	 }]);
   mainApp.controller('updateWebConfigController', [ '$scope', '$app', function ($scope, $app) {
	   $scope.webConfigs = $app.get();
   }]);
   mainApp.controller('UpdateDashboardController', [ '$scope', '$app', function ($scope, $app) {
	   var activeApps=[];
	   var archiveApps=[];
	  
	   $scope.apps=  $app.get();
	   angular.forEach($scope.apps,function(value,index){
		   if(value.status=="Active"){
			   console.log("Uploaded Date:: "+value.uploadedDate);
			   var up_date = getTimeStamp(value.uploadedDate);
			   value.uploadedDate=up_date;
			   activeApps.push(value);
		   } else {
			   console.log("Archive:: "+value);
			   var up_date=getTimeStamp(value.uploadedDate);
			   value.uploadedDate=up_date;
			   
			   archiveApps.push(value);
		   }
		   
       });
	   
	   $scope.appinfo = activeApps;
	   $scope.archiveappinfo = archiveApps;
	   console.log(archiveApps.length);
	   console.log(activeApps.length);
	   $( "#Active" ).click(function() {
		   $( "#Active" ).addClass("active");
		   $( "#Archive" ).removeClass('active');
		   $( "#active" ).show();
		   $( "#archive" ).hide();
		   if(activeApps.length<1){
			   $( "#activeerror" ).show();
			   $( "#archiveerror" ).hide();
			   $( "#active" ).hide();
			   $( "#archive" ).hide();
			
		   } else {
			   $( "#activeerror" ).hide();
			   $( "#archiveerror" ).hide();
			   $( "#active" ).show();
			   $( "#archive" ).hide();
		   }
		 });
	   $( "#Archive" ).click(function() {
		   $( "#Archive" ).addClass("active");
		   $( "#Active" ).removeClass('active')
		   $( "#archive" ).show();
		   $( "#active" ).hide();
		   $( "#activeerror" ).hide();
		   if(archiveApps.length<1){
			   $( "#archiveerror" ).show();
			   $( "#archive" ).hide();
			   $( "#active" ).hide();
			  
		   } else {
			   $( "#archiveerror" ).hide();
			   $( "#archive" ).show();
			   $( "#active" ).hide();
		   }
		 });
	   
	   $( "#Tasks" ).click(function() {
		   $( "#Tasks" ).addClass("active");
		   $( "#Activity" ).removeClass('active');
		   $( "#tasks" ).show();
		   $( "#activity" ).hide();
		 
		 });
	   $( "#Activity" ).click(function() {
		   $( "#Activity" ).addClass("active");
		   $( "#Tasks" ).removeClass('active')
		   $( "#activity" ).show();
		   $( "#tasks" ).hide();
		 });
	   if(activeApps.length<1){
		   $( "#archiveerror" ).hide();
		   $( "#activeerror" ).show();
		   $( "#active" ).hide();
		   $( "#archive" ).hide();
		   
	   } else {
		   $( "#active" ).show();
		   $( "#archive" ).hide();
		   $( "#archiveerror" ).hide();
		   $( "#activeerror" ).hide();
	   }
	   $scope.filteredTodos = []
	 	  ,$scope.currentPage = 1
	 	  ,$scope.numPerPage = 5
	 	  ,$scope.maxSize = Math.ceil(appssize/5);
	 	  
	 	  $scope.makeTodos = function() {
	 	    $scope.todos = [];
	 	    for (i=1;i<=1000;i++) {
	 	      $scope.todos.push({ text:'todo '+i, done:false});
	 	    }
	 	  };
	 	  $scope.makeTodos(); 
	 	  
	 	  $scope.$watch('currentPage + numPerPage', function() {
	 	    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
	 	    , end = begin + $scope.numPerPage;
	 	    
	 	    $scope.filteredTodos = $scope.todos.slice(begin, end);
	 	  });
	   
   }]);
   mainApp.controller('getAllDevicesController', [ '$scope', '$device', function ($scope, $device) {
	   $scope.selectedOs= 'Android';
	   $scope.devices = $device.get();
	   if($scope.devices=="null"){
		   console.log("Error:: "+$scope.devices);
		   $( "#deviceserror" ).css('display', 'block');
		   $( "#devicesView" ).css('display', 'none');
		   
	   } else {
		   console.log($scope.devices);
		   $( "#devicesView" ).css('display', 'block');
		   $( "#deviceserror" ).css('display', 'none');
	   }
   }]);
   mainApp.controller('AppUploadController', [ '$scope', '$app', function ($scope, $app) {
		 $scope.message = 'Here we can upload app.';
		 console.log( $scope.message);
	}]);

   
   
  var getTimeStamp=  function(input, p_allowFuture) {
           var substitute = function (stringOrFunction, number, strings) {
                   var string = $.isFunction(stringOrFunction) ? stringOrFunction(number, dateDifference) : stringOrFunction;
                   var value = (strings.numbers && strings.numbers[number]) || number;
                   return string.replace(/%d/i, value);
               },
               nowTime = (new Date()).getTime(),
               date = (new Date(input)).getTime(),
               
               //refreshMillis= 6e4, //A minute
               allowFuture = p_allowFuture || false,
               strings= {
                   prefixAgo: null,
                   prefixFromNow: null,
                   suffixAgo: "ago",
                   suffixFromNow: "from now",
                   second: "Just Now",
                   seconds: "%d seconds",
                   minute: "about a minute",
                   minutes: "%d minutes",
                   hour: "about an hour",
                   hours: "%d hours",
                   day: "a day",
                   days: "%d days",
                   month: "a month",
                   months: "%d months",
                   year: "about a year",
                   years: "%d years"
               },
               dateDifference = nowTime - date,
               words,
               seconds = Math.abs(dateDifference) / 1000,
               
               minutes = seconds / 60,
               hours = minutes / 60,
               days = hours / 24,
               years = days / 365,
               separator = strings.wordSeparator === undefined ?  " " : strings.wordSeparator,
           
               // var strings = this.settings.strings;
               prefix = strings.prefixAgo,
               suffix = strings.suffixAgo;
               seconds = Math.round(seconds);
               console.log(seconds);
           if (allowFuture) {
               if (dateDifference < 0) {
                   prefix = strings.prefixFromNow;
                   suffix = strings.suffixFromNow;
               }
           }

           words = seconds < 10 && substitute(strings.second, seconds, strings) ||
           seconds > 10 && seconds < 59 && substitute(strings.seconds, seconds, strings) ||
           minutes < 59 && substitute(strings.minutes, Math.round(minutes), strings) ||
           minutes < 59 && substitute(strings.hour, 1, strings) ||
           hours < 24 && substitute(strings.hours, Math.round(hours), strings) ||
           hours < 42 && substitute(strings.day, 1, strings) ||
           days < 30 && substitute(strings.days, Math.round(days), strings) ||
           days < 45 && substitute(strings.month, 1, strings) ||
           days < 365 && substitute(strings.months, Math.round(days / 30), strings) ||
           years < 1.5 && substitute(strings.year, 1, strings) ||
           substitute(strings.years, Math.round(years), strings);

           return $.trim([prefix, words, suffix].join(separator));
           // conditional based on optional argument
           // if (somethingElse) {
           //     out = out.toUpperCase();
           // }
           // return out;
       }
  
 
