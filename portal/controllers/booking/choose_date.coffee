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

	# if this is access more than one times
	$scope.model = $rootScope.model

	$scope.datepicker = moment().add('days', 2).toDate()
	$scope.model =
		amount_of_seats: 1

	# get routes
	route.get_all().$promise.then (data) ->
		$scope.routes = data

	$scope.$watch 'datepicker', ->
		p = moment $scope.datepicker
		$scope.model.booking_date = p.format date_format

	$scope.booking_date_blur = ->
		d = $scope.model.booking_date
		if moment(d, date_format).isValid()
			$scope.datepicker = moment(d, date_format).toDate()
		else
			$scope.datepicker = moment().add('days', 2).toDate()

	$scope.next = ->
		console.log 'next'
		$rootScope.model = $scope.model
		$rootScope.booking_template = 'views/booking/choose_cars.jade'
