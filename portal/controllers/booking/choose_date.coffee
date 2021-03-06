'use strict'

angular.module('booking-mamangement.booking')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/choosedate',
		controller: 'choosedate-ctrl'
		templateUrl: 'views/booking/choose_date.jade'

.controller 'choosedate-ctrl', ($scope, $rootScope, $location, route) ->
	console.log 'choosedate-ctrl'
	date_format = 'DD/MM/YYYY'
	$scope.datepicker = moment().add('days', 2).toDate()

	# if this is access more than one times
	$scope.booking = _booking = $rootScope.booking || {}
	$scope.booking.amount_of_seats = 1

	# d id a date with format (date_format)
	get_default = (d) ->
		if moment(d, date_format).isValid()
			return moment(d, date_format).toDate()
		else
			return moment().add('days', 2).toDate()

	$scope.datepicker = get_default(_booking.str_date)

	# get routes
	route.get_by_company().$promise.then (_re) ->
		$scope.routes = _re.data
		_booking._route = _re.data[0]._id if _re.data.length > 0


	$scope.$watch 'datepicker', ->
		p = moment $scope.datepicker
		$scope.booking.str_date = p.format date_format

	$scope.booking_date_blur = ->
		d = $scope.booking.str_date
		$scope.datepicker = get_default(d)

	$scope.next = ->
		$rootScope.current_state = 1 if $rootScope.current_state < 1 or !($rootScope.current_state?)
		console.log 'current_state'
		console.log $rootScope.current_state
		$rootScope.booking = $scope.booking
		$rootScope.booking_template = 'views/booking/choose_cars.jade'
