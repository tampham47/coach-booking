'use strict'

angular.module('booking-mamangement')
.factory 'Comment', ($resource) ->
	$resource 'http://localhost:3000/' + 'comment/:cmd/:_id', null,
		create:
			method: 'POST'
			isArray: false
			params: cmd: 'create'
		getByPostId:
			method: 'GET'
			isArray: true
			params: cmd: 'getByPostId'
