'use strict'

angular.module('booking-mamangement')
.factory 'car', ($resource, config) ->
	$resource config.car + '/:cmd/:_id', null,
		create:
			method: 'POST'
			isArray: false
			params: cmd: 'create'

		update:
			method: 'POST'
			isArray: false
			params: cmd: 'update'

		get_all:
			method: 'GET'
			isArray: true
			params: cmd: 'getall'

		get_by_id:
			method: 'GET'
			isArray: false
			params: cmd: 'get_by_id'

		get_by_route:
			method: 'GET'
			isArray: true
			params: cmd: 'getbyroute'
