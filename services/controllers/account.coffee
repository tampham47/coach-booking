'use strict'

_ 			= require 'lodash'
passport = require 'passport'

register = (req, res) ->
	console.log 'register'

getUser = (request, response) ->
	if request.isAuthenticated()
		response.send _(request.user).pick('_id', 'username', 'role', '_company').value()
	else
		response.send 401 # Unauthorized

# Authenticate manually to send a custom status code in case of failure.
# By default, Passport will response with `401`, cause `http-auth-interceptor`
# to buffer the response.
login = (req, res, next) ->
	fn = passport.authenticate 'local', (err, user, info) ->
		throw err if err
		if user
			req.login user, (err) ->
				throw err if err
				res.send 204 # No Content
		else
			res.send 418 # I'm a teapot
	fn req, res, next

logout = (request, response) ->
	request.logout()
	response.send 204 # No Content

module.exports = (app) ->
	app.get '/account/getUser', getUser
	app.post '/account/login', login
	app.post '/account/logout', logout
