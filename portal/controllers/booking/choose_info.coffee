'use strict'

angular.module('booking-mamangement.booking')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/chooseinfo',
		controller: 'chooseinfo-ctrl'
		templateUrl: 'views/booking/choose_info.jade'

.controller 'chooseinfo-ctrl', ($scope, $rootScope) ->
	console.log 'chooseinfo-ctrl'
	$scope.guest = $rootScope.guest || {}

	$scope.next = ->
		$rootScope.guest = $scope.guest
		$rootScope.booking_template = 'views/booking/choose_done.jade'
