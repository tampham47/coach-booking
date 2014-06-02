'use strict'

angular.module('booking-mamangement.car')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/car/new',
		controller: 'car-new-ctrl'
		templateUrl: 'views/car/new.jade'

.controller 'car-new-ctrl', ($scope, $location, route, car) ->
	console.log 'car-new-ctrl'
	route.get_by_company().$promise.then (_re) ->
		$scope.routes = _re.data

	$scope.cars = car.get_all()
	$scope.seats = []
	$scope.model = {}

	$scope.change_seats = (seats) ->
		tmp = _.str.words seats, ','
		seats = []
		for item in tmp
			if _.str.trim(item) != ''
				seats.push (_.str.trim item).toUpperCase()
		console.log seats
		$scope.seats = seats

	$scope.submit = ->
		console.log 'submit'
		console.log $scope.model
		car.create $scope.model, (data) ->
			if data.err?
				alert data.err.message
			else
				console.log data
				$scope.model = {}
				$scope.seats = []
				$location.path '/car'
