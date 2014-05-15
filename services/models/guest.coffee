'use strict'

mongooes = require 'mongoose'
Schema = mongooes.Schema

GuestSchema = new Schema
	full_name:
		type: String
		required: true

	phone_number:
		type: String
		unique: true
		required: true

	email:
		type: String

	address:
		type: String

	created_date:
		type: Date
		default: Date.now


module.exports = mongooes.model 'jp_guest', GuestSchema
