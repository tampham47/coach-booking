'use strict'

mongooes = require 'mongoose'
Schema = mongooes.Schema

CompanySchema = new Schema
	company_name:
		type: String

	city:
		type: String

	address:
		type: String

	phone_number:
		type: String

	notes:
		type: String

	expiration_date:
		type: Date

	is_demo:
		type: Boolean

	created_date:
		type: Date
		default: Date.now


module.exports = mongooes.model 'jp_company', CompanySchema
