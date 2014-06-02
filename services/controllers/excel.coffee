nodeExcel = require 'excel-export'

Excel = (req, res) ->
	conf = {}
	conf.stylesXmlFile = "node_modules/excel-export/example/styles.xml"
	conf.cols = [
		{
			caption: "string"
			type: "string"
			beforeCellWrite: (row, cellData) ->
				cellData.toUpperCase()
			width: 28.7109375
		}
		{
			caption: "date"
			type: "date"
			beforeCellWrite: (row, cellData) ->
				return new Date() if cellData is null
				cellData
				# originDate = new Date(Date.UTC(1899, 11, 30))
				# (row, cellData, eOpt) ->
				# 	if eOpt.rowNum % 2
				# 		eOpt.styleIndex = 1
				# 	else
				# 		eOpt.styleIndex = 2
				# 	if cellData is null
				# 		eOpt.cellType = "string"
				# 		"N/A"
				# 	else
				# 		(cellData - originDate) / (24 * 60 * 60 * 1000)
		}
		{
			caption: "bool"
			type: "bool"
		}
		{
			caption: "number"
			type: "number"
		}
	]
	conf.rows = [
		[
			"pi"
			new Date(Date.UTC(2013, 4, 1))
			true
			3.14
		]
		[
			"e"
			new Date(2012, 4, 1)
			false
			2.7182
		]
		[
			"M&M<>'"
			new Date(Date.UTC(2013, 6, 9))
			false
			1.61803
		]
		[
			"null date"
			null
			true
			1.414
		]
	]
	result = nodeExcel.execute(conf)
	res.setHeader "Content-Type", "application/vnd.openxmlformats"
	res.setHeader "Content-Disposition", "attachment; filename=" + "Report.xlsx"
	res.end result, "binary"
	return

module.exports = (app) ->
	app.get '/excel', Excel
