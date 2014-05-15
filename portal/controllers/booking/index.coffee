'use strict'

angular.module('booking-mamangement.booking', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/booking',
		controller: 'booking-ctrl'
		templateUrl: 'views/booking/index.jade'

.controller 'booking-ctrl', ($scope, $rootScope, $location) ->
	console.log 'booking-ctrl'
	$rootScope.booking_template = 'views/booking/choose_date.jade'

	$scope.nav = (template) ->
		$rootScope.booking_template = 'views/booking/' + template
