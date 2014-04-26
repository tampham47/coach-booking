'use strict'

angular.module('booking-mamangement.employee')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/employee/new',
		controller: 'employee-new-ctrl'
		templateUrl: 'views/employee/new.jade'

.controller 'employee-new-ctrl', ($scope, $location) ->
	console.log 'employee-new-ctrl'

