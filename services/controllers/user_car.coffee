'use strict'

userCar = require '../business/user_car'

create = (req, res) ->
	data = req.body
	userCar.create(data).then ->
		res.send data
	, (err) ->
		res.send
			err: err

getAll = (req, res) ->
	userCar.getAll().then (data) ->
		res.send data


module.exports = (app) ->
	app.post '/user_car/create', create
	app.get '/user_car/getAll', getAll
