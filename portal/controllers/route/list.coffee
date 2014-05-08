'use strict'

angular.module('booking-mamangement.route')
# config route foreach controller
# .config ($routeProvider) ->
	# $routeProvider.when '/route',
	# 	controller: 'route-ctrl'
	# 	templateUrl: 'views/route/index.jade'

.controller 'route-list-ctrl', ($scope, $location, $rootScope, route) ->
	console.log 'route-list-ctrl'
	$scope.routes = route.get_all()

	$scope.nav = (template) ->
		$rootScope.setting_template = template
