'use strict'

angular.module('booking-mamangement.car')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/car/new',
		controller: 'car-new-ctrl'
		templateUrl: 'views/car/new.jade'

.controller 'car-new-ctrl', ($scope, $location) ->
	console.log 'car-new-ctrl'

