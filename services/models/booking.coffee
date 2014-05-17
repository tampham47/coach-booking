'use strict'

mongooes = require 'mongoose'
Schema = mongooes.Schema

BookingSchema = new Schema
	_guest:
		type: Schema.Types.ObjectId
		ref: 'jp_guest'
		require: true

	_car:
		type: Schema.Types.ObjectId
		ref: 'jp_car'
		require: true

	date:
		type: Date

	str_date:
		type: String

	seat:
		type: String

	from:
		type: String

	destination:
		type: String

	status:
		type: String
		enum: ['order', 'confirm', 'paid', 'cancel']
		default: 'order'

	created_date:
		type: Date
		default: Date.now


module.exports = mongooes.model 'jp_booking', BookingSchema
