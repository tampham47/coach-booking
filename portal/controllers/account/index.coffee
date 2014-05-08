'use strict'

angular.module('booking-mamangement.account', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/account',
		controller: 'account-ctrl'
		templateUrl: 'views/account/index.jade'

.controller 'account-ctrl', ($scope, $location) ->
	console.log 'account-ctrl'

