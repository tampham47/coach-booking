'use strict'

angular.module('booking-mamangement.booking')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/choosedone',
		controller: 'choosedone-ctrl'
		templateUrl: 'views/booking/choose_done.jade'

.controller 'choosedone-ctrl', ($scope, $rootScope, booking) ->
	console.log 'choosedone-ctrl'
	$scope.model = $rootScope.model
