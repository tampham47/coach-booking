'use strict'

guestCompany = require '../business/guest_company'

create = (req, res) ->
	data = req.body
	guestCompany.create(data).then ->
		res.send data
	, (err) ->
		res.send
			err: err

getAll = (req, res) ->
	guestCompany.getAll().then (data) ->
		res.send data


module.exports = (app) ->
	app.post '/guest_company/create', create
	app.get '/guest_company/getAll', getAll
