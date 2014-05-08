'use strict'

# require order is important
angular.module 'booking-mamangement', [
	'ui.bootstrap'
	'ngAnimate'
	'ngRoute'
	'ngResource'
	'ngSanitize'
	'http-auth-interceptor'
	'booking-mamangement.templates'

	'booking-mamangement.account'
	'booking-mamangement.home'
	'booking-mamangement.route'
	'booking-mamangement.manage'
	'booking-mamangement.setting'
	'booking-mamangement.car'
	'booking-mamangement.guest'
	'booking-mamangement.company'
	'booking-mamangement.employee'
	'booking-mamangement.booking'
	'booking-mamangement.admin'
]
