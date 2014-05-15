'use strict'

angular.module('booking-mamangement.manage', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/',
		controller: 'manage-ctrl'
		templateUrl: 'views/manage/index.jade'

.controller 'manage-ctrl', ($scope, $location, route, car) ->
	console.log 'manage-ctrl'

	load_data = (_route) ->
		car.get_by_route({_route: _route}).$promise.then (data) ->
			$scope.data = data

			$scope.currentCar = {}
			if data.length > 0
				$scope.currentCar = data[0]

	# init function
	# get all cars of first route
	route.get_all().$promise.then (data) ->
		$scope.routes = data
		if data.length > 0
			item = data[0]
			$scope._route = item._id
			load_data item._id

	$scope.$watch '_route', ->
		if $scope._route?
			console.log '_route: ' + $scope._route
			load_data $scope._route

	$scope.set_model = (item) ->
		$scope.currentCar = item
