'use strict'

angular.module('booking-mamangement.manage', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/',
		controller: 'manage-ctrl'
		templateUrl: 'views/manage/index.jade'

.controller 'manage-ctrl', ($scope, $location) ->
	console.log 'manage-ctrl'

