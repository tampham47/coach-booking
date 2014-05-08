'use strict'

angular.module('booking-mamangement.route')
.controller 'route-new-ctrl', ($scope, $location, $rootScope, province, route) ->
	console.log 'route-new-ctrl'
	$scope.provinces = province.get_all()
	$scope.model =
		from: 1
		destination: 2

	$scope.submit = ->
		console.log $scope.model
		route.create $scope.model, (data) ->
			if data.err?
				alert data.err.message
			else
				console.log data
				$scope.model = {}
				$rootScope.setting_template = 'views/route/list.jade'

	$scope.cancel = ->
		$rootScope.setting_template = 'views/route/list.jade'
