'use strict'

angular.module('booking-mamangement.booking', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/',
		controller: 'booking-ctrl'
		templateUrl: 'views/booking/index.jade'

.controller 'booking-ctrl', ($scope, $location) ->
	console.log 'booking-ctrl'

