'use strict'

angular.module('booking-mamangement.home')
# config route foreach controller
# .config ($routeProvider) ->
# 	$routeProvider.when '/home',
# 		controller: 'home-ctrl'
# 		templateUrl: 'views/home/index.jade'

.controller 'nav-ctrl', ($scope, $location, auth) ->
	console.log 'home-ctrl'

	$scope.user = auth.getUser()
	$scope.logout = auth.logout

