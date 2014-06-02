'use strict'

guest = require '../business/guest'
phone = require 'phone'

create = (req, res) ->
	data = req.body
	guest.create(data).then ->
		res.send data
	, (err) ->
		res.send {err: err}

GetAll = (req, res) ->
	guest.GetAll().then (_data) ->
		res.send {data: _data}
	, (err) ->
		res.send {err: err}


module.exports = (app) ->
	app.post '/guest/create', create
	app.get '/guest/get_all', GetAll
