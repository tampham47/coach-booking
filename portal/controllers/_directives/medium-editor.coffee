'use strict'

angular.module('booking-mamangement')
.directive "ngMeditor", ->
	restrict: "A"
	require: "ngModel"
	link: (scope, element, attrs, ngModelCtrl) ->
		$ ->
			new MediumEditor($(element))
			$(element).on 'input', ->
				ngModelCtrl.$setViewValue $(this).html()
