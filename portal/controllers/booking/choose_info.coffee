'use strict'

angular.module('booking-mamangement.booking')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/chooseinfo',
		controller: 'chooseinfo-ctrl'
		templateUrl: 'views/booking/choose_info.jade'

.controller 'chooseinfo-ctrl', ($scope, $rootScope) ->
	console.log 'chooseinfo-ctrl'
	$scope.user_info = $rootScope.model.user_info

	$scope.next = ->
		$rootScope.model.user_info = $scope.user_info
		$rootScope.booking_template = 'views/booking/choose_done.jade'
