'use strict'

User = require '../models/user'

create = (data) ->
	# create function always return a promise
	User.create(data)

update = (id, data) ->
	User.findByIdAndUpdate(id, data).exec()

getById = (id) ->
	User.getById(id).exec()

getAll = ->
	User.find({}).exec()

get = (index, limit) ->
	User.find({}).sort({created_date: -1})
	.skip(index).limit(limit).exec()


module.exports = {
	create, update, getById, getAll, get
}
