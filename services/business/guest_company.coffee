'use strict'

GuestCompany = require '../models/guest_company'

create = (data) ->
	# create function always return a promise
	GuestCompany.create(data)

update = (id, data) ->
	GuestCompany.findByIdAndUpdate(id, data).exec()

getById = (id) ->
	GuestCompany.getById(id).exec()

getAll = ->
	GuestCompany.find({}).exec()

get = (index, limit) ->
	GuestCompany.find({}).sort({created_date: -1})
	.skip(index).limit(limit).exec()


module.exports = {
	create, update, getById, getAll, get
}
