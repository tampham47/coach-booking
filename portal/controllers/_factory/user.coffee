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
		update:
			method: 'POST'
			isArray: false
			params: cmd: 'update'

		getall:
			method: 'GET'
			isArray: true
			params: cmd: 'get_all'

		get_by_company:
			method: 'GET'
			isArray: false
			params: cmd: 'get_by_company'

		get_by_id:
			method: 'GET'
			isArray: false
			params: cmd: 'get_by_id'
