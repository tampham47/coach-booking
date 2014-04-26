'use strict'

car = require '../business/car'

create = (req, res) ->
	data = req.body
	car.create(data).then ->
		res.send data
	, (err) ->
		res.send
			err: err

getAll = (req, res) ->
	car.getAll().then (data) ->
		res.send data


module.exports = (app) ->
	app.post '/car/create', create
	app.get '/car/getAll', getAll
