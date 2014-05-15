'use strict'

angular.module('booking-mamangement.booking')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/choosecars',
		controller: 'choosecars-ctrl'
		templateUrl: 'views/booking/choose_cars.jade'

.controller 'choosecars-ctrl', ($scope, $rootScope, car) ->
	console.log 'choosecars-ctrl'
	$scope.model = $rootScope.model

	car.get_by_route({_route: $scope.model._route})
	.$promise.then (data) ->
		$scope.car_list = data

	$scope.car_selected = (item) ->
		$rootScope.model._car = item._id
		$rootScope.model.car = item
		$rootScope.booking_template = 'views/booking/choose_seat.jade'
