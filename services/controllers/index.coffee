'use strict'

# Cross-origin resource sharing
allowCors = (request, response, next) ->
	response.set 'Access-Control-Allow-Origin' , request.headers.origin
	response.set 'Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE'
	response.set 'Access-Control-Allow-Headers', 'Content-Type'
	response.set 'Access-Control-Allow-Credentials', true

	if request.method is 'OPTIONS'
		response.send(200)
	else
		next()

checking_authentication = (req, res, next) ->
	if (req.url is '/account/login') or (req.url is '/company/create') or (req.url is '/company/create_with_data') or req.isAuthenticated()
		next()
	else
		res.send 401 # Unauthorized

module.exports = (app) ->
	app.all '*', allowCors
	app.all '*', checking_authentication

	require('./booking')(app)
	require('./car')(app)
	require('./company')(app)
	require('./guest')(app)
	require('./guest_company')(app)
	require('./user')(app)
	require('./user_car')(app)
	require('./province')(app)
	require('./route')(app)
	require('./account')(app)
	require('./excel')(app)
