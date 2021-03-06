'use strict'

angular.module('booking-mamangement.employee', [])
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/emp',
		controller: 'employee-ctrl'
		templateUrl: 'views/employee/index.jade'

.controller 'employee-ctrl', ($scope, $location, user) ->
	console.log 'employee-ctrl'

	$('#emp-panel').height $(window).height() - $('#emp-panel').offset().top - 50
	$('#emp-panel').perfectScrollbar()

	user.get_by_company().$promise.then (_re) ->
		$scope.users = _re.data
		$scope.model = $scope.users[0] if _re.data.length > 0

	$scope.set_model = (emp) ->
		$scope.model = emp
