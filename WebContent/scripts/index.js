
	// create the module and name it scotchApp
    // also include ngRoute for all our routing needs
    var indexApp = angular.module('indexApp', ['ngRoute']);
   
    // configure our routes
    indexApp.config(function($routeProvider) {
        $routeProvider
        	
        	.when('/', {
                templateUrl : 'pages/home.html',
                controller  : 'mainController'
            })

            // route for the about page
            .when('/about', {
                templateUrl : 'pages/about.html',
                controller  : 'aboutController'
            })

            // route for the contact page
            .when('/contact', {
                templateUrl : 'pages/contact.html',
                controller  : 'contactController'
            });
    });
    
 // create the controller and inject Angular's $scope
    indexApp.controller('mainController', function($scope) {
        // create a message to display in our view
        $scope.message = 'Everyone come and see how good I look!';
       
    });

    indexApp.controller('aboutController', function($scope) {
        $scope.message = 'Look! I am an about page.';
    });

    indexApp.controller('contactController', function($scope) {
        $scope.message = 'Contact us! RJ. This is just a demo.';
    });
    indexApp.controller('dashboardController', function($scope) {
        $scope.message = 'dashboard! RJ. This is just a demo.';
    });
   
    indexApp.controller('loginController', [ '$scope','$http','$location','$window', function ($scope, $http, $location, $window) {
	    $scope.submitLogin = function() {
	       
	        $http({
                method : 'POST',
                url : 'login',
                data :{
                    'username' : $scope.username ,
                    'password' : $scope.password 
                   
                }
	        }).success(function(data, status, headers, config) {
	        	 console.log("success login");
	        	//alert(data);
	        	//$location.path('/dashboard');
	        	$window.location.href = 'pages/dashboard.jsp';
	           
	        }).error(function(data, status, headers, config) {
	        	 console.log("failure login");
	                // called asynchronously if an error occurs
	                // or server returns response with an error status.
	        	$window.location.href = 'index.jsp';
	        	
	        });
	        console.log("posting data....");
		};

	 }]);