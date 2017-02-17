<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.25/angular.min.js"></script>
 <script type="text/javascript">
 var myApp = angular.module('myApp', []);

 myApp.directive('fileModel', ['$parse', function ($parse) {
     return {
         restrict: 'A',
         link: function(scope, element, attrs) {
             var model = $parse(attrs.fileModel);
             var modelSetter = model.assign;
             
             element.bind('change', function(){
                 scope.$apply(function(){
                     modelSetter(scope, element[0].files[0]);
                 });
             });
         }
     };
 }]);

 myApp.service('fileUpload', ['$http', function ($http) {
     this.uploadFileToUrl = function( file,uploadUrl){
         var fd = new FormData();
         fd.append('file', file);
         $http.post(uploadUrl, fd, {
             transformRequest: angular.identity,
             headers: {'Content-Type': "multipart/form-data"}
         })
         .success(function(){
         })
         .error(function(){
         });
     }
 }]);

 myApp.controller('myCtrl', ['$scope','$http', 'fileUpload', function($scope, $http, fileUpload){
     
	 $scope.uploadFile = function(){
		    var formData=new FormData();
		    formData.append("file",myFile.files[0]); //myFile.files[0] will take the file and append in formData since the name is myFile.
		    $http({
		        method: 'POST',
		        url: '/upload', // The URL to Post.
		        headers: {'Content-Type': undefined}, // Set the Content-Type to undefined always.
		        data: formData,
		        transformRequest: function(data, headersGetterFunction) {
		            return data;
		        }
		    }).success(function(data, status) {  
		    })
		    .error(function(data, status) {
		    });
		}
     
 }]);
 
 </script>
</head>
<body>
<div ng-controller = "myCtrl">
   <input id="file-0a" class="file" type="file" file-model="myFile" name="myFile" />
     <button ng-click="uploadFile()">upload me</button>
</div>
</body>

</html>