'use strict'

angular.module("ng").filter "truncate", ->
	(value, max, tail) ->
		return '' unless value

		# remove html tag
		while value.indexOf('<') >= 0
			a = value.indexOf('<')
			b = value.indexOf('>')
			value = value.slice(0, a) + ' ' + value.slice(b+1, value.length)

		# remove double space
		while value.indexOf('  ') >= 0
			value = value.replace '  ', ' '

		max = parseInt(max, 10)
		return value unless max
		return value if value.length <= max

		value = value.substr(0, max)
		lastspace = value.lastIndexOf(' ')
		value = value.substr(0, lastspace) unless lastspace is -1

		value + (tail or '...')
