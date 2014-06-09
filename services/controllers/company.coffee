'use strict'

company = require '../business/company'
user = require '../business/user'

demoData = require '../business/#demo_data'
route = require '../business/route'
car = require '../business/car'
guid = require 'guid'

Create = (req, res) ->
	console.log 'company/create'
	c = req.body.company
	u = req.body.user

	user.GetByUserName(u.username).then (_user) ->
		if _user?
			err =
				message: 'This email has been used.'
			res.send { err: err }
		else
			company.Create(c)
			.then (data) ->
				u._company = data._id
				u.role = 'admin'
				user.register(u, u.password)
			.then (data) ->
				res.send data
			, (err) ->
				res.send {err: err}

_DEMOInsertCar = (_company, _route, type) ->
	if type is 1
		cars = demoData.GetListCar1()
	else
		cars = demoData.GetListCar2()

	for item in cars
		item._route = _route
		item._company = _company
		car.Create(item)

_DEMOInsertRoute = (_company) ->
	routes = demoData.GetRoutes()
	_index = 0
	for item in routes
		item._company = _company
		route.Create(item).then (data) ->
			_index++
			_DEMOInsertCar(_company, data._id, _index)

CreateWithData = (req, res) ->
	c = req.body.company
	u = req.body.user
	u.username = '#DEMO#' + u.username
	u.full_name = '#DEMO#' + u.full_name
	# u.password = guid.raw()

	user.GetByUserName(u.username).then (_user) ->
		if _user?
			err =
				message: 'This email has been used.'
			res.send { err: err }
		else
			c.is_demo = true
			company.Create(c)
			.then (data) ->
				u._company = data._id
				u.role = 'admin'

				#insert demo data
				_DEMOInsertRoute(data._id)
				user.register(u, u.password)
			.then (data) ->
				res.send data
			, (err) ->
				res.send {err: err}

GetAll = (req, res) ->
	company.GetAll().then (data) ->
		res.send data

GetById = (req, res) ->
	_company = req.query._company
	company.GetById(_company).then (data) ->
		res.send {data: data}
	, (err) ->
		res.send {err: err}

Update = (req, res) ->
	d = req.body
	console.log 'update'
	console.log d
	company.Update(d._id, d).then (data) ->
		res.send {data: data}
	, (err) ->
		res.send {err: err}


module.exports = (app) ->
	app.post '/company/create', Create
	app.post '/company/update', Update

	app.get '/company/getAll', GetAll
	app.get '/company/get_by_id', GetById

	app.post '/company/create_with_data', CreateWithData
