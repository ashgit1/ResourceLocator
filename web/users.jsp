<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users</title>
<script type="text/javascript" src="js/Angular/angular.min.js"></script>
<script>
	var app = angular.module('myApp', []);

	function MyController($scope, $http) {

		$scope.getDataFromServer = function() {
			$http({
				method : 'GET',
				url : 'UserServlet'
			}).success(function(data, status, headers, config) {
				$scope.users = data;
			}).error(function(data, status, headers, config) {
				// called asynchronously if an error occurs
				// or server returns response with an error status.
				alert("Error while fetching the records for users.");
			});

		};
	};
</script>
</head>
<body>

<style>
table, th , td {
  border: 1px solid grey;
  border-collapse: collapse;
  padding: 5px;
}
table tr:nth-child(odd) {
  background-color: #f1f1f1;
}
table tr:nth-child(even) {
  background-color: #ffffff;
}
</style>

	<div ng-app="myApp">
		<div ng-controller="MyController">
			<button ng-click="getDataFromServer()">Fetch User from server</button><br/><br/>
			Search for person: <input type="text" ng-model="search"></br> </br>

			<table border="1">
				<th>Id</th>
				<th>FirstName</th>
				<th>LastName</th>
				<tr ng-repeat="x in users | filter:search | orderBy:'user_id' ">
					<td>{{ x.user_id  }}</td>
					<td>{{ x.user_first_name  }}</td>
					<td>{{ x.user_last_name  }}</td>
				</tr>
			</table>

		</div>
	</div>
</body>
</html>