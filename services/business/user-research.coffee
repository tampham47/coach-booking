'use strict'

UserResearch = require '../models/user-research'

create = (data) ->
	# create function always return a promise
	UserResearch.create(data)

update = (id, data) ->
	UserResearch.findByIdAndUpdate(id, data).exec()

getById = (id) ->
	UserResearch.getById(id).exec()

getAll = ->
	UserResearch.find({}).exec()


module.exports = {
	create, update, getById, getAll
}
