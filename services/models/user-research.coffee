'use strict'

mongooes = require 'mongoose'
Schema = mongooes.Schema

UserResearchSchema = new Schema
	_user:
		type: Schema.Types.ObjectId
		ref: 'User'
		require: true

	_post:
		type: ema.Types.ObjectId
		ref: 'Post'
		require: true

	role:
		type: String
		default: 'Nghiên cứu sinh'


module.exports = mongooes.model 'UserResearch', UserResearchSchema
