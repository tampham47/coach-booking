'use strict'

angular.module('booking-mamangement.employee')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/employee/new',
		controller: 'employee-new-ctrl'
		templateUrl: 'views/employee/new.jade'

.controller 'employee-new-ctrl', ($scope, $location, user, auth) ->
	console.log 'employee-new-ctrl'
	$scope.model = {}
	auth.getUser().then (data) ->
		$scope.currentUser = data

	$scope.submit = ->
		console.log 'submit'
		$scope.model.role = 'manager'
		$scope.model._company = $scope.currentUser._company
		console.log $scope.model
		user.register $scope.model, (data) ->
			if data.err
				console.log err
			else
				console.log data
				$scope.model = {}
