'use strict'

angular.module('booking-mamangement.route', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/route',
		controller: 'route-ctrl'
		templateUrl: 'views/route/index.jade'

.controller 'route-ctrl', ($scope, $location, $rootScope, route, car) ->
	console.log 'route-ctrl'

	route.get_by_company().$promise.then (_re) ->
		$scope.routes = _re.data
		$scope.model = _re.data[0] if _re.data.length > 0

	load_car = (_route) ->
		car.get_by_route({_route: _route}).$promise.then (_re) ->
			if _re.err?
				$scope.err = _re.err
				return
			$model.car = _re.data

	$scope.set_route = (item) ->
		$scope.model = item
