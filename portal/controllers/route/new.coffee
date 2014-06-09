'use strict'

angular.module('booking-mamangement.route')

.config ($routeProvider) ->
	$routeProvider.when '/route/new',
		controller: 'route-new-ctrl'
		templateUrl: 'views/route/new.jade'

.controller 'route-new-ctrl', ($scope, $location, $rootScope, province, route) ->
	console.log 'route-new-ctrl'
	$scope.provinces = province.get_all()
	$scope.model =
		from: 1
		destination: 2

	$scope.submit = ->
		route.create $scope.model, (data) ->
			if data.err?
				alert data.err.message
			else
				window.location = '#/route'
