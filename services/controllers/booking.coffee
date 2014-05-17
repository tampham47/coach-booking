'use strict'

booking = require '../business/booking'
guest = require '../business/guest'
moment = require 'moment'

Create = (req, res) ->
	b = req.body.booking
	g = req.body.guest

	guest.create(g).then (_guest) ->
		b._guest = _guest._id
		b.date = moment(b.str_date, 'DD/MM/YYYY').format 'MM/DD/YYYY'
		b.seat = b.selected_seats[0]
		bookingList = []

		_index = 0
		for item in b.selected_seats
			b.seat = item
			booking.create(b).then (_booking) ->
				_index++
				bookingList.push _booking

				if _index is b.selected_seats.length
					console.log 'send'
					res.send {status: 0, data: bookingList}
	, (err) ->
		console.log err.message
		res.send {err: err}

GetByCar = (req, res) ->
	_car = req.query._car
	str_date = req.query.str_date

	booking.GetByCar(_car, str_date)
	.then (_bookings) ->
		res.send {status: 0, data: _bookings}
	, (err) ->
		res.send {err: err}

create = (req, res) ->
	data = req.body
	booking.create(data).then ->
		res.send data
	, (err) ->
		res.send
			err: err

getAll = (req, res) ->
	booking.getAll().then (data) ->
		res.send data


module.exports = (app) ->
	app.post '/booking/create', create
	app.post '/booking/create2', Create

	app.get '/booking/getAll', getAll
	app.get '/booking/get_by_car', GetByCar
