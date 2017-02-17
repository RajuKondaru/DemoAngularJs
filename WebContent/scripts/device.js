var app = angular.module('plunker', [ 'ngSanitize'] );

app.controller('recordingMobileViewController', function($scope, $sce) {
  $scope.trustSrc = function(src) {
    return $sce.trustAsResourceUrl(src);
  }
  
  $scope.movie = {src:"http://172.16.20.118:5801/novnc/vnc_auto.html?host=172.16.20.118&port=5901&true_color=1", title:"Egghead.io AngularJS Binding"};
});
