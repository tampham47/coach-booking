'use strict'

angular.module('booking-mamangement.account')
# config route foreach controller
# .config ($routeProvider) ->
# 	$routeProvider.when '/account',
# 		controller: 'account-ctrl'
# 		templateUrl: 'views/account/index.jade'

.controller 'account-login-ctrl', ($scope, $location, auth) ->
	console.log 'account-login-ctrl'
	# $scope.credential = {}
	# $scope.model = {}

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
		# alert 'login'
		# return if $scope.form.$invalid

		console.log 'credential'
		console.log $scope.credential
		# credential =
		# 	username: 'tampham47'
		# 	password: '1we23rw4t'
		# console.log credential

		auth.login($scope.credential).then ->
			$scope.error = false
		, (err) ->
			console.log err
			$scope.error = true
