'use strict'

route = require '../business/route'

create = (req, res) ->
	console.log 'company/create'
	data = req.body
	data._company = req.user._company
	route.create(data).then (data) ->
		res.send data

get_all = (req, res) ->
	route.get_all().then (data) ->
		res.send data

GetByCompany = (req, res) ->
	_company = req.user._company
	route.GetByCompany(_company).then (data) ->
		res.send {data: data}
	, (err) ->
		res.send {err: err}

module.exports = (app) ->
	app.post '/route/create', create
	app.get '/route/get_all', get_all
	app.get '/route/get_by_company', GetByCompany
