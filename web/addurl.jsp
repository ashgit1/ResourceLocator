<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resource Locator</title>
<script type="text/javascript" src="js/Angular/angular.min.js"></script>
</head>
<body>
<center>
<h1>Add Resource</h1>
    <form action="AddUrlServlet" method="post" ng-app="myApp"  ng-controller="validateCtrl" name="myForm" novalidate>
        <table cellpadding="3pt">
            <tr>
                <td>Tenant Name :</td>
                <td>
                 <select name="tenantName" style="width: 200px;" required>
  					<option value="ASDA" selected="selected">ASDA</option>
  					<option value="USGM">USGM</option>
  					<option value="USGR">USGR</option>
  					<option value="SAMUS">SAMUS</option>
  					<option value="GMC">GMC</option>
  					<option value="OTHERS">OTHERS</option>
				</select>
                <!-- <input type="text" name="tenantName" size="30" ng-model="tenantName" required/></td> -->
                <td>
                	<span style="color:red" ng-show="myForm.tenantName.$dirty && myForm.tenantName.$invalid">
  					<span ng-show="myForm.tenantName.$error.required">Tenant Name is required.</span>
  					</span>
  				</td>	
            </tr>
            <tr>
                <td>Description :</td>
                <td><input type="text" name="description" size="30" ng-model="description" placeholder="type desc..." required/></td>
                <td>
                	<span style="color:red" ng-show="myForm.description.$dirty && myForm.description.$invalid">
  					<span ng-show="myForm.description.$error.required">Description is required.</span>
  					</span>	
                </td>
            </tr>
            <tr>
                <td>URL :</td>
                <td><input type="text" name="url" size="30" ng-model="url" placeholder="type url..." required/></td>
                <td>
                	<span style="color:red" ng-show="myForm.url.$dirty && myForm.url.$invalid">
  					<span ng-show="myForm.url.$error.required">Url is required.</span>
  					</span>	
                </td>
            </tr>
        </table>
        <input type="submit" value="Add URL"  ng-disabled="myForm.tenantName.$dirty && myForm.tenantName.$invalid || myForm.url.$dirty && myForm.url.$invalid 
        || myForm.description.$dirty && myForm.description.$invalid" />
    </form>
<script>
var app = angular.module('myApp', []);
app.controller('validateCtrl', function($scope) {
    $scope.description = 'qa3';
    $scope.url = 'http://www.asda.com';
});
</script>
</center>
</body>
</html>