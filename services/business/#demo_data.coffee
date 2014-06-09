'use strict'

provinces = [
	{_id: 1, province: "Sài Gòn", short_name: "SG"},
	{_id: 2, province: "Kon Tum", short_name: "KT"},
	{_id: 3, province: "Gia Lai", short_name: "GL"},
	{_id: 4, province: "Đăk Lăk", short_name: "ĐL"},
	{_id: 5, province: "Đăk Nông", short_name: "ĐN"},
	{_id: 6, province: "Lâm Đồng", short_name: "LĐ"},
	{_id: 7, province: "Đà Nẵng", short_name: "ĐN"}]

routes = [
	{
		"from" : "Sài Gòn",
		"destination" : "Kon Tum",
		"short_name" : "GS-KT",
		"full_name" : "Sài Gòn - Kon Tum"
	},
	{
		"from" : "Kon Tum",
		"destination" : "Sài Gòn",
		"short_name" : "KT-SG",
		"full_name" : "Kon Tum - Sài Gòn - "
	}]

car_list1 = [
	{
		"name" : "XE GHẾ NẰM TÀI 1",
		"notes" : "A: Là ghế hàng 1\nB: Là ghế hàng 2\nC: Là ghế hàng 3",
		"price" : "270.000",
		"seats" : ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9"],
		"start_time" : "17:17"
	},
	{
		"name" : "XE GHẾ NẰM TÀI 2",
		"notes" : "A: Là ghế hàng 1\nB: Là ghế hàng 2\nC: Là ghế hàng 3",
		"price" : "270.000",
		"seats" : ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9"],
		"start_time" : "17:17"
	}]

car_list2 = [
	{
		"name" : "XE GHẾ NẰM TÀI 3",
		"notes" : "A: Là ghế hàng 1\nB: Là ghế hàng 2\nC: Là ghế hàng 3",
		"price" : "270.000",
		"seats" : ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9"],
		"start_time" : "17:17"
	},
	{
		"name" : "XE GHẾ NẰM TÀI 4",
		"notes" : "A: Là ghế hàng 1\nB: Là ghế hàng 2\nC: Là ghế hàng 3",
		"price" : "270.000",
		"seats" : ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9"],
		"start_time" : "17:17"
	}]


GetProvinces = ->
	return provinces

GetRoutes = ->
	return routes

GetListCar1 = ->
	return car_list1

GetListCar2 = ->
	return car_list2

module.exports = {
	GetProvinces, GetRoutes, GetListCar1, GetListCar2
}
