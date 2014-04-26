'use strict'

mongooes = require 'mongoose'
Schema = mongooes.Schema

GuestSchema = new Schema
	name:
		type: String

	email:
		type: String

	phone_number:
		type: String

	address:
		type: String

	created_date:
		type: Date
		default: Date.now


module.exports = mongooes.model 'jp_guest', GuestSchema
