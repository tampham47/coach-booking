'use strict'

booking = require '../business/booking'
guest = require '../business/guest'
car = require '../business/car'

moment = require 'moment'
nodeExcel = require 'excel-export'
str = require 'underscore.string'
utf8 = require 'utf8'

Create = (req, res) ->
	b = req.body.booking
	g = req.body.guest

	guest.create(g).then (_guest) ->
		b._guest = _guest._id
		b.date = moment(b.str_date, 'DD/MM/YYYY').format 'MM/DD/YYYY'
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

Export = (req, res) ->
	_car = req.query._car
	str_date = req.query.str_date

	config = {}
	config.stylesXmlFile = "node_modules/excel-export/example/styles.xml"
	config.cols = [
		{caption: 'Họ Tên', type: 'string'},
		{caption: 'Điện thoại', type: 'string'},
		{caption: 'Ngày đặt', type: 'string'},
		{caption: 'Ghế', type: 'string'},
		{caption: 'Điểm đón', type: 'string'},
		{caption: 'Điểm đến', type: 'string'},
		{caption: 'Trạng Thái', type: 'string'}]


	carModel = {}
	car.GetById(_car).then (car_model) ->
		carModel = car_model
		booking.GetByCar(_car, str_date)
	.then (_bookings) ->
		builder = []; status = []
		status['order'] = '---'
		status['confirmed'] = 'Đã xác nhận'
		status['paid'] = 'Đã thanh toán'

		for item in _bookings
			builder[_i] = []
			builder[_i].push item._guest.full_name
			builder[_i].push item._guest.phone_number
			builder[_i].push item.str_date
			builder[_i].push item.seat
			builder[_i].push item.from
			builder[_i].push item.destination
			builder[_i].push status[item.status] || item.status

		config.rows = builder
		result = nodeExcel.execute config

		fileName = str.titleize(carModel.name) + ' #' + str_date + '.xlsx'
		res.setHeader "Content-Type", "application/vnd.openxmlformats"
		res.setHeader "Character-Encoding", "UTF-8"
		res.setHeader "Content-Disposition", "attachment; filename=" + utf8.encode(fileName)
		res.end result, "binary"

		# fileName = str.slugify(carModel.name) + '#' + str_date + '.xlsx'
		# res.setHeader "Content-Type", "application/vnd.openxmlformats"
		# res.setHeader "Content-Disposition", "attachment; filename=" + fileName
		# res.end result, "binary"
		return
	, (err) ->
		res.send {err: err}

module.exports = (app) ->
	app.post '/booking/create', Create
	app.post '/booking/create_one', CreateOne

	app.get '/booking/getAll', GetAll
	app.get '/booking/get_by_car', GetByCar
	app.post '/booking/update', Update

	app.get '/booking/export', Export
