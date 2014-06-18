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

	$scope.nav = (template, index) ->
		current_state = $rootScope.current_state
		if (index <= current_state)
			$rootScope.booking_template = 'views/booking/' + template
		else
			alert 'Bạn phải hoàn tất một số bước trên trước khi vào bước này.'
