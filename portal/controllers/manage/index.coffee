'use strict'

angular.module('booking-mamangement.manage', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/',
		controller: 'manage-ctrl'
		templateUrl: 'views/manage/index.jade'

.controller 'manage-ctrl', ($scope, $location, route, car, booking) ->
	console.log 'manage-ctrl'
	moment.lang "vn", weekdays: ['CN', 'Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7']
	$scope.seat_list = []
	$scope.selected_date = moment()

	get_sevendays = ->
		r = []; i = 0;
		while i < 7
			date = moment().add('day', i)
			r.push
				weekday: date.format 'dddd'
				str: date.format 'DD/MM'
				value: date
			i++
		return r

	load_route = (_route) ->
		car.get_by_route({_route: _route}).$promise.then (data) ->
			$scope.data = data

			$scope.current_car = -1
			$scope.seat_list = []
			if data.length > 0
				$scope.current_car = data[0]
				fill()

	load_seatList = (car, bookings) ->
		seat_list = []; _t = []
		for item in bookings
			_t[item.seat] = item

		for item in car.seats
			seat_list.push
				name: item
				value: _t[item] || null
		return seat_list

	load_booking = (_car, str_date) ->
		booking.get_by_car({_car: _car, str_date: str_date})
		.$promise.then (re) ->
			$scope.seat_list = load_seatList $scope.current_car, re.data

	fill = ->
		_car = $scope.current_car._id
		str_date = $scope.selected_date.format 'DD/MM/YYYY'
		load_booking _car, str_date

	# init function
	# get all cars of first route
	$scope.sevendays = get_sevendays()

	route.get_all().$promise.then (data) ->
		$scope.routes = data
		if data.length > 0
			item = data[0]
			$scope._route = item._id
			load_route item._id

	$scope.$watch '_route', ->
		if $scope._route?
			load_route $scope._route

	$scope.car_changed = (item) ->
		$scope.current_car = item
		fill()

	$scope.date_changed = (item) ->
		$scope.selected_date = item
		fill()
