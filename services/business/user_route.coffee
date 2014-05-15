'use strict'

userRoute = require '../models/user_route'

create = (data) ->
	# create function always return a promise
	userRoute.create(data)

update = (id, data) ->
	userRoute.findByIdAndUpdate(id, data).exec()

getById = (id) ->
	userRoute.getById(id).exec()

getAll = ->
	userRoute.find({}).exec()

get = (index, limit) ->
	userRoute.find({}).sort({created_date: -1})
	.skip(index).limit(limit).exec()


module.exports = {
	create, update, getById, getAll, get
}
