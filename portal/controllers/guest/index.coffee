'use strict'

angular.module('booking-mamangement.guest', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/guest',
		controller: 'guest-ctrl'
		templateUrl: 'views/guest/index.jade'

.controller 'guest-ctrl', ($scope, guest) ->
	console.log 'guest-ctrl'

	$scope.data = guest.get_all().$promise.then (result) ->
		if result.err?
			alert result.err.message
			return null
		else
			return result.data
