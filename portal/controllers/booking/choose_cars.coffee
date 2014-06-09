'use strict'

angular.module('booking-mamangement.booking')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/choosecars',
		controller: 'choosecars-ctrl'
		templateUrl: 'views/booking/choose_cars.jade'

.controller 'choosecars-ctrl', ($scope, $rootScope, car, booking) ->
	console.log 'choosecars-ctrl'
	$scope.booking = _booking = $rootScope.booking

	#set number of available seat to item.
	get_available_seat = (item) ->
		booking.get_by_car({_car: item._id, str_date: _booking.str_date})
			.$promise.then (_re) ->
				item.available_seat = item.seats.length - _re.data.length

	load_data = ->
		car.get_by_route({_route: $scope.booking._route})
		.$promise.then (data) ->
			$scope.car_list = _carList = data

			# count the number of available seat for each cars
			for item in _carList
				get_available_seat item


	#public zone.
	load_data()

	$scope.car_selected = (item) ->
		$rootScope.booking._car = item._id
		$rootScope.booking.car = item
		$rootScope.booking_template = 'views/booking/choose_seat.jade'
