'use strict'

car = require '../business/car'
_str = require 'underscore.string'

Create = (req, res) ->
	data = req.body
	tmp = _str.words data.seats, ','
	seats = []
	for item in tmp
		if _str.trim(item) != ''
			seats.push (_str.trim item).toUpperCase()

	data.seats = seats
	data.name = data.name.toUpperCase()

	data._company = req.user._company
	car.create(data).then (data) ->
		res.send data
	, (err) ->
		res.send { err: err }

GetAll = (req, res) ->
	car.getAll().then (data) ->
		res.send data

GetByRoute = (req, res) ->
	_route = req.query._route
	car.GetByRoute(_route).then (data) ->
		res.send data

GetById = (req, res) ->
	_car = req.query._car
	car.GetById(_car).then (data) ->
		res.send {data: data}
	, (err) ->
		res.send {err: err}

Update = (req, res) ->
	d = req.body
	car.Update(d._id, d).then (data) ->
		res.send {data: data}
	, (err) ->
		res.send {err: err}


module.exports = (app) ->
	app.post '/car/create', Create
	app.post '/car/update', Update

	app.get '/car/getAll', GetAll
	app.get '/car/getbyroute', GetByRoute
	app.get '/car/get_by_id', GetById
