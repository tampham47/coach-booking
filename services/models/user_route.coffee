'use strict'

mongooes = require 'mongoose'
Schema = mongooes.Schema

UserRouteSchema = new Schema
	_user:
		type: Schema.Types.ObjectId
		ref: 'jp_user'
		require: true

	_route:
		type: Schema.Types.ObjectId
		ref: 'jp_route'
		require: true

	notes:
		type: String

	created_date:
		type: Date
		default: Date.now


module.exports = mongooes.model 'jp_user_route', UserRouteSchema
