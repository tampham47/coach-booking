'use strict'

guest = require '../business/guest'

create = (req, res) ->
	data = req.body
	guest.create(data).then ->
		res.send data
	, (err) ->
		res.send
			err: err

getAll = (req, res) ->
	guest.getAll().then (data) ->
		res.send data


module.exports = (app) ->
	app.post '/guest/create', create
	app.get '/guest/getAll', getAll
