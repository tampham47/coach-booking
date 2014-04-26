'use strict'

mongooes = require 'mongoose'
Schema = mongooes.Schema

UserCarSchema = new Schema
	_user:
		type: Schema.Types.ObjectId
		ref: 'jp_user'
		require: true

	_car:
		type: Schema.Types.ObjectId
		ref: 'jp_car'
		require: true

	notes:
		type: String

	created_date:
		type: Date
		default: Date.now


module.exports = mongooes.model 'jp_user_car', UserCarSchema
