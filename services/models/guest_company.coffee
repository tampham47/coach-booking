'use strict'

mongooes = require 'mongoose'
Schema = mongooes.Schema

GuestCompanySchema = new Schema
	_company:
		type: Schema.Types.ObjectId
		ref: 'jp_company'
		require: true

	_guest:
		type: Schema.Types.ObjectId
		ref: 'jp_guest'
		require: true

	notes:
		type: String

	created_date:
		type: Date
		default: Date.now


module.exports = mongooes.model 'jp_guest_company', GuestCompanySchema
