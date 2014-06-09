'use strict'

user = require '../business/user'
moment = require 'moment'

Register = (req, res) ->
	console.log 'controller/register'
	data = req.body
	data.birthday = moment(data.birthday, 'DD/MM/YYYY').toDate()

	user.register(data, data.password)
	.then (data) ->
		res.send data
	, (err) ->
		res.send {err: err}

Create = (req, res) ->
	data = req.body
	data._company = req.user._company
	data.birthday = moment(data.birthday, 'DD/MM/YYYY').toDate()

	user.create(data).then (data) ->
		res.send data

Update = (req, res) ->
	d = req.body
	d.birthday = moment(d.birthday, 'DD/MM/YYYY').toDate()

	user.Update(d._id, d).then (data) ->
		res.send {data: data}
	, (err) ->
		res.send {err: err}

GetAll = (req, res) ->
	user.GetAll().then (data) ->
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
		# console.log 'user'
		# console.log data
		res.send {data: data}
	, (err) ->
		res.send {err: err}

##need to improve
ChangePassword = (request, response) ->
	b = request.body
	if b.oldPassword and b.newPassword
		request.user.authenticate b.oldPassword, (err, user, info) ->
			throw err if err
			if user
				user.setPassword b.newPassword, (err) ->
					throw err if err
					b.hash = user.hash
					b.salt = user.salt
					next()
			else
				response.send 418, info
	else
		next()

module.exports = (app) ->
	app.post '/user/create', Create
	app.post '/user/register', Register
	app.post '/user/update', Update
	app.post '/user/change_password', ChangePassword

	app.get '/user/get_all', GetAll
	app.get '/user/get_by_company', GetByCompany
	app.get '/user/get_by_id', GetById
