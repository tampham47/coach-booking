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
		# b.seat = b.selected_seats[0]
		if b.selected_seats.length is 0
			b.selected_seats.push b.seat

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

CreateOne = (req, res) ->
	b = req.body.booking
	g = req.body.guest

	guest.create(g).then (_guest) ->
		b._guest = _guest._id
		b.date = moment(b.str_date, 'DD/MM/YYYY').format 'MM/DD/YYYY'

		booking.create(b).then (_booking) ->
			res.send {status: 0, data: _booking}
	, (err) ->
		res.send {err: err}

GetByCar = (req, res) ->
	_car = req.query._car
	str_date = req.query.str_date

	booking.GetByCar(_car, str_date)
	.then (_bookings) ->
		res.send {status: 0, data: _bookings}
	, (err) ->
		res.send {err: err}

GetAll = (req, res) ->
	booking.GetAll().then (data) ->
		res.send data

Update = (req, res) ->
	d = req.body
	booking.Update(d._id, d).then (data) ->
		res.send {data: data}
	, (err) ->
		res.send {err: err}


module.exports = (app) ->
	app.post '/booking/create', Create
	app.post '/booking/create_one', CreateOne

	app.get '/booking/getAll', GetAll
	app.get '/booking/get_by_car', GetByCar

	app.post '/booking/update', Update
