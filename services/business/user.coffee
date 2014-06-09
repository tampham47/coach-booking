'use strict'

User = require '../models/user'
mongoose = require 'mongoose'
phone = require 'phone'

create = (data) ->
	# create function always return a promise
	data.phone_number = phone(data.phone_number, 'VN')[0]
	User.create(data)

register = (data, pass) ->
	promise = new mongoose.Promise
	data.phone_number = phone(data.phone_number, 'VN')[0]
	User.register data, pass, (err, user) ->
		if err
			promise.error err
			return
		promise.complete user
	promise

GetAll = ->
	User.find({}).exec()

GetByUserName = (username) ->
	User.findOne({username: username}).exec()

GetByCompany = (_company) ->
	User.find({_company: _company}).exec()

GetById = (_user) ->
	User.findById(_user).exec()

Update = (_id, data) ->
	delete data._id
	User.findByIdAndUpdate(_id, data).exec()

module.exports = {
	create, Update,
	GetAll, GetByUserName, GetByCompany, GetById,
	register
}
