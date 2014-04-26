'use strict'

angular.module('booking-mamangement')
.factory 'config', ($resource) ->
	services: 'http://localhost:3001/'
	booking: 'http://localhost:3001/booking'
	car: 'http://localhost:3001/car'
	company: 'http://localhost:3001/company'
	guest: 'http://localhost:3001/guest'
	guest_company: 'http://localhost:3001/guest_company'
	user: 'http://localhost:3001/user'
	user_car: 'http://localhost:3001/user_car'
