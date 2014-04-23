'use strict'

mongooes = require 'mongoose'
Schema = mongooes.Schema

UserSchema = new Schema
	userName:
		type: String
		unique: true
		require: true

	email:
		type: String
		unique: true

	firstName:
		type: String

	lastName:
		type: String

	birthday:
		type: Date

	avatar:
		type: String

	role:
		type: String

	modified:
		type: Date
		default: Date.now

module.exports = mongooes.model 'User', UserSchema
