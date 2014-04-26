'use strict'

# require order is important
angular.module 'booking-mamangement', [
	'ui.bootstrap'
	'ngAnimate'
	'ngRoute'
	'ngResource'
	'ngSanitize'
	'booking-mamangement.templates'

	'booking-mamangement.home'
	'booking-mamangement.manage'
	'booking-mamangement.car'
	'booking-mamangement.company'
	'booking-mamangement.employee'
	'booking-mamangement.booking'
	'booking-mamangement.admin'
]
