'use strict'

angular.module('booking-mamangement')
.factory 'car', ($resource, config) ->
	$resource config.car + '/:cmd/:_id', null,
		create:
			method: 'POST'
			isArray: false
			params: cmd: 'create'

		get_all:
			method: 'GET'
			isArray: true
			params: cmd: 'getall'
