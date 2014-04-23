'use strict'

Post = require '../models/post'

create = (data) ->
	# create function always return a promise
	Post.create(data)

update = (id, data) ->
	Post.findByIdAndUpdate(id, data).exec()

getById = (id) ->
	Post.findById(id).exec()

getAll = ->
	Post.find({}).sort({modified: -1}).exec()

getByType = (type) ->
	Post.find({type: type}).sort({modified: -1}).exec()

countAll = (type) ->
	Post.count({type: type}).exec()

getByTypeAndPaging= (type, current_page, items_per_page) ->
	model = {}
	Post.find({type: type})
	.sort({modified: -1})
	.skip(current_page * items_per_page)
	.limit(items_per_page).exec()
	.then (data) ->
		model.data = data
		countAll type
	.then (items) ->
		model.all_items = items
		model.highest_page = Math.round(items/items_per_page)
		if (model.highest_page * items_per_page) < items
			model.highest_page = model.highest_page + 1
		model.highest_page = model.highest_page - 1

		model


module.exports = {
	create, update,
	getById, getAll, getByType, getByTypeAndPaging,
	countAll
}
