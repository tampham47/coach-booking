'use strict'

bn_post = require '../business/post'

create = (req, res) ->
	data = req.body
	bn_post.create(data).then ->
		res.send 'created'

getById = (req, res) ->
	console.log 'controller/getById'
	console.log req.query.id

	id = req.query.id
	bn_post.getById(id).then (data) ->
		res.send data

getAll = (req, res) ->
	console.log 'controller/getAll'

	bn_post.getAll().then (data) ->
		res.send data

getByType = (req, res) ->
	type = req.query.type
	bn_post.getByType(type).then (data) ->
		res.send data

getByTypeAndPaging = (req, res) ->
	type = req.query.type
	current_page = req.query.current_page
	items_per_page = req.query.items_per_page

	bn_post.getByTypeAndPaging(type, current_page, items_per_page).then (data) ->
		res.send data

countAll = (req, res) ->
	type = req.query.type
	bn_post.countAll(type).then (data) ->
		res.send 'countAll: ' + data

module.exports = (app) ->
	app.post '/post/create', create
	app.get '/post/getall', getAll
	app.get '/post/getById', getById
	app.get '/post/getByType', getByType
	app.get '/post/getByTypeAndPaging', getByTypeAndPaging
	app.get '/post/countAll', countAll

