'use strict'

mongooes = require 'mongoose'
Schema = mongooes.Schema

CarSchema = new Schema
	_company:
		type: Schema.Types.ObjectId
		ref: 'jp_company'
		require: true

	name:
		type: String

	route:
		type: String

	start_date:
		type: String

	seats:
		type: [String]

	notes:
		type: String

	created_date:
		type: Date
		default: Date.now


module.exports = mongooes.model 'jp_car', CarSchema
