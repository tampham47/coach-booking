'use strict'

angular.module('booking-mamangement.employee', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/employee',
		controller: 'employee-ctrl'
		templateUrl: 'views/employee/index.jade'

.controller 'employee-ctrl', ($scope, $location) ->
	console.log 'employee-ctrl'

