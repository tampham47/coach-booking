'use strict'

# Default modules
express = require('express')
path = require('path')
# routes = require('./routes')
app = express()

# Default configuration
app.set 'port', process.env.PORT or 3000
# app.set 'views', path.join(__dirname, '/')
app.set 'views', path.join(__dirname, '')
# app.set 'views', '../public'
app.set 'view engine', 'jade'
# app.use express.favicon(path.join(__dirname, '../public/favicon.ico'))
app.use express.logger('dev')
app.use express.urlencoded()
app.use express.json()
app.use express.methodOverride()
app.use express.cookieParser('frontend')
app.use app.router
app.use express.static(path.join(__dirname, '../public'))
app.locals.pretty = false

# Development configuration
if 'development' is app.get('env')
  app.use express.errorHandler(
    dumpExceptions: true
    showStack: true
  )
  app.locals.pretty = true

# Routes
app.get '/', (req, res) ->
  res.render 'index'
  return

# Initialization
app.listen app.get('port'), ->
  console.log 'Template is running on port ' + app.get('port')
  return
