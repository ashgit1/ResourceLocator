<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View</title>
<script type="text/javascript" src="js/Angular/angular.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css"></link>

<link rel="stylesheet"	href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
<script src="//cdn.datatables.net/1.10.5/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="//cdn.datatables.net/1.10.5/css/jquery.dataTables.min.css">

<script>
$(document).ready(function(){
    $('#urlTable').DataTable();
});
</script>

<script>
var app = angular.module('myApp', []);

function MyController($scope, $http) {

        $scope.getUrlFromTenant = function(btnId) {
        	//alert("button clicked : " + btnId);
                $http({
                        method : 'GET',
                        url : 'GetUrlServlet',
                        params: {"tenant" : btnId}
                }).success(function(data, status, headers, config) {
                        $scope.urls = data;
                }).error(function(data, status, headers, config) {
                        // called asynchronously if an error occurs
                        // or server returns response with an error status.
                	alert("Error while fetching the records for users.");
                });

        };
};
</script>

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

</head>
<body>

<div ng-app="myApp">
        <div ng-controller="MyController">
           <input type="hidden" name="ten" value="ASDA" ng-model="ten"> <br/><br/>
           
           
           <div ng-init="btnId='ASDA'; btnId1='USGM'">
           		<input type="button" ng-click="getUrlFromTenant(btnId)" ng-attr-id="btnId" value="ASDA"/>
           		<input type="button" ng-click="getUrlFromTenant(btnId1)" ng-attr-id="btnId1" value="USGM"/>
           </div>
           
           
           <br/><br/>
           Search : <input type="text" ng-model="search" placeholder="Type here"><br/></br>
           
           <table border="1" id="urlTable" ng-show="(urls | filter:search).length">
           		<thead>
           		<tr>
           		<th>Description</th>
				<th>Url</th>
				</tr>
				</thead>
				<tr ng-repeat="u in urls | filter:search | orderBy:'tenant_desc' ">
					<td>{{ u.tenant_desc  }}</td>
					<td><a href="{{ u.tenant_url  }}" target="_blank">{{ u.tenant_url  }}</a></td>
				</tr>
			</table>
           	
        </div>
</div>
</body>
</html>