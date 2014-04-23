'use strict'

bn_user = require '../business/user'

create = (req, res) ->
	data = req.body
	bn_user.create(data).then ->
		res.send 'created'

getAll = (req, res) ->
	bn_user.getAll().then (data) ->
		res.send data


module.exports = (app) ->
	app.post '/user/create', create
	app.get '/user/getAll', getAll
