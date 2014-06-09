'use strict'

angular.module('booking-mamangement.company', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/company',
		controller: 'company-ctrl'
		templateUrl: 'views/company/index.jade'

.controller 'company-ctrl', ($scope, $location, company, auth) ->
	console.log 'company-ctrl'

	company.get_by_id({_company: auth.user._company})
	.$promise.then (_re) ->
		$scope.model = _re.data

