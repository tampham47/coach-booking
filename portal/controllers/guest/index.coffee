'use strict'

angular.module('booking-mamangement.guest', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/guest',
		controller: 'guest-ctrl'
		templateUrl: 'views/guest/index.jade'

.controller 'guest-ctrl', ($scope, $location) ->
	console.log 'guest-ctrl'

