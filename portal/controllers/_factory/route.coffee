'use strict'

angular.module('booking-mamangement')
.factory 'route', ($resource, config) ->
	$resource config.route + '/:cmd/:_id', null,
		create:
			method: 'POST'
			isArray: false
			params: cmd: 'create'

		get_all:
			method: 'GET'
			isArray: true
			params: cmd: 'get_all'
