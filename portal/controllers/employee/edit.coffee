'use strict'

angular.module('booking-mamangement.employee')
# config route foreach controller
.config ($routeProvider) ->
	$routeProvider.when '/emp/edit/:_id',
		controller: 'employee-edit-ctrl'
		templateUrl: 'views/employee/edit.jade'

.controller 'employee-edit-ctrl', ($scope, $routeParams, user) ->
	console.log 'employee-edit-ctrl'
	_emp = $routeParams._id

	user.get_by_id({_user: _emp}).$promise.then (_re) ->
		if _re.err?
			$scope.err = _re.err
		else
			$scope.model = _re.data
			console.log $scope.model

	# $scope.model = {}
	# auth.getUser().then (data) ->
	# 	$scope.currentUser = data

	# $scope.submit = ->
	# 	console.log 'submit'
	# 	$scope.model.role = 'manager'
	# 	$scope.model._company = $scope.currentUser._company
	# 	console.log $scope.model
	# 	user.register $scope.model, (data) ->
	# 		if data.err
	# 			console.log err
	# 		else
	# 			console.log data
	# 			$scope.model = {}
