'use strict'

user = require '../business/user'

register = (req, res) ->
	console.log 'controller/register'
	data = req.body

	user.register(data, data.password)
	.then (data) ->
		res.send data
	, (err) ->
		res.send {err: err}

create = (req, res) ->
	data = req.body
	data._company = req.user._company

	user.create(data).then (data) ->
		res.send data

getAll = (req, res) ->
	user.getAll().then (data) ->
		res.send data

GetByCompany = (req, res) ->
	_company = req.user._company
	user.GetByCompany(_company).then (data) ->
		res.send {data: data}
	, (err) ->
		res.send {err: err}

RegisterByCompany = (req, res) ->
	data = req.body
	user.register(data, data.password)
	.then (data) ->
		res.send data
	, (err) ->
		res.send {err: err}

GetById = (req, res) ->
	_user = req.query._user
	user.GetById(_user).then (data) ->
		res.send {data: data}
	, (err) ->
		res.send {err: err}

module.exports = (app) ->
	app.post '/user/create', create
	app.post '/user/register', register
	app.get '/user/getAll', getAll
	app.get '/user/get_by_company', GetByCompany
	app.get '/user/get_by_id', GetById
