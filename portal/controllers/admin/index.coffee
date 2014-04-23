'use strict'

angular.module('booking-mamangement.admin', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/admin',
		controller: 'admin-ctrl'
		templateUrl: 'views/admin/index.jade'

.controller 'admin-ctrl', ($scope, $location) ->
	console.log 'admin-ctrl'

