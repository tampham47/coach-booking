'use strict'

Company = require '../models/company'
phone = require 'phone'

Create = (data) ->
	console.log 'company'
	console.log data
	data.phone_number = phone(data.phone_number, 'VN')[0]
	# create function always return a promise
	Company.create(data).then (data) ->
		return data
	, (err) ->
		return {err: err}

Update = (id, data) ->
	delete data._id
	Company.findByIdAndUpdate(id, data).exec()

GetAll = ->
	Company.find({}).exec()

GetById = (_company) ->
	Company.findById(_company).exec()


module.exports = {
	Create, Update,
	GetAll, GetById
}
