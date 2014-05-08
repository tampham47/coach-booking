'use strict'

car = require '../business/car'
_str = require 'underscore.string'

create = (req, res) ->
	data = req.body
	tmp = _str.words data.seats, ','
	seats = []
	for item in tmp
		if item?
			seats.push (_str.trim item).toUpperCase()

	data.seats = seats
	data._company = req.user._company

	car.create(data).then (data) ->
		res.send data
	, (err) ->
		res.send { err: err }

getAll = (req, res) ->
	car.getAll().then (data) ->
		res.send data


module.exports = (app) ->
	app.post '/car/create', create
	app.get '/car/getAll', getAll
