'use strict'

angular.module('booking-mamangement.setting', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/setting',
		controller: 'setting-ctrl'
		templateUrl: 'views/setting/index.jade'

.controller 'setting-ctrl', ($scope, $location, $rootScope) ->
	console.log 'setting-ctrl'
	$rootScope.setting_template = 'views/setting/company.jade'

	$scope.nav = (template) ->
		$rootScope.setting_template = template
