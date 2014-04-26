'use strict'

angular.module('booking-mamangement.booking', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/booking',
		controller: 'booking-ctrl'
		templateUrl: 'views/booking/index.jade'

.controller 'booking-ctrl', ($scope, $location) ->
	console.log 'booking-ctrl'
	$scope.booking_template = 'views/booking/choose_date.jade'

	$scope.nav = (template) ->
		$scope.booking_template = 'views/booking/' + template
