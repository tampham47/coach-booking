'use strict'

angular.module('booking-mamangement.employee', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/employee',
		controller: 'employee-ctrl'
		templateUrl: 'views/employee/index.jade'

.controller 'employee-ctrl', ($scope, $location, user) ->
	console.log 'employee-ctrl'
	$scope.users = user.getall ->
		$scope.model = $scope.users[0]

	$scope.set_model = (emp) ->
		$scope.model = emp
