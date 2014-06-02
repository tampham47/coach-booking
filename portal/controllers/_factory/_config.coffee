'use strict'

add = 'http://localhost:3001'

angular.module('booking-mamangement')
.config ($httpProvider) ->
	$httpProvider.defaults.withCredentials = true

.factory 'config', ($resource) ->
	services: add
	booking: add + '/booking'
	car: add + '/car'
	company: add + '/company'
	guest: add + '/guest'
	guest_company: add + '/guest_company'
	user: add + '/user'
	user_car: add + '/user_car'
	province: add + '/province'
	route: add + '/route'
	account: add + '/account'
