'use strict'

mongooes = require 'mongoose'
passportLocal  = require 'passport-local-mongoose'

Schema = mongooes.Schema

UserSchema = new Schema
	_company:
		type: Schema.Types.ObjectId
		ref: 'jp_company'
		require: true

	username:
		type: String
		unique: true
		require: true

	phone_number:
		type: String

	email:
		type: String

	full_name:
		type: String

	birthday:
		type: Date

	role:
		type: String
		enum: ['admin', 'manager']

	notes:
		type: String

	created_date:
		type: Date
		default: Date.now

UserSchema.plugin passportLocal

module.exports = mongooes.model 'jp_user', UserSchema
