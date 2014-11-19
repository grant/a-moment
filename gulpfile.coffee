browserify = require 'gulp-browserify'
coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
gulp = require 'gulp'
gutil = require 'gulp-util'
prefix = require 'gulp-autoprefixer'
stylus = require 'gulp-stylus'
uglify = require 'gulp-uglify'
watch = require 'gulp-watch'
minify = require 'gulp-minify-css'

# Directories

src =
  coffee: 'src/coffee/**/*.coffee'
  stylus: 'src/stylus/index.styl'
  jade: 'src/jade/index.jade'

dest =
  js: 'bin/js/'
  css: 'bin/css/'
  html: '/'

# Tasks
