var clicApp = angular.module('ClicApp', ['ngRoute','ui.bootstrap', 'ngSanitize'])
			.config(function($routeProvider) {
			    $routeProvider
				
				.when('/', {
					
			        templateUrl : 'MyDashboard.jsp',
			        
			    })
			    
			    // route for the Devices page
			    .when('/Devices', {
			    	controller  : 'DevicesController',
			        templateUrl : 'Devices.jsp'
			    })
			     // route for the Devices page
			    .when('/AllDevices', {
			    	controller  : 'GetAllDevicesController',
			    		templateUrl : 'Devices.jsp'
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
			    // route for the contact page
			    .when('/AppUpload', {
			        templateUrl : 'AppUpload.jsp',
			        //controller  : 'AppUploadController'
			    });
			});
clicApp.factory('myService', function() {
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

clicApp.controller('MainController', [ '$scope','$http', function ($scope, $http) {
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

clicApp.controller('PagiController', function($scope) {
	   $scope.filteredTodos = []
	  ,$scope.currentPage = 1
	  ,$scope.numPerPage = 5
	  ,$scope.maxSize = 5;
	  
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
	});

clicApp.controller('DevicesController', [ '$scope','$http', 'myService', '$location',function ($scope, $http, myService, $location) {
	
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
clicApp.controller('GetAllDevicesController', [ '$scope', 'myService', function ($scope, myService) {
	   $scope.selectedOs= 'Android';
	   $scope.devices = myService.get();
}]);
clicApp.controller('AppUploadController', [ '$scope', 'myService', function ($scope, myService) {
	 $scope.message = 'Here we can upload app.';
	 console.log( $scope.message);
}]);


