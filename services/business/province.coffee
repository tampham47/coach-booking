'use strict'

provinces = [
	{_id: 1, province: "Sài Gòn", short_name: "SG"},
	{_id: 2, province: "Kon Tum", short_name: "KT"},
	{_id: 3, province: "Gia Lai", short_name: "GL"},
	{_id: 4, province: "Đăk Lăk", short_name: "ĐL"},
	{_id: 5, province: "Đăk Nông", short_name: "ĐN"},
	{_id: 6, province: "Lâm Đồng", short_name: "LĐ"},
	{_id: 7, province: "Đà Nẵng", short_name: "ĐN"}]


get_all = ->
	return provinces

module.exports = {
	get_all
}
