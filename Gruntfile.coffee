'use strict'

path = require 'path'

module.exports = (grunt) ->
  grunt.initConfig
    dist: 'public'

    coffee:
      all:
        expand: true
        cwd: 'portal/controllers/'
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
        oldRoot: 'portal/controllers/'
        newRoot: 'src'

    jade:
      all:
        expand: true
        cwd: 'portal/views/'
        src: '**/*.jade'
        dest: '<%= dist %>/views/'
        ext: '.html'

      index:
        src: 'portal/index.jade'
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

    # recess:
    #   all:
    #     expand: true
    #     cwd: 'portal/bower_components/_contents/'
    #     src: '**/*.less'
    #     dest: '<%= dist %>/bower_components/_contents/'
    #     ext: '.css'

    #   options:
    #     compile: true

    copy:
      bower:
        files: [
          expand: true
          cwd: 'portal/bower_components/'
          src: '**/*'
          dest: 'public/bower_components/'
        ]

    watch:
      coffee:
        files: ['portal/controllers/**/*.coffee']
        tasks: [
          'coffee'
          'mapcat'
        ]
        options:
          spawn: false

      jade:
        files: 'portal/views/**/*.jade'
        tasks: [
          'jade:all'
          'html2js'
        ]
        options:
          spawn: false

      index:
        files: 'portal/*.jade'
        tasks: 'jade:index'
        options:
          spawn: false

      recess:
        files: 'portal/contents/**/*.less'
        tasks: [
          'recess'
        ]
        options:
          spawn: false

      stylus:
        files: 'portal/app/**/*.styl'
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

    nodemon:
      local:
        script: 'portal/server.coffee'

    concurrent:
      options:
        limit: 4

      local:
        tasks: [
          'nodemon:local'
          'watch'
        ]
        options:
          logConcurrentOutput: true

    clean:
      build: ['public']
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


  grunt.file.expand("./node_modules/grunt-*/tasks").forEach grunt.loadTasks
  # grunt.loadNpmTasks 'grunt-html2js'
  # grunt.loadNpmTasks 'grunt-mapcat'
  # grunt.loadNpmTasks 'grunt-recess'
  # grunt.loadNpmTasks 'grunt-contrib-coffee'
  # grunt.loadNpmTasks 'grunt-contrib-cssmin'
  # grunt.loadNpmTasks 'grunt-contrib-jade'
  # grunt.loadNpmTasks 'grunt-contrib-stylus'
  # grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', [
    'clean'
    'coffee'
    'mapcat'
    'jade'
    'html2js'
    'copy'
    'concurrent:local'
  ]
