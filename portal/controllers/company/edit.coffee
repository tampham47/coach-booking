'use strict'

angular.module('booking-mamangement.company')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/company/edit/:_id',
		controller: 'company-edit-ctrl'
		templateUrl: 'views/company/edit.jade'

.controller 'company-edit-ctrl', ($scope, $routeParams, company) ->
	console.log 'company-edit-ctrl'
	company.get_by_id({_company: $routeParams._id})
	.$promise.then (_re) ->
		$scope.model = _re.data

	$scope.submit = ->
		console.log $scope.model
		company.update $scope.model, (_re) ->
			if _re.err?
				alert _re.err.message
			else
				window.location = '#/setting'
