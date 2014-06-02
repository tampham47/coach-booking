'use strict'

angular.module('booking-mamangement.home')
# config route foreach controller
# .config ($routeProvider) ->
# 	$routeProvider.when '/home',
# 		controller: 'home-ctrl'
# 		templateUrl: 'views/home/index.jade'

.controller 'nav-ctrl', ($scope, auth) ->
	console.log 'home-ctrl'

	load_data = ->
		$scope.user = auth.getUser()

	load_data()
	$scope.logout = auth.logout

	$scope.$on 'event:auth-loginConfirmed', ->
		load_data()
