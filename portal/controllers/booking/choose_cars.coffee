'use strict'

angular.module('booking-mamangement.booking')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/choosecars',
		controller: 'choosecars-ctrl'
		templateUrl: 'views/booking/choose_cars.jade'

.controller 'choosecars-ctrl', ($scope, $location) ->
	console.log 'choosecars-ctrl'

