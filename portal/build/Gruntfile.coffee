'use strict'

path = require 'path'

module.exports = (grunt) ->
	grunt.initConfig
		dist: 'F:/nginx-1.5.7/booking_management'

		coffee:
			all:
				expand: true
				cwd: '../controllers/'
				src: ['**/*.coffee']
				dest: '<%= dist %>/controllers/'
				ext: '.js'

			options:
				bare: true
				sourceMap: true

		mapcat:
			all:
				src: [
					'<%= dist %>/controllers/**/index.js.map'
					'<%= dist %>/controllers/**/*.js.map'
				]
				dest: '<%= dist %>/scripts.js'

			options:
				oldRoot: '../controllers/'
				newRoot: 'src'

		jade:
			all:
				expand: true
				cwd: '../views/'
				src: '**/*.jade'
				dest: '<%= dist %>/views/'
				ext: '.html'

			index:
				src: '../index.jade'
				dest: '<%= dist %>/index.html'

		html2js:
			all:
				src: '<%= dist %>/views/**/*.html'
				dest: '<%= dist %>/templates.js'

			options:
				base: '<%= dist %>'
				module: 'booking-mamangement.templates'
				rename: (name) ->
					name.replace /\.html$/, '.jade'
				indentString: '\t'
				quoteChar: "'"

		recess:
			all:
				expand: true
				cwd: '../bower_components/_contents/'
				src: '**/*.less'
				dest: '<%= dist %>/bower_components/_contents/'
				ext: '.css'

			options:
				compile: true

		# cssmin:
		# 	all:
		# 		src: '<%= dist %>/app/**/*.css'
		# 		dest: '<%= dist %>/styles.css'
		# 	options:
		# 		keepBreaks: true

		watch:
			coffee:
				files: ['../controllers/**/*.coffee']
				tasks: [
					'coffee'
					'mapcat'
				]
				options:
					spawn: false

			jade:
				files: '../views/**/*.jade'
				tasks: [
					'jade:all'
					'html2js'
				]
				options:
					spawn: false

			index:
				files: '../*.jade'
				tasks: 'jade:index'
				options:
					spawn: false

			recess:
				files: '../contents/**/*.less'
				tasks: [
					'recess'
					# 'cssmin'
				]
				options:
					spawn: false

			stylus:
				files: '../app/**/*.styl'
				tasks: [
					'stylus'
					'cssmin'
				]
				options:
					spawn: false

			options:
				dateFormat: (time) ->
					date = new Date().toLocaleTimeString()
					grunt.log.writeln "Completed in #{time}s at #{date}".cyan
					grunt.log.write 'Waiting... '

	targetFiles = {}

	# Compile only changed files
	grunt.event.on 'watch', (action, filepath, target) ->
		return if target is 'index'
		targetFiles[target] ?= []
		targetFiles[target].push filepath
		onChange()

	onChange = grunt.util._.debounce ->
		for target, files of targetFiles
			grunt.config [target, 'all', 'src'], files
		targetFiles = {}
	, 200

	grunt.loadNpmTasks 'grunt-html2js'
	grunt.loadNpmTasks 'grunt-mapcat'
	grunt.loadNpmTasks 'grunt-recess'

	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-cssmin'
	grunt.loadNpmTasks 'grunt-contrib-jade'
	grunt.loadNpmTasks 'grunt-contrib-stylus'
	grunt.loadNpmTasks 'grunt-contrib-watch'

	grunt.registerTask 'default', [
		'coffee'
		'mapcat'

		'jade'
		'html2js'

		'recess'
		# 'stylus'
		# 'cssmin'
	]
