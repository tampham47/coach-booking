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
			_re.data.birthday = moment(_re.data.birthday).format 'DD/MM/YYYY'
			$scope.model = _re.data

	$scope.submit = ->
		console.log 'submit'
		user.update $scope.model, (_re) ->
			if _re.err
				$scope.err = _re.err
			else
				console.log _re.data
				window.location = '#/emp'

	# $scope.set_pass = (pass)->
	# 	u = $scope.model
	# 	u.setPassword pass, ->
	# 		u.save()

