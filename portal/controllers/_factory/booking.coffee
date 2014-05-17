'use strict'

angular.module('booking-mamangement')
.factory 'booking', ($resource, config) ->
	$resource config.booking + '/:cmd/:_id', null,
		create:
			method: 'POST'
			isArray: false
			params: cmd: 'create2'
		getall:
			method: 'GET'
			isArray: true
			params: cmd: 'getall'

		get_by_car:
			method: 'GET'
			isArray: false
			params: cmd: 'get_by_car'
