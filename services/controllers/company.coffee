'use strict'

company = require '../business/company'
user = require '../business/user'

create = (req, res) ->
	console.log 'company/create'
	c = req.body.company
	u = req.body.user

	user.GetByUserName(u.username).then (_user) ->
		if _user?
			err =
				message: 'This email has been used.'
			res.send { err: err }
		else
			company.create(c)
			.then (data) ->
				u._company = data._id
				u.role = 'admin'
				user.register(u, u.password)
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
