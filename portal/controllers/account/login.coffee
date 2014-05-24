'use strict'

angular.module('booking-mamangement.account')
# config route foreach controller
# .config ($routeProvider) ->
# 	$routeProvider.when '/account',
# 		controller: 'account-ctrl'
# 		templateUrl: 'views/account/index.jade'

.controller 'account-login-ctrl', ($scope, $location, auth, company, user) ->
	console.log 'account-login-ctrl'
	$scope.panel = 'login'

	# Show login modal
	$scope.$on 'event:auth-loginRequired', ->
		jQuery('body > .modal').modal
			backdrop: 'static'
			keyboard: false

	# Hide login modal
	$scope.$on 'event:auth-loginConfirmed', ->
		jQuery('body > .modal').modal 'hide'

	$scope.cancel = ->
		$rootScope.btn_login = null
		jQuery('body > .modal').modal 'hide'

	$scope.login = ->
		if $scope.login_form.$invalid
			$scope.err =
				message: 'Please correct this form.'
			return

		auth.login($scope.credential).then (_result) ->
			return
		, (err) ->
			$scope.err =
				message: 'User name or password is invalid.'

	$scope.panel_changed = (panel) ->
		$scope.panel = panel

	$scope.registration = ->
		if !$scope.registration_form.$valid
			$scope.err =
				message: 'Please correct this form.'
			return

		company.create {company: $scope.model, user: $scope.user}, (data) ->
			if data.err?
				$scope.err = data.err
			else
				$scope.model = $scope.user = $scope.err = null
				$scope.panel = 'login'
