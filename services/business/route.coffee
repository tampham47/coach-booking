'use strict'

route = require '../models/route'

create = (data) ->
	# create function always return a promise
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


module.exports = {
	create, update, getById, get_all, get
}