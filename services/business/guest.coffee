'use strict'

Guest = require '../models/guest'

create = (data) ->
	# create function always return a promise
	Guest.create(data)

update = (id, data) ->
	Guest.findByIdAndUpdate(id, data).exec()

getById = (id) ->
	Guest.getById(id).exec()

getAll = ->
	Guest.find({}).exec()

get = (index, limit) ->
	Guest.find({}).sort({created_date: -1})
	.skip(index).limit(limit).exec()


module.exports = {
	create, update, getById, getAll, get
}
