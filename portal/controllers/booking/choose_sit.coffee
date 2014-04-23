'use strict'

angular.module('booking-mamangement.booking')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/choosesit',
		controller: 'choosesit-ctrl'
		templateUrl: 'views/booking/choose_sit.jade'

.controller 'choosesit-ctrl', ($scope, $location) ->
	console.log 'choosesit-ctrl'

