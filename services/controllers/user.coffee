'use strict'

user = require '../business/user'

create = (req, res) ->
	data = req.body
	user.create(data).then ->
		res.send data
	, (err) ->
		res.send
			err: err

getAll = (req, res) ->
	user.getAll().then (data) ->
		res.send data


module.exports = (app) ->
	app.post '/user/create', create
	app.get '/user/getAll', getAll
