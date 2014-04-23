'use strict'

mongooes = require 'mongoose'
Schema = mongooes.Schema

CommentSchema = new Schema
	_user:
		type: Schema.Types.ObjectId
		ref: 'User'
		require: true

	_post:
		type: Schema.Types.ObjectId
		ref: 'Post'
		require: true

	content:
		type: String

	modified:
		type: Date
		default: new Date


module.exports = mongooes.model 'Comment', CommentSchema
