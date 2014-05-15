'use strict'

userRoute = require '../business/user_car'

create = (req, res) ->
	data = req.body
	userRoute.create(data).then ->
		res.send data
	, (err) ->
		res.send { err: err }

getAll = (req, res) ->
	userRoute.getAll().then (data) ->
		res.send data


module.exports = (app) ->
	app.post '/user_car/create', create
	app.get '/user_car/getAll', getAll
