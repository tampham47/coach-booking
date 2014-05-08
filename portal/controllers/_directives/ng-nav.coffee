'use strict'

angular.module('booking-mamangement')
.directive 'ngNav', ($compile) ->
	link: (scope, element, attrs) ->
		$ ->
			$(element).on 'click', ->
				# alert attrs.ngNav
				# $rootScope.setting_template = attrs.ngNav
				console.log scope
				scope.setting_template = 'views/route/new.jade'
				# console.log $rootScope.setting_template
				console.log scope
	scope: true
