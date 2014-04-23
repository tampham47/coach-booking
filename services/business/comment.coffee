'use strict'

Comment = require '../models/comment'

create = (data) ->
	# create function always return a promise
	Comment.create(data)

getByPostId = (postId) ->
	Comment.find({_post: postId}).sort({modified: 1}).exec()


module.exports = {
	create, getByPostId
}
