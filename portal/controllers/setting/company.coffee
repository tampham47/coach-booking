'use strict'

angular.module('booking-mamangement.company')
# config route foreach controller
# .config ($routeProvider) ->
	# $routeProvider.when '/company/new',
	# 	controller: 'company-new-ctrl'
	# 	templateUrl: 'views/company/new.jade'

.controller 'company-new-ctrl', ($scope, $location, company, user) ->
	console.log 'company-new-ctrl'
	$scope.model = {}
	$scope.user = {}

	$scope.submit = ->
		return if !$scope.company_info.$valid

		company.create {company: $scope.model, user: $scope.user}, (data) ->
			if data.err?
				alert data.err.message
			else
				$scope.model = {}
				$scope.user = {}
