'use strict'

angular.module('booking-mamangement')
.factory 'User', ($resource) ->
	$resource 'http://localhost:3000/' + 'user/:cmd/:_id', null,
		create:
			method: 'POST'
			isArray: false
			params: cmd: 'create'
		getall:
			method: 'GET'
			isArray: true
			params: cmd: 'getall'
