'use strict'

angular.module('booking-mamangement')
.directive 'ngHref', ($location) ->
	link: (scope, element, attrs) ->
		$ ->
			element.attr 'href', attrs.ngHref

			$(element).on 'click', ->
			# scope.$on '$routeChangeSuccess', ->
				$('li', $(this).parent().parent()).removeClass 'active'
				$(this).parent().addClass 'active'

				# other case
				$('a', $(this).parent().parent()).removeClass 'active'
				$(this).addClass 'active'
