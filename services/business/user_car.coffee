'use strict'

UserCar = require '../models/user_car'

create = (data) ->
	# create function always return a promise
	UserCar.create(data)

update = (id, data) ->
	UserCar.findByIdAndUpdate(id, data).exec()

getById = (id) ->
	UserCar.getById(id).exec()

getAll = ->
	UserCar.find({}).exec()

get = (index, limit) ->
	UserCar.find({}).sort({created_date: -1})
	.skip(index).limit(limit).exec()


module.exports = {
	create, update, getById, getAll, get
}
