'use strict'

angular.module('booking-mamangement')
.factory 'user_car', ($resource, config) ->
	$resource config.user_car + '/:cmd/:_id', null,
		create:
			method: 'POST'
			isArray: false
			params: cmd: 'create'
		getall:
			method: 'GET'
			isArray: true
			params: cmd: 'getall'
