'use strict'

angular.module('booking-mamangement')
.factory 'auth', ($http, $q, $window, config, authService) ->
	login = config.account + '/login'
	logout = config.account + '/logout'
	deferred = $q.defer()

	# return
	user: deferred.promise

	getUser: ->
		$http.get(config.account + '/getUser').then (response) ->
			deferred.resolve response.data
		return deferred.promise

	login: (credential) ->
		$http.post(login, credential).then ->
			authService.loginConfirmed()

	logout: ->
		$http.post(logout).then ->
			$window.location.reload()
