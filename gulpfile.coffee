browserify = require 'browserify'
coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
gulp = require 'gulp'
gutil = require 'gulp-util'
jade = require 'gulp-jade'
minify = require 'gulp-minify-css'
plumber = require 'gulp-plumber'
prefix = require 'gulp-autoprefixer'
shell = require 'gulp-shell'
source = require 'vinyl-source-stream'
streamify = require 'gulp-streamify'
stylus = require 'gulp-stylus'
transform = require 'vinyl-transform'
uglify = require 'gulp-uglify'
watch = require 'gulp-watch'

# Directories

src =
  coffee: 'src/coffee/*.coffee'
  coffee_index: './src/coffee/index.coffee'
  stylus_index: 'src/stylus/index.styl'
  stylus: 'src/stylus/*.styl'
  jade: 'src/jade/index.jade'

dest =
  js: 'bin/js/'
  js_index: 'index.js'
  css: 'bin/css/'
  html: '.'

# Subtasks

task =
  coffee: ->
    browserify
      entries: src.coffee_index
      extensions: ['.coffee']
    .transform 'coffeeify'
    .bundle()
    .on('error', (err) -> console.error err.toString())
    .pipe plumber()
    .pipe source dest.js_index
    .pipe streamify uglify()
    .pipe gulp.dest dest.js

  stylus: ->
    gulp.src src.stylus_index
      .pipe plumber()
      .pipe stylus()
      .pipe prefix()
      .pipe minify()
      .pipe gulp.dest dest.css

  jade: ->
    gulp.src src.jade
      .pipe plumber()
      .pipe jade()
      .pipe gulp.dest dest.html

gulp.task 'coffee', -> task.coffee()
gulp.task 'stylus', -> task.stylus()
gulp.task 'jade', -> task.jade()

# Main Tasks

gulp.task 'build', ->
  task.coffee()
  task.stylus()
  task.jade()

gulp.task 'docs', shell.task 'docco ' + src.coffee

gulp.task 'watch', ->
  gulp.watch src.coffee, ['coffee', 'docs']
  gulp.watch src.stylus, ['stylus']
  gulp.watch src.jade, ['jade']

gulp.task 'default', ['build', 'docs', 'watch']