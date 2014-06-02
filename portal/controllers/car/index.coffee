'use strict'

angular.module('booking-mamangement.car', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/car',
		controller: 'car-ctrl'
		templateUrl: 'views/car/index.jade'

.controller 'car-ctrl', ($scope, $location, car, route) ->
	console.log 'car-ctrl'

	# set height of perfectScrollbar
	$('#car-panel').height $(window).height() - $('#car-panel').offset().top - 50
	$('#car-panel').perfectScrollbar()

	load_data = (_route) ->
		car.get_by_route({_route: _route}).$promise.then (data) ->
			$scope.data = data

			$scope.model = {}
			if data.length > 0
				$scope.model = data[0]

	# init function
	# get all cars of first route
	route.get_by_company().$promise.then (_re) ->
		$scope.routes = data = _re.data
		if data.length > 0
			item = data[0]
			$scope._route = item._id
			load_data item._id

	$scope.$watch '_route', ->
		if $scope._route?
			console.log '_route: ' + $scope._route
			load_data $scope._route

	$scope.set_model = (item) ->
		$scope.model = item
