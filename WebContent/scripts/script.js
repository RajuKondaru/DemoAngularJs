	

	// create the module and name it scotchApp
    // also include ngRoute for all our routing needs
    var mainApp = angular.module('mainApp', [
        'ngRoute', 
        'ngSanitize'
        ]).config(function($routeProvider) {
        $routeProvider

        // route for the dashboard page
        .when('/', {
            templateUrl : 'DashboardHome.jsp',
            controller  : 'dashboardHomeController'
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
        .when('/Devices', {
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
         // route for the RecordingMobileView page
        .when('/GetDevice', {
        	 controller  : 'DeviceController',
        	 templateUrl : 'RecordingMobileView.jsp'
        		 
        })
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
          
            templateUrl : 'AndroidTestType.jsp',   controller  : 'androidPlatformController'
            
        })
        .when('/IOSPlatform', {
          
            templateUrl : 'IOSTestType.jsp',   controller  : 'iosPlatformController'
            
        })
         .when('/AndroidManual', {
          
            templateUrl : 'AndroidManualAppType.jsp',   controller  : 'androidManualAppController'
            
        })
        .when('/AndroidAutomation', {
          
            templateUrl : 'AndroidAutomationAppType.jsp',   controller  : 'androidAutomationAppController'
            
        })
         .when('/IOSManual', {
          
            templateUrl : 'IOSManualAppType.jsp',   controller  : 'iosManualAppController'
            
        })
        .when('/IOSAutomation', {
          
            templateUrl : 'IOSAutomationAppType.jsp',   controller  : 'iosAutomationAppController'
            
        });
        
    });
    mainApp.factory('myService', function() {
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
   
    
    mainApp.controller('dashboardHomeController', function($scope) {
        $scope.message = 'we are in Dashboard';
    });
    mainApp.controller('webController', function($scope) {
        $scope.message = 'Here we can test Mobile Web Applications';
    });

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
    mainApp.controller('devicesController', [ '$scope','$http', 'myService', '$location',function ($scope, $http, myService, $location) {
    	
    		 $http({
 	            method : 'POST',
 	            url : '../GetAllDevices',
 	            data :''
 		    }).success(function(data, status, headers, config) {
 		    	 myService.set(data);
 		    	 console.log(data);
 		    	 $location.path('/AllDevices');
 		        
 		    }).error(function(data, status, headers, config) {
 		            // called asynchronously if an error occurs
 		            // or server returns response with an error status.
 		    	//document.getElementById("webconfigid").;
 		    });
		    
    }]);
    
    
    mainApp.controller('recordingMobileViewController', ['$scope','myService', function($scope, myService) {
        $scope.device = myService.get();
         
     }]);
    var deviceName;
    mainApp.controller('DeviceController', [ '$scope','$http', 'myService',	'$location',function ($scope, $http, myService, $location) {
    	 
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
    	       	 myService.set(data);
    	       	 $location.path('/MobileView');
    	           
    	       }).error(function(data, status, headers, config) {
    	               // called asynchronously if an error occurs
    	               // or server returns response with an error status.
    	       	
    	       });

    	   };
		
    }]);
    
    
    // configure our routes
    mainApp.controller('mobileViewController', ['$scope', '$sce' ,'myService', function($scope, $sce, myService) {
    	  $scope.trustSrc = function(src) {
    		  console.log(src);
    		    return $sce.trustAsResourceUrl(src);
    		  }
    		  
    	  $scope.device = myService.get();
    }]);
    
   mainApp.controller('addWebConfigController', [ '$scope','$http', 'myService','$location',function ($scope, $http, myService, $location) {
	    $scope.submitForm = function() {
	        console.log("posting data....");
	        $http({
                method : 'POST',
                url : '../SaveWebConfigurations',
                data :{
                    'url' : $scope.web.url ,
                    'name' : $scope.web.name ,
                    'version' : $scope.web.version 
                }
	        }).success(function(data, status, headers, config) {
	        	 
	        	 if(status==200){
	        		myService.set(data);
	        		$location.path('/updateWebConfig');
	        		 //console.log('addWebConfigController'+ data +status);
	        	 }
	        	
	           
	        }).error(function(data, status, headers, config) {
	                // called asynchronously if an error occurs
	                // or server returns response with an error status.
	        	
	        });
		};

	 }]);
   mainApp.controller('updateWebConfigController', [ '$scope', 'myService', function ($scope, myService) {
	   $scope.webConfigs = myService.get();
   }]);
   mainApp.controller('getAllDevicesController', [ '$scope', 'myService', function ($scope, myService) {
	   $scope.selectedOs= 'Android';
	   $scope.devices = myService.get();
   }]);
   
   
  
	
