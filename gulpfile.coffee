browserify = require 'gulp-browserify'
coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
gulp = require 'gulp'
gutil = require 'gulp-util'
jade = require 'gulp-jade'
prefix = require 'gulp-autoprefixer'
stylus = require 'gulp-stylus'
uglify = require 'gulp-uglify'
watch = require 'gulp-watch'
minify = require 'gulp-minify-css'

# Directories

src =
  coffee: 'src/coffee/**/*.coffee'
  coffee_index: 'src/coffee/index.coffee'
  stylus: 'src/stylus/index.styl'
  jade: 'src/jade/index.jade'

dest =
  js: 'bin/js/'
  css: 'bin/css/'
  html: '/'

# Tasks

gulp.task 'coffee', ->
  gulp.src src.coffee_index
    # lint
    .pipe coffeelint()
    .pipe coffeelint.reporter()

    # Browserify
    .coffee().on 'error', gutil.log
    .pipe browserify
      transform: ['coffeeify']
    .pipe uglify()
    .pipe gulp.dest dest.coffee

gulp.task 'stylus', ->
  gulp.src src.stylus
    .pipe stylus()
    .pipe prefix()
    .pipe minify()
    .pipe gulp.dest dest.stylus

gulp.task 'jade', ->
  gulp.src src.jade
    .pipe jade()
    .pipe gulp.dest dest.html

gulp.task 'watch', ->
  gulp.watch src.coffee, ['coffee']
  gulp.watch src.stylus, ['stylus']
  gulp.watch src.jade, ['jade']

gulp.task 'default', ['jade', 'stylus', 'coffee', 'watch']