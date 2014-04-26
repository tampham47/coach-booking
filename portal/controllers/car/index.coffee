'use strict'

angular.module('booking-mamangement.car', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/car',
		controller: 'car-ctrl'
		templateUrl: 'views/car/index.jade'

.controller 'car-ctrl', ($scope, $location) ->
	console.log 'car-ctrl'

