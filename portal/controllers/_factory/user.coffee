'use strict'

angular.module('booking-mamangement')
.factory 'user', ($resource, config) ->
	$resource config.user + '/:cmd/:_id', null,
		create:
			method: 'POST'
			isArray: false
			params: cmd: 'create'
		register:
			method: 'POST'
			isArray: false
			params: cmd: 'register'
		getall:
			method: 'GET'
			isArray: true
			params: cmd: 'getAll'
