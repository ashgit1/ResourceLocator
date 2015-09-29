var nameSpace = angular.module("ResourceApp", []);

nameSpace.controller("ResourceFunction", ['$scope','$http', function($scope, $http)
		{    
			$http.get('js/data.json').success (function(data){
				$scope.resourceVariable = data;
			}); 
		}]
);