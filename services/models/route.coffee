'use strict'

mongooes = require 'mongoose'
Schema = mongooes.Schema

RouteSchema = new Schema
	_company:
		type: Schema.Types.ObjectId
		ref: 'jp_company'
		require: true

	full_name:
		type: String

	short_name:
		type: String

	from:
		type: String

	destination:
		type: String

	created_date:
		type: Date
		default: Date.now


module.exports = mongooes.model 'jp_route', RouteSchema
