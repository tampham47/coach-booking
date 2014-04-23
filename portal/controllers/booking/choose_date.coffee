'use strict'

angular.module('booking-mamangement.booking')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/choosedate',
		controller: 'choosedate-ctrl'
		templateUrl: 'views/booking/choose_date.jade'

.controller 'choosedate-ctrl', ($scope, $location) ->
	console.log 'choosedate-ctrl'

