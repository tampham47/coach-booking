'use strict'

bn_comment = require '../business/comment'

create = (req, res) ->
	data = req.body
	bn_comment.create(data).then (data) ->
		res.send data

getByPostId = (req, res) ->
	postId = req.query.postId
	bn_comment.getByPostId(postId)
	.then (data) ->
		res.send data


module.exports = (app) ->
	app.post '/comment/create', create
	app.get '/comment/getByPostId', getByPostId
