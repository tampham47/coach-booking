'use strict'

angular.module('booking-mamangement.setting', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/setting',
		controller: 'setting-ctrl'
		templateUrl: 'views/setting/index.jade'

.controller 'setting-ctrl', ($scope, $location) ->
	console.log 'setting-ctrl'
	$scope.setting_template = 'views/setting/company.jade'

	$scope.nav = (template) ->
		$scope.setting_template = 'views/setting/' + template
