'use strict'

angular.module('booking-mamangement')
.factory 'company', ($resource, config) ->
	$resource config.company + '/:cmd/:_id', null,
		create:
			method: 'POST'
			isArray: false
			params: cmd: 'create'
		getall:
			method: 'GET'
			isArray: true
			params: cmd: 'getall'
