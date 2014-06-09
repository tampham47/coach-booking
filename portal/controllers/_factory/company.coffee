'use strict'

angular.module('booking-mamangement')
.factory 'company', ($resource, config) ->
	$resource config.company + '/:cmd/:_id', null,
		create:
			method: 'POST'
			isArray: false
			params: cmd: 'create'

		create_with_data:
			method: 'POST'
			isArray: false
			params: cmd: 'create_with_data'

		update:
			method: 'POST'
			isArray: false
			params: cmd: 'update'

		getall:
			method: 'GET'
			isArray: true
			params: cmd: 'getall'

		get_by_id:
			method: 'GET'
			isArray: false
			params: cmd: 'get_by_id'
