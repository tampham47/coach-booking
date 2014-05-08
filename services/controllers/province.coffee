'use strict'

province = require '../business/province'

get_all = (req, res) ->
	res.send province.get_all()


module.exports = (app) ->
	app.get '/province/get_all', get_all
