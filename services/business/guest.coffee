'use strict'

Guest = require '../models/guest'
phone = require 'phone'

create = (data) ->
	# standing phone number
	data.phone_number = phone(data.phone_number, 'VN')[0]
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
