'use strict'

angular.module('booking-mamangement.booking')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/choosesit',
		controller: 'chooseseat-ctrl'
		templateUrl: 'views/booking/choose_seat.jade'

.controller 'chooseseat-ctrl', ($scope, $rootScope, booking) ->
	console.log 'chooseseat-ctrl'
	_booking = $rootScope.booking

	$scope.choose = {number: 0, seats: ''}

	set_seat = ->
		_choose =
			number: 0
			seats: ''
			selected_seats: []

		for item in $scope.seat_list
			if item.checked is 'YES'
				_choose.number += 1
				_choose.seats += item.name + ', '
				_choose.selected_seats.push item.name
		return _choose

	load_seatList = (car, bookings) ->
		seat_list = []; _t = []
		for item in bookings
			_t[item.seat] = item

		for item in car.seats
			seat_list.push
				name: item
				checked: 'NO'
				value: _t[item] || null
		return seat_list

	load_booking = (car, str_date) ->
		booking.get_by_car({_car: car._id, str_date: str_date})
		.$promise.then (_result) ->
			$scope.seat_list = load_seatList car, _result.data

	# init data
	load_booking _booking.car, _booking.str_date


	$scope.changed = (item) ->
		$scope.choose = set_seat()

	$scope.next = ->
		$rootScope.current_state = 3 if $rootScope.current_state < 3
		$rootScope.booking.selected_seats = $scope.choose.selected_seats
		$rootScope.booking_template = 'views/booking/choose_info.jade'
