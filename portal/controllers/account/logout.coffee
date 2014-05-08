'use strict'

angular.module('booking-mamangement.account')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/account/logout',
		controller: 'account-logout-ctrl'

.controller 'account-logout-ctrl', ($scope, $location, auth) ->
	console.log 'account-ctrl'
	$scope.logout = auth.logout
