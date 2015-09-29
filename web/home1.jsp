<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resource Locator</title>
<script type="text/javascript" src="js/Angular/angular.min.js"></script>
<!-- <script type="text/javascript" src="js/resource.js"></script> -->
<!-- <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script> -->
<link rel="stylesheet" type="text/css" href="css/style.css"></link>

<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">

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

<!-- <style>
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
</style> -->

<script>
function showTableWhileTyped(txt) {	
	if(txt.value == ''){
		document.getElementById("showtable").style.display = "none";
	}else{
		document.getElementById("showtable").style.display = "block";		
	}
	 
}
function whichTenant(txt) {	
	document.getElementById("lblTenant").style.fontSize = "xx-large";
	if(txt == 'UKGR'){
		document.getElementById("lblTenant").style.color = '#007DC6';
	}else if(txt == 'USGM'){
		document.getElementById("lblTenant").style.color = '#007DC6';
	}else if(txt == 'USGR'){
		document.getElementById("lblTenant").style.color = '#007DC6';
	}else if(txt == 'SAMUS'){
		document.getElementById("lblTenant").style.color = '#007DC6';
	}else if(txt == 'GMC'){
		document.getElementById("lblTenant").style.color = '#007DC6';
	}else{
		document.getElementById("lblTenant").style.color = '#007DC6';
	}
	
	document.getElementById("lblTenant").innerHTML = txt ;
}
</script>

</head>

<body>
<center>
	
	<!-- <div id="centered" class="primary"> --> 
	<!-- The above to keep things at center -->

<div ng-app="myApp">
        <div ng-controller="MyController">
          
			<div ng-init="btnId1='ASDA'; btnId2='USGM'; btnId3='USGR'; btnId4='SAMUS'; btnId5='GMC'; btnId6='OTHERS'">
			
				<a href="#" ng-click="getUrlFromTenant(btnId1)" ng-attr-id="btnId1" onclick='whichTenant("UKGR")'>
					<div class="button-fill blue">
						<div class="button-text">UK Groceries</div>
						<div class="button-inside">
							<div class="inside-text">ukgr&nbsplinks</div>
						</div>
					</div>
				</a>
				<a href="#" ng-click="getUrlFromTenant(btnId2)" ng-attr-id="btnId2" onclick='whichTenant("USGM")'>
						<div class="button-fill blue">
							<div class="button-text">Walmart.com</div>
							<div class="button-inside">
								<div class="inside-text">dotcom&nbsplinks</div>
							</div>
						</div>
				</a> 
				<a href="#" ng-click="getUrlFromTenant(btnId3)" ng-attr-id="btnId3" onclick='whichTenant("USGR")'>
						<div class="button-fill blue">
							<div class="button-text">US Groceries</div>
							<div class="button-inside">
								<div class="inside-text">usgr&nbsplinks</div>
							</div>
						</div>
				</a> 
				<a href="#" ng-click="getUrlFromTenant(btnId4)" ng-attr-id="btnId4" onclick='whichTenant("SAMUS")'>
						<div class="button-fill blue">
							<div class="button-text">Sams Club US</div>
							<div class="button-inside">
								<div class="inside-text">sams&nbsplinks</div>
							</div>
						</div>
				</a> 
				<a href="#" ng-click="getUrlFromTenant(btnId5)" ng-attr-id="btnId5" onclick='whichTenant("GMC")'>
						<div class="button-fill blue">
							<div class="button-text">Canada Merch</div>
							<div class="button-inside">
								<div class="inside-text">gmc&nbsplinks</div>
							</div>
						</div>
				</a> 
				<a href="#" ng-click="getUrlFromTenant(btnId6)" ng-attr-id="btnId6" onclick='whichTenant("OTHERS")'>
						<div class="button-fill blue">
							<div class="button-text">Miscellaneous</div>
							<div class="button-inside">
								<div class="inside-text">other&nbsplinks</div>
							</div>
						</div>
				</a>
				
				<a href="addurl.jsp" ng-attr-id="btnId7">
						<div class="button-fill grey">
							<div class="button-text">Add New ?</div>
							<div class="button-inside">
								<div class="inside-text">add&nbspnew&nbsplinks</div>
							</div>
						</div>
				</a>
				
				</div> <!-- Button align done -->
	<hr>
	
	<label id="lblTenant">Select Tenant</label><br/><br/>
	
	Search : <input type="text" ng-model="search" placeholder="Type here" class="tb1" onkeyup="showTableWhileTyped(this)"><br/></br>

			<div id="showtable" style="display: none">	
				<table BORDER="1" class="bordered" ng-show="(urls | filter:search).length">
					<thead>
						<tr>
							<th>Description</th>
							<th>Url</th>
						</tr>
					</thead>
					<tr ng-repeat="u in urls | filter:search | orderBy:'tenant_desc' ">
						<td>{{ u.tenant_desc }}</td>
						<td><a href="{{ u.tenant_url  }}" target="_blank">{{
								u.tenant_url }}</a></td>
					</tr>
				</table>
			</div>
			
			</div>
	</div>
<!-- </div> -->
</center>	
	<!-- This scripts are placed here purposely. If placed in head then doesn't works -->
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/resource.js"></script>
	<!-- ############### OVER ################ --> 

  </body>

</html> 