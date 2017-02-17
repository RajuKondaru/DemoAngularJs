<html ng-app="ClicApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.25/angular.min.js"></script>
 <script type="text/javascript">
 var mainApp = angular.module('ClicApp', []);

 mainApp.directive('fileModel', ['$parse', function ($parse) {
     return {
         restrict: 'EA',
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



 mainApp.controller('myCtrl', ['$scope','$http',  function($scope, $http){
     
	 $scope.uploadFile = function(){
		    var formData=new FormData();
		    formData.append("file",$scope.myFile); //myFile.files[0] will take the file and append in formData since the name is myFile.
		    $http({
		        method: 'POST',
		        url: 'UploadServlet', // The URL to Post.
		        headers: {'Content-Type': undefined}, // Set the Content-Type to undefined always.
		        data: formData,
		        transformRequest: function(data, headersGetterFunction) {
		            return data;
		        }
		    }).success(function(data, status) {  
		    	//$scope.AppInfo=data;
		    	console.log(data);
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
<!-- <div>
<img alt="" src="data:image/png;base64,{{AppInfo.imgBase64String}}"><br>
	{{AppInfo.activityName}}<br>
	{{AppInfo.packageName}}<br>
	{{AppInfo.fileName}}<br>
	{{AppInfo.versionName}}

</div> -->
</body>

</html>