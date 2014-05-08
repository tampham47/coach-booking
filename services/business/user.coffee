'use strict'

User = require '../models/user'
mongoose = require 'mongoose'

create = (data) ->
	# create function always return a promise
	User.create(data)

register = (data, pass) ->
	promise = new mongoose.Promise
	User.register data, pass, (err, user) ->
		if err
			promise.error err
			return
		promise.complete user
	promise

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
	create, update, getById, getAll, get,
	register
}
