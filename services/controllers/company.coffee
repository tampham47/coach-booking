'use strict'

company = require '../business/company'

create = (req, res) ->
	data = req.body
	company.create(data).then ->
		res.send data
	, (err) ->
		res.send
			err: err

getAll = (req, res) ->
	company.getAll().then (data) ->
		res.send data


module.exports = (app) ->
	app.post '/company/create', create
	app.get '/company/getAll', getAll
