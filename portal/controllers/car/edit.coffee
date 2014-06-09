'use strict'

angular.module('booking-mamangement.car')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/car/edit/:_id',
		controller: 'car-edit-ctrl'
		templateUrl: 'views/car/edit.jade'

.controller 'car-edit-ctrl', ($scope, $routeParams, car, route) ->
	console.log 'car-edit-ctrl'

	route.get_by_company().$promise.then (_re) ->
		$scope.routes = _re.data

	_car = $routeParams._id
	car.get_by_id({_car: _car}).$promise.then (_re) ->
		if _re.err?
			$scope.err = _re.err
		else
			$scope.model = _re.data

	$scope.submit = ->
		console.log 'submit'
		_d = $scope.model
		car.update(_d).$promise.then (_re) ->
			if _re.err?
				$scope.err = _re.err
			else
				console.log 'done'
				console.log _re.data
