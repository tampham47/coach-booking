'use strict'

# Cross-origin resource sharing
allowCors = (request, response, next) ->
	response.set 'Access-Control-Allow-Origin' , '*'
	response.set 'Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE'
	response.set 'Access-Control-Allow-Headers', 'Content-Type'
	response.set 'Access-Control-Allow-Credentials', true
	next()


module.exports = (app) ->
	app.all '*', allowCors

	require('./booking')(app)
	require('./car')(app)
	require('./company')(app)
	require('./guest')(app)
	require('./guest_company')(app)
	require('./user')(app)
	require('./user_car')(app)
