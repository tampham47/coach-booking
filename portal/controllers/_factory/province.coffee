'use strict'

angular.module('booking-mamangement')
.factory 'province', ($resource, config) ->
	$resource config.province + '/:cmd/:_id', null,
		get_all:
			method: 'GET'
			isArray: true
			params: cmd: 'get_all'
