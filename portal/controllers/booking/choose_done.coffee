'use strict'

angular.module('booking-mamangement.booking')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/choosedone',
		controller: 'choosedone-ctrl'
		templateUrl: 'views/booking/choose_done.jade'

.controller 'choosedone-ctrl', ($scope, $rootScope, booking) ->
	console.log 'choosedone-ctrl'
	$scope.booking = $rootScope.booking
	$scope.guest = $rootScope.guest

	$scope.complete = ->
		console.log 'complete'
		b = $scope.booking
		g = $scope.guest

		booking.create({booking: b, guest: g})
		.$promise.then (data) ->
			console.log data

			$rootScope.guest = {}
			$rootScope.booking = {}

			alert 'Thông tin đặt vé đã được lưu vào hệ thống.'
			$rootScope.booking_template = 'views/booking/choose_date.jade'
		, (err) ->
			console.log err
