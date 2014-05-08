'use strict'

user = require '../business/user'

register = (req, res) ->
	console.log 'controller/register'
	data = req.body
	console.log data
	user.register(data, data.password)
	.then (data) ->
		console.log data
		res.send data
	, (err) ->
		console.log err
		res.send {err: err}

create = (req, res) ->
	data = req.body
	user.create(data).then (data) ->
		res.send data

getAll = (req, res) ->
	user.getAll().then (data) ->
		res.send data


module.exports = (app) ->
	app.post '/user/create', create
	app.post '/user/register', register
	app.get '/user/getAll', getAll
