'use strict'

route = require '../models/route'

create = (data) ->
	# create function always return a promise
	data.full_name = data.from + ' - ' + data.destination
	route.create(data).then (data) ->
		return data
	, (err) ->
		return {err: err}

update = (id, data) ->
	route.findByIdAndUpdate(id, data).exec()

getById = (id) ->
	route.getById(id).exec()

get_all = ->
	route.find({}).exec()

get = (index, limit) ->
	route.find({}).sort({created_date: -1})
	.skip(index).limit(limit).exec()

GetByCompany = (_company) ->
	route.find({_company: _company}).exec()

Create = (data) ->
	# create function always return a promise
	data.full_name = data.from + ' - ' + data.destination
	route.create(data).then (data) ->
		return data
	, (err) ->
		return {err: err}


module.exports = {
	create, update, Create,
	getById, get_all, get, GetByCompany
}
