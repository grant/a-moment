browserify = require 'browserify'
coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
gulp = require 'gulp'
gutil = require 'gulp-util'
jade = require 'gulp-jade'
prefix = require 'gulp-autoprefixer'
stylus = require 'gulp-stylus'
watch = require 'gulp-watch'
transform = require 'vinyl-transform'
minify = require 'gulp-minify-css'
uglify = require 'gulp-uglify'
source = require 'vinyl-source-stream'
streamify = require 'gulp-streamify'

# Directories

src =
  coffee: 'src/coffee/**/*.coffee'
  coffee_index: './src/coffee/index.coffee'
  stylus: 'src/stylus/index.styl'
  jade: 'src/jade/index.jade'

dest =
  js: 'bin/js/'
  js_index: 'index.js'
  css: 'bin/css/'
  html: '.'

# Tasks

gulp.task 'coffee', ->
  browserify
    entries: src.coffee_index
    extensions: ['.coffee']
  .transform 'coffeeify'
  .bundle()
  .pipe source dest.js_index
  .pipe streamify uglify()
  .pipe gulp.dest dest.js

gulp.task 'stylus', ->
  gulp.src src.stylus
    .pipe stylus()
    .pipe prefix()
    .pipe minify()
    .pipe gulp.dest dest.css

gulp.task 'jade', ->
  gulp.src src.jade
    .pipe jade()
    .pipe gulp.dest dest.html

gulp.task 'watch', ->
  gulp.watch src.coffee, ['coffee']
  gulp.watch src.stylus, ['stylus']
  gulp.watch src.jade, ['jade']

gulp.task 'default', ['jade', 'stylus', 'coffee', 'watch']