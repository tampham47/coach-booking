'use strict'

Company = require '../models/company'

create = (data) ->
	# create function always return a promise
	Company.create(data)

update = (id, data) ->
	Company.findByIdAndUpdate(id, data).exec()

getById = (id) ->
	Company.getById(id).exec()

getAll = ->
	Company.find({}).exec()

get = (index, limit) ->
	Company.find({}).sort({created_date: -1})
	.skip(index).limit(limit).exec()


module.exports = {
	create, update, getById, getAll, get
}
