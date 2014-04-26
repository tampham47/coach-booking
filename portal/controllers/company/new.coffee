'use strict'

angular.module('booking-mamangement.company')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/company/new',
		controller: 'company-new-ctrl'
		templateUrl: 'views/company/new.jade'

.controller 'company-new-ctrl', ($scope, $location, company) ->
	console.log 'company-new-ctrl'
	$scope.model = {}

	$scope.next = ->
		console.log $scope.model
		company.create $scope.model, (data) ->
			if data.err?
				alert data.err.message
			else
				console.log data
				$scope.model = {}


