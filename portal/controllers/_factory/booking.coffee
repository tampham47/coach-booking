'use strict'

angular.module('booking-mamangement')
.factory 'booking', ($resource, config) ->
	$resource config.booking + '/:cmd/:_id', null,
		create:
			method: 'POST'
			isArray: false
			params: cmd: 'create'
		getall:
			method: 'GET'
			isArray: true
			params: cmd: 'getall'
