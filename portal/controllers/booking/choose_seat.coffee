'use strict'

angular.module('booking-mamangement.booking')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/choosesit',
		controller: 'chooseseat-ctrl'
		templateUrl: 'views/booking/choose_seat.jade'

.controller 'chooseseat-ctrl', ($scope, $location) ->
	console.log 'chooseseat-ctrl'
	$scope.choose =
		number: 0
		seats: ''
	$scope.seats = []

	for item in ['A1','A2','A3','A4','A5','A6','B1','B2','B3','B4','B5','B6']
		$scope.seats.push
			name: item
			checked: 'NO'

	choosenSeats = ->
		_choose =
			number: 0
			seats: ''
		for item in $scope.seats
			if item.checked is 'YES'
				_choose.number += 1
				_choose.seats += item.name + ', '
		$scope.choose = _choose


	$scope.changed = (item) ->
		console.log item
		choosenSeats()
