'use strict'

angular.module('booking-mamangement.company', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/company',
		controller: 'company-ctrl'
		templateUrl: 'views/company/index.jade'

.controller 'company-ctrl', ($scope, $location, company) ->
	console.log 'company-ctrl'
	$scope.companies = company.getall()

