'use strict'

Company = require '../models/company'
phone = require 'phone'

create = (data) ->
	console.log 'company'
	console.log data
	data.phone_number = phone(data.phone_number, 'VN')[0]
	# create function always return a promise
	Company.create(data).then (data) ->
		return data
	, (err) ->
		return {err: err}

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
