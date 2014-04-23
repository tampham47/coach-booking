'use strict'

# Cross-origin resource sharing
allowCors = (request, response, next) ->
	response.set 'Access-Control-Allow-Origin' , 'http://localhost:1010'
	response.set 'Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE'
	response.set 'Access-Control-Allow-Headers', 'Content-Type'
	response.set 'Access-Control-Allow-Credentials', true
	next()


module.exports = (app) ->
	app.all '*', allowCors

	require('./user')(app)
	require('./post')(app)
	require('./comment')(app)

