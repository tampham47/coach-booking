'use strict'

angular.module('booking-mamangement.booking')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/chooseinfo',
		controller: 'chooseinfo-ctrl'
		templateUrl: 'views/booking/choose_info.jade'

.controller 'chooseinfo-ctrl', ($scope, $location) ->
	console.log 'chooseinfo-ctrl'
