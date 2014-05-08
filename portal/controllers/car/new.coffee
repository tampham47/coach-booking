'use strict'

angular.module('booking-mamangement.car')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/car/new',
		controller: 'car-new-ctrl'
		templateUrl: 'views/car/new.jade'

.controller 'car-new-ctrl', ($scope, $location, route, car) ->
	console.log 'car-new-ctrl'
	$scope.routes = route.get_all()
	$scope.cars = car.get_all()
	$scope.model = {}

	$scope.submit = ->
		console.log 'submit'
		console.log $scope.model
		car.create $scope.model, (data) ->
			if data.err?
				alert data.err.message
			else
				console.log data
				$scope.model = {}
