'use strict'

angular.module('booking-mamangement.booking')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/choosesit',
		controller: 'chooseseat-ctrl'
		templateUrl: 'views/booking/choose_seat.jade'

.controller 'chooseseat-ctrl', ($scope, $rootScope) ->
	console.log 'chooseseat-ctrl'
	$scope.choose =
		number: 0
		seats: ''
	_s = $rootScope.booking.car.seats
	seats = $scope.seats = []

	for item in _s
		seats.push
			name: item
			checked: 'NO'

	choosenSeats = ->
		_choose =
			number: 0
			seats: ''
			selected_seats: []
		for item in $scope.seats
			if item.checked is 'YES'
				_choose.number += 1
				_choose.seats += item.name + ', '
				_choose.selected_seats.push item.name
		$scope.choose = _choose

	$scope.changed = (item) ->
		choosenSeats()

	$scope.next = ->
		$rootScope.booking.selected_seats = $scope.choose.selected_seats
		$rootScope.booking_template = 'views/booking/choose_info.jade'
