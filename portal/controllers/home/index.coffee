'use strict'

angular.module('booking-mamangement.home', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/home',
		controller: 'home-ctrl'
		templateUrl: 'views/home/index.jade'

.controller 'home-ctrl', ($scope, $location) ->
	console.log 'home-ctrl'

