'use strict'

company = require '../business/company'
user = require '../business/user'

create = (req, res) ->
	console.log 'company/create'
	companyData = req.body.company
	userData = req.body.user

	company.create(companyData)
	.then (data) ->
		userData._company = data._id
		userData.role = 'admin'
		user.register(userData, userData.password)
	.then (data) ->
		res.send data
	, (err) ->
		res.send {err: err}

getAll = (req, res) ->
	company.getAll().then (data) ->
		res.send data


module.exports = (app) ->
	app.post '/company/create', create
	app.get '/company/getAll', getAll
