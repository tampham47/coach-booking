'use strict'

angular.module('booking-mamangement.manage', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/',
		controller: 'manage-ctrl'
		templateUrl: 'views/manage/index.jade'

.controller 'manage-ctrl', ($scope, $location, config, route, car, booking) ->
	console.log 'manage-ctrl'
	moment.lang "vn", weekdays: ['CN', 'Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7']
	$scope.booking = {}
	$scope.seat_list = []
	$scope.selected_date = moment()
	$scope.model =
		date: moment().toDate()

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
			$scope.booking_count = re.data.length
			$scope.seat_list = load_seatList $scope.current_car, re.data

	fill = ->
		return if !($scope.current_car?)

		_car = $scope.current_car._id
		str_date = $scope.selected_date.format 'DD/MM/YYYY'
		load_booking _car, str_date

	# init function
	# get all cars of first route
	$scope.sevendays = get_sevendays()

	route.get_by_company().$promise.then (_re) ->
		$scope.routes = data = _re.data
		if data.length > 0
			item = data[0]
			$scope._route = item._id
			load_route item._id

	$scope.$watch '_route', ->
		if $scope._route?
			load_route $scope._route

	$scope.$watch 'model.date', ->
		d = moment $scope.model.date
		$scope.selected_date = d
		fill()

	$scope.car_changed = (item) ->
		$scope.current_car = item
		fill()

	$scope.date_changed = (item) ->
		$scope.selected_date = item
		fill()

	$scope.booking_panel_click = (item) ->
		$scope.selected_seat = item
		$('#booking_panel').modal
			backdrop: 'static'
			keyboard: true

	$scope.booking_panel_close = ->
		$scope.err = null

	$scope.booking_detail_click = (item) ->
		$scope.booking_detail = item.value
		$('#booking_detail').modal
			backdrop: 'static'
			keyboard: true

	$scope.booking_detail_close = ->
		$scope.booking_detail = {}

	$scope.booking_create = ->
		if $scope.booking_form.$invalid
			$scope.err =
				message: 'Bạn chưa điền đầy đủ thông tin.'
			return

		_guest = $scope.guest
		_b = $scope.booking

		_b._car = $scope.current_car._id
		_b.seat = $scope.selected_seat.name
		_b.str_date = $scope.selected_date.format 'DD/MM/YYYY'

		booking.create_one({booking: _b, guest: _guest})
		.$promise.then (result) ->
			fill()
			$scope.guest = {}
			$scope.booking.from = ''
			$scope.booking.destination = ''
			$('#booking_panel').modal 'hide'

	$scope.booking_change_status = (_status) ->
		_b = JSON.parse(JSON.stringify($scope.booking_detail))
		# _b = $scope.booking_detail
		# console.log _b
		_b.status = _status
		_b._guest = _b._guest._id

		booking.update(_b).$promise.then (_re) ->
			if _re.err?
				$scope.err = _re.err
				return
			else
				fill()
				$('#booking_detail').modal 'hide'

	$scope.booking_export = ->
		console.log 'booking_export'
		_car = $scope.current_car._id
		str_date = $scope.selected_date.format 'DD/MM/YYYY'

		url = config.services + '/booking/export?_car=' + _car + '&str_date=' + str_date
		window.open url, '_blank'
