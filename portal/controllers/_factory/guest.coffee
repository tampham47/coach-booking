'use strict'

angular.module('booking-mamangement')
.factory 'guest', ($resource, config) ->
	$resource config.guest + '/:cmd/:_id', null,
		create:
			method: 'POST'
			isArray: false
			params: cmd: 'create'
		getall:
			method: 'GET'
			isArray: true
			params: cmd: 'getall'
