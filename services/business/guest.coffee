'use strict'

guest = require '../models/guest'
phone = require 'phone'

create = (data) ->
	# standing phone number
	s_number = phone(data.phone_number, 'VNM')
	if s_number.length > 0
		data.phone_number = s_number

	guest.find({phone_number: data.phone_number}).exec()
	.then (_guest) ->
		return _guest[0] if _guest.length > 0
		guest.create(data)

update = (id, data) ->
	guest.findByIdAndUpdate(id, data).exec()

getById = (id) ->
	guest.getById(id).exec()

GetAll = ->
	guest.find({}).exec()

get = (index, limit) ->
	guest.find({}).sort({created_date: -1})
	.skip(index).limit(limit).exec()


module.exports = {
	create, update,
	getById, GetAll, get
}
