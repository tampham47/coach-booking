'use strict'

express  = require 'express'
passport = require 'passport'
mongoose = require 'mongoose'
fs		 	= require 'fs'


# configure express
app = express()
app.use express.json()
app.use express.urlencoded()
app.use express.cookieParser()
app.use express.session(secret: 'madoka')
app.use passport.initialize()
app.use passport.session()

require('./controllers')(app)

# configure passport
User = mongoose.model 'jp_user'
passport.use User.createStrategy()
passport.serializeUser User.serializeUser()
passport.deserializeUser User.deserializeUser()

mongoose.connect 'mongodb://localhost/jpexpress'

app.listen 3001
console.log 'Listening on port 3001...'
