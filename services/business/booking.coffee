'use strict'

Booking = require '../models/booking'

GetByCar = (_car, str_date) ->
	Booking.find({_car: _car, str_date: str_date})
	.populate('_guest').exec()

create = (data) ->
	# create function always return a promise
	Booking.create(data)

Update = (id, data) ->
	delete data._id
	Booking.findByIdAndUpdate(id, data).exec().then ->
		return GetById(id)
	, (err) ->
		return err

GetById = (id) ->
	Booking.findById(id).populate('_guest').exec()

GetAll = ->
	Booking.find({}).exec()

get = (index, limit) ->
	Booking.find({}).sort({created_date: -1})
	.skip(index).limit(limit).exec()


module.exports = {
	create, Update,
	GetById, GetAll, get, GetByCar
}
