browserSync   = require 'browser-sync'
gulp          = require 'gulp'
gutil         = require 'gulp-util'
watch         = require 'gulp-autowatch'
webpack       = require 'webpack'
webpackConfig = require './webpack.config'

gulp.task 'browser-sync', ->
  browserSync.init ['./public/*.html', './public/**/*.css', './public/**/*.js'],
    server:
      baseDir: './public'

gulp.task 'webpack', ->
  webpack webpackConfig, (err, stats) ->
    throw new gutil.pluginError 'webpack', err if err

gulp.task 'watch', ->
  watch gulp,
    webpack: [
      './client/**/*.js'
      './client/**/*.jsx'
      './client/**/*.cjsx'
      './client/**/*.coffee'
    ]

gulp.task 'build', ['webpack']

gulp.task 'default', ['build', 'watch', 'browser-sync']
