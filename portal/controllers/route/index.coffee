'use strict'

angular.module('booking-mamangement.route', [])
# config route foreach controller
# .config ($routeProvider) ->
	# $routeProvider.when '/route',
	# 	controller: 'route-ctrl'
	# 	templateUrl: 'views/route/index.jade'

.controller 'route-ctrl', ($scope, $location, $rootScope) ->
	console.log 'route-ctrl'
	$scope.route_template = 'views/route/list.jade'

	$scope.nav = (template) ->
		$rootScope.setting_template = template
