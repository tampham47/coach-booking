'use strict'

booking = require '../business/booking'

create = (req, res) ->
	data = req.body
	booking.create(data).then ->
		res.send data
	, (err) ->
		res.send
			err: err

getAll = (req, res) ->
	booking.getAll().then (data) ->
		res.send data


module.exports = (app) ->
	app.post '/booking/create', create
	app.get '/booking/getAll', getAll
